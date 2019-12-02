''------------------------------------------------------------------------------------------------
'' Commodore 64 Two Color Fast VGA Display Demo
''
'' Copyright (c) 2018 Mike Christle
'' See end of file for terms of use.
''
'' History:
'' 1.0.0 - 10/10/2018 - Original release.
'' 1.1.0 - 10/31/2018 - Add CChar routine to better control character colors.
'' 1.2.0 - 11/02/2018 - Add blinking cursor.
'' 1.3.0 - 11/12/2018 - Add LineTo routine to draw a series of lines.
'' 2.0.0 - 11/16/2018 - Add assembly routines to replace Pixel, Char and Line functions.
''------------------------------------------------------------------------------------------------

CON

    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000
    BasePin   = 16                          ' P16-P20 VGA
    SDA_pin = 29
    SCL_pin = 28      
    
    Line_Buffer_Size = 60
    TX_FLAG = 26    'I2C register set when there's a byte being transmitted
    RX_FLAG = 27    'I2C register set when byte is received at video processor
    TX_BYTE = 28    'I2C register which holds the byte being transmitted
    REG_FLAG = $FA  'this value indicates that the tx_flag or rx_flag is set                                  ' 
    RX_READY = 25   'I2C register set when ready  to receive from keyboard
    TXRX_TIMEOUT = 15_000
    {DATA PINS}
    D0 = 0
    D7 = 7
    
    {ADDRESS PINS}
    A0 = 8
    A7 = 15
    A8 = 21
    A14 = 27
    
    {WRITE ENABLE PIN}
    WE = 30
    
    {MODES}
    MODE_MONITOR = 1
    MODE_RETROII = 2
    MODE_ASSEMBLER = 3
    MODE_SD_CARD_1 = 4 'disk selection
    MODE_SD_CARD_2 = 5 'program selection
    MODE_SD_CARD_3 = 6 'program download 

VAR
                                            '                             
'    byte vgabuff[vga#cols * vga#rows * 2]   ' VGA Text-Buffer 1. Byte = Character, 2. Byte = Color (bgc * 16 + fgc)           
'    byte cursor[6]                          ' Cursor info array 
    long sync                               ' sync used by VGA routine

    long pos                                ' Global Screen-Pointer
    long bpos                               ' Global Screen-Pointer
    byte line_buffer[Line_Buffer_Size]
    long row_num
    byte ascii_buffer[16]
    byte cursor_x
    byte line_count
    long current_mode
    byte rx_error  
    long soft_switches
    byte soft_switches_updated 
    long cog_soft_switches
    long cog_ss_stack[20]

OBJ

    C64 : "C64_4CF_VGA.spin"
    slave : "I2C slave v1.2"

PUB Main | I, J, C
    init
    repeat
        'index := slave.check_reg(29) 'check for new mode
        'if index > -1
        '    current_mode := index
            
        case current_mode
            MODE_MONITOR: 
                run_monitor
            MODE_RETROII:
                run_retroii
            MODE_SD_CARD_1:
                run_sd_disk_select
            MODE_SD_CARD_2:
                run_sd_prog_select
            MODE_SD_CARD_3:
                run_sd_file_download

PRI ascii_2bin(ascii) | binary

    if ascii < 58                   'if ascii number (dec 48-57)
        binary := ascii -48 'subtract 48 to get dec equivalent
    else
        binary := ascii -55 'else subtract 55 for ABCDEF 
    
    return binary
   
    
PRI init | i, x, y
    soft_switches_updated := FALSE
    current_mode := MODE_RETROII
    row_num := 0
    dira[21..23]~~
    slave.start(SCL_pin,SDA_pin,$42) 
    C64.Start(2)
    'Backgound and foreground colors
    C64.Color(0, C64#RED) 'BLACK
    C64.Color(1, C64#BLUE) 'GREEN
    C64.Color(2, C64#RED)
    C64.Color(3, C64#BLUE) 'GREEN
'    vga.start(BasePin, @vgabuff, @cursor, @sync)
'    cursor[2] := %010
'    cursor[1] := 0
'    cursor[0] := 0
'    cursor_x := 0
    
    waitcnt(clkfreq * 1 + cnt)                     'wait 1 second for cogs to start

    cls
    

    'setup address/data/control lines
    dira[D0..D7]~~  'output
    outa[D0..D7] := %00000000   'low
    
    dira[A0..A7]~~  'output
    outa[A0..A7] := %00000000   'low
    dira[A8..A14]~~ 'output
    outa[A8..A14] := %0000000 'low
    
    dira[WE]~~      'output
    outa[WE]~~      'set we high to avoid writing data
    
    cog_soft_switches := cognew(check_soft_switches, @cog_ss_stack) 

PRI check_soft_switches | index
   
    repeat
        waitcnt(100000 + cnt)
        index := slave.check_reg(30) 'check for soft switch changes
    
        if index > -1
            soft_switches := index
            soft_switches_updated := TRUE
                
PRI run_monitor | i, index
    'cursor[2] := %010   
    C64.Cursor(TRUE)
    i := 0
    line_count := 0
   
    print_header
    
    repeat
        index := slave.check_reg(29) 'check for new mode
        if index > -1
            current_mode := index
            QUIT 'mode changed, so exit out
        index := slave.check_reg(31)
        if index > -1
            if index == $0D 'enter key detected
                
                i := 0
                print_header
                parse_command
                setPos(0, 0)
                'cursor_x := 0
                line_count := 0
            else   
                print($07, $00, index)
                line_buffer[i] := index
                'cursor_x++
                'cursor[0] := cursor_x
                line_count++
                i++

PUB parse_command | addr, op, val, data, i, j, y, k, l, m, bulk_write, bulk_val, line_no
    '[address] will print value at that address
    '[address].[address] will print all values between those addresses
    '[address].[address]:[val] will write [val] to range of addresses
    '[address]:[val] will write values in consecutive memory locations starting at address
    
    line_no := 2
    setPos(0, line_no)
    
    'pull out address1, operation, and val from line_buffer
    addr := ((ascii_2bin(line_buffer[0])) << 12) | ((ascii_2bin(line_buffer[1])) << 8) | ((ascii_2bin(line_buffer[2])) << 4) | (ascii_2bin(line_buffer[3]))
    val := ((ascii_2bin(line_buffer[5])) << 12) | ((ascii_2bin(line_buffer[6])) << 8) | ((ascii_2bin(line_buffer[7])) << 4) | (ascii_2bin(line_buffer[8]))
    
    op := line_buffer[4]
    
    if op == "."
        if val > 0
            
            i :=  val - addr 'get difference between addresses and iterate
            j := addr
            
            'determine if this is a bulk write operation
            bulk_write := line_buffer[9]
            
            if bulk_write == ":"
                'get value to write
                bulk_val := ascii_2bin(line_buffer[10]) << 4 | ascii_2bin(line_buffer[11])
                repeat i + 1
                    write_byte(bulk_val, j)
                    j++
            else        
                repeat (i + 1) / 8
                    longfill(@ascii_buffer, 0, 4)
                    y := 0
                
                    hex($07, $03, j, 4)
                    str($07, $03, string(":"))
                    repeat 8 'display 8 bytes per line
                        data := read_byte(j)
                        hex($07, $00, data, 2)
                        str($07, $00, string(" "))
                        if data > 128
                            ascii_buffer[y] := (data - 128) 'convert from high ascii to low ascii
                        else
                            ascii_buffer[y] := data 
                        
                        y++
                        j++
                    y := 0
                
                    repeat 8 'display ascii
                        print($07, $00, ascii_buffer[y])
                        y++
                    if line_no > 28
                        line_no := 2
                        setPos(0, line_no)
                    else 
                        line_no++   
                        setPos(0, line_no)
                    
        else
            hex($07, $03, addr, 4)
            str($07, $03, string(":"))
            data := read_byte(addr)
            hex($07, $00, data, 2)
    elseif op == ":"
        'loop through rest of line_buffer and write each byte to incremental memory address
        l := 0
        
        repeat k from 0 to (line_count - 6) step 2
            val := ascii_2bin(line_buffer[k + 5]) << 4 | ascii_2bin(line_buffer[k + 6])
            write_byte(val, addr + l)
            l++
    else
        hex($07, $03, addr, 4)
        str($07, $03, string(":"))
        data := read_byte(addr)
        hex($07, $00, data, 2)
     
    
    'after everything, make sure to clear line_buffer
    bytefill(@line_buffer, 0, Line_Buffer_Size)
    
   
PRI print_header
    cls
    setPos(0, 1)
    str($07, $03, string("ADDR| 0| 1| 2| 3| 4| 5| 6| 7| ASCII"))
    setPos(0, 0)
    'cursor[0] := 0
    'cursor_x := 0
    
PRI run_sd_file_download | index, i, adr_lsb, adr_msb,address, length_lsb, length_msb, length
    
    cls
    'cursor[2] := 0
    C64.Cursor(FALSE)
    setPos(0,0)
    
    'get file name/address location/length 
    'start downloading to ram
    str($07, $00, string("UPLOADING FILE TO RAM "))
    
    is_rx_ready 'setup receiver
    'receive file name
    repeat 30
        index := rx_byte                
        print($07, $00, index - 128)
    
    'read address
    adr_lsb := rx_byte
    'hex($07, $00, adr_lsb,2)
    adr_msb := rx_byte
    'hex($07, $00, adr_msb,2)
    'read file length
    length_lsb := rx_byte
    'hex($07, $00, length_lsb,2)
    length_msb := rx_byte
    'hex($07, $00, length_msb,2)
    
    str($07, $00, string("address="))
    address := adr_msb << 8 | adr_lsb
    hex($07, $00, address,4)
    length := length_msb << 8 | length_lsb
    str($07, $00, string("length="))
    hex($07, $00, length,4)
    
    'read data
    'start at address. for i = 0 to length: write_byte(rx_byte,addr + i)
    i := 0
    repeat length
        index := rx_byte
        if rx_error == false 'only write valid data
            write_byte(index, address + i)
            'hex($07, $00, index, 2) 
            i++     
    
    rx_done 'rx finished
    str($07, $00, string("done"))
    repeat
        index := slave.check_reg(29) 'check for new mode
        if index > -1
            if index == MODE_MONITOR or index == MODE_SD_CARD_3 or index == MODE_RETROII or index == MODE_SD_CARD_1 or index == MODE_SD_CARD_2
                current_mode := index
                str($07, $03, string("mode changed"))
                dec($07, $03, index)
                QUIT 'mode changed, so exit out              
                
PRI run_sd_prog_select | index, i, rx_char, dos_ver, vol_num, cat_count, file_length, file_type, file_access
    cls
    'cursor[2] := 0 
    C64.Cursor(FALSE)
    setPos(0,0)
    cat_count := 0
    file_length := 0
    
    'slave.flush 'clears all 32 registers to 0                
    str($07, $00, string("DISK "))
    
    'read in catalog
    is_rx_ready 'setup receiver
    
    i := 0
    repeat 16
        rx_char := rx_byte
        'hex($07, $00, rx_char, 2)
        print($07, $00, rx_char)
        i++
    
   
            
    str($07, $00, string(" DOS 3."))
    dec($07, $00, rx_byte)
    
    str($07, $00, string(" VOL: "))
    dec($07, $00, rx_byte)
    
    setPos(0,2)
    cat_count := rx_byte
    str($07, $00, string("CATALOG:"))
    setPos(0, 3)
    str($07, $03, string("   FILE                TYPE  PERM SIZE "))
    
    'dec($07, $00, cat_count)    
    
    setPos(0,4)
    i := 1
    
    'str($07, $00, string("1. "))
    repeat cat_count 'end of transmission
        index := rx_byte
        'hex($07, $00, index, 2)
        'if index <> $04 'end of transmission
        dec($07, $00, i)
        str($07, $00, string(". "))
        print($07, $00, index - 128)
            
        repeat 19 'get rest of file name
            'print($07, $00, rx_byte) 
            index := rx_byte
            print($07, $00, index - 128)
            'hex($07, $00, rx_byte, 2)
            
            'index := rx_byte
            'hex($07, $00, index, 2) 'file type
        
        index := rx_byte
        'hex($07, $00, index, 2)
        'str($07, $00, string("   "))
        file_access := index & $80 'bitwise and to mask lock bit
        file_type := index & $0F 'mask first nibble which holds the file type
        
        'hex($07, $00, file_type, 2) 'file type
        if file_type == $04
            str($07, $00, string("BIN"))
        elseif file_type == $02
            str($07, $00, string("BAS"))
        else    
            str($07, $00, string("NA "))
            
        str($07, $00, string("   "))
        'hex($07, $00, file_access, 2) 'file access
        
        if file_access == $80
            str($07, $00, string(" R"))
        else
            str($07, $00, string("WR"))
        str($07, $00, string("   "))
        file_length := rx_byte 'file length ls byte (length in sectors)
        'hex($07, $00, file_length, 2) 'file length ls
        
        'index := rx_byte
        'hex($07, $00, index, 2) 'file length ms
        dec($07, $00, file_length * 256)
        
        setPos(0, i+4)
        i++
        'read file name
         
        'if index == $03 'end of line
        '    if i =< count_files_sent
        '        setPos(0,i+1)
        '        dec($07, $00, i)
        '    
        '        str($07, $00, string(". "))
        'i++
            
        'if index <> $04 'end of transmission
         '   print($07, $00, index)
                                
    rx_done 'rx finished
    
    repeat
        index := slave.check_reg(29) 'check for new mode
        if index > -1
            if index == MODE_MONITOR or index == MODE_SD_CARD_3 or index == MODE_RETROII or index == MODE_SD_CARD_1 or index == MODE_SD_CARD_2
                current_mode := index
                str($07, $03, string("mode changed"))
                dec($07, $03, index)
                QUIT 'mode changed, so exit out

PRI run_sd_disk_select | index, total_pages, current_page, count_files_sent, i
    cls
    'cursor[2] := 0 
    C64.Cursor(FALSE)
    setPos(0,0)
    index := 0
    slave.flush 'clears all 32 registers to 0                
    str($07, $00, string("SELECT DISK"))
    
    
    'receive the header
    'waitcnt(clkfreq * 1 + cnt)
    'tell kb processor we're ready to rx
    is_rx_ready 'setup receiver
    total_pages := rx_byte
    str($07, $00, string(" "))
    current_page := rx_byte
    str($07, $00, string(" "))
    count_files_sent := rx_byte
    str($07, $00, string(" "))
     
    setPos(0,1)
    str($07, $00, string("PAGE "))
    dec($07, $00, current_page)
    str($07, $00, string(" OF "))
    dec($07, $00, total_pages)
    'hex($07, $00, count_files_sent,2)
    setPos(0,2)
    i := 2
    
    if count_files_sent == 0
        dec($07, $00, string("no disks found"))
        return
        
    str($07, $00, string("1. "))
    repeat while index <> $04 'end of transmission
        
        index := rx_byte
        if index == $03 'end of line
            if i =< count_files_sent
                setPos(0,i+1)
                dec($07, $00, i)
            
                str($07, $00, string(". "))
            i++
            
        elseif index <> $04 'end of transmission
            print($07, $00, index)
                                
    rx_done 'rx finished
   
                              
    repeat
        index := slave.check_reg(29) 'check for new mode
        if index > -1
            if index == MODE_MONITOR or index == MODE_SD_CARD_3 or index == MODE_RETROII or index == MODE_SD_CARD_1 or index == MODE_SD_CARD_2
                current_mode := index
                str($07, $03, string("mode changed"))
                dec($07, $03, index)
                QUIT 'mode changed, so exit out

PRI rx_done
    'clear flags
    slave.put(RX_FLAG,$00)
    slave.put(RX_READY,$00)
    
PRI is_rx_ready             
    'clear flags
    slave.put(RX_FLAG,$00)
    slave.put(RX_READY,REG_FLAG)
                   
PRI rx_byte | tx_ready, data, i, new_data
    'wait till tx_flag is set
    rx_error := false
    
    i := 0
    'repeat while tx_ready <> REG_FLAG
    '    i++
    '    if i > TXRX_TIMEOUT
    '        str($07, $03, string("timed out"))
    '        return 'timeout
    '    tx_ready := slave.check_reg(TX_FLAG)
    
    new_data := -1
    repeat while new_data == -1 'until we have something new
        i++
        if i > TXRX_TIMEOUT
            rx_error := true 'flag system we had an error receiving
            'slave.put(RX_FLAG, REG_FLAG) 'set rx_flag
            'slave.put(TX_FLAG, $00) 'clear tx_flag
            str($07, $03, string("rx error"))
            return 'timeout
        new_data := slave.check_reg(TX_BYTE)
        
    data := new_data
    'slave.put(RX_FLAG, REG_FLAG) 'set rx_flag
    'slave.put(TX_FLAG, $00) 'clear tx_flag
    
    return data    
    
PRI run_retroii | index, mem_loc, mem_start, data, row, col, cursor_toggle, cursor_timer
    cls
    'cursor[2] := 0   
    C64.Cursor(FALSE)
    cursor_toggle := false
    cursor_timer := 0
    
    repeat
        'setPos(0,0)
        'hex($07, $03, soft_switches, 2)
        
        'next
        
        index := slave.check_reg(29) 'check for new mode
        if index > -1
            current_mode := index
            QUIT 'mode changed, so exit out
             '
        mem_loc := $400    'set starting address  
        mem_start := $00              
        row := 1  
        col := 0  
        
        cursor_timer++
        if cursor_timer == 2
            cursor_toggle := !cursor_toggle
            cursor_timer := 0
        'read Apple II Computer Graphics page 41 for example memory map of text/lores graphics
        repeat 3
            mem_loc := $400 + mem_start
            repeat 8
                col := 0
                repeat 40 'columns
                    data := read_byte(mem_loc)
                    if data == $60 'cursor
                        if cursor_toggle == true
                            printxy(col, row, $07, $00, 219)   'print cursor
                        else
                            printxy(col, row, $07, $00, 32)    'print space   
                    else
                        printxy(col, row, $07, $00, data - 128)'convert high ascii to low ascii
                        
                    col++
                    mem_loc++
                row++
                mem_loc += $58
            mem_start += $28

PRI cls
    C64.ClearScreen
    'wordfill(@vgabuff, $0720 , vga#cols * vga#rows)


PRI setPos(x, y)
    C64.Pos(x, y)
    'pos := (x + y * vga#cols) * 2


PRI print(fgc, bgc, char)
    C64.Char(char)
    'vgabuff[pos++] := char
    'vgabuff[pos++] := bgc * 16 + fgc


PRI printxy(x, y, fgc, bgc, char)

    setPos(x, y)
    print(fgc, bgc, char)


PRI str(fgc, bgc, string_ptr) 

    repeat strsize(string_ptr)
        print(fgc, bgc, byte[string_ptr++]) 


PRI strxy(x, y, fgc, bgc, string_ptr)
 
    setPos(x, y)
    str(fgc, bgc, string_ptr) 


PRI dec(fgc, bgc, val) 
 
    prn(fgc, bgc, val)


PRI prn(fgc, bgc, val) | dig

    dig := 48 + (val // 10)
    val := val/10
    if val > 0
        prn(fgc, bgc, val)
    print(fgc, bgc, dig)


PRI decxy(x, y, fgc, bgc, val)

    setPos(x, y)
    dec(fgc, bgc, val)


PRI bin(fgc, bgc, value, digits)
  
    value <<= 32 - digits
    repeat digits
        print(fgc, bgc, (value <-= 1) & 1 + "0") 


PRI binxy(x, y, fgc, bgc, value, digits)

    setPos(x, y)
    bin(fgc, bgc, value, digits)


PRI hex(fgc, bgc, value, digits) 

    value <<= (8 - digits) << 2
    repeat digits
        print(fgc, bgc, lookupz((value <-= 4) & $f : "0".."9", "A".."F")) 


PRI hexxy(x, y, fgc, bgc, value, digits)

    setPos(x, y)
    hex(fgc, bgc, value, digits)

pri write_byte(data_out, address) | i, msb, lsb
    'to write:
    lsb := address 
    msb := address >> 8
    'bin($07, $00, msb, 8)
    'bin($07, $00, lsb, 8)
    'we should start high
    outa[WE]~~
    'set data pins as input
    dira[D0..D7]~  'input /avoid bus contention
    'set address pins
    'outa[A0..A7] := address 
    outa[A7..A0] := lsb 
    outa[A14..A8] := msb
    'set we pin low for specified time
    outa[WE]~
    dira[D0..D7]~~  'output /avoid bus contention
    'i := 0
    'set data pins
    outa[D7..D0] := data_out
    'i := 0
    
    'bring we pin high to complete write
    outa[WE]~~
    dira[D0..D7]~  'input /avoid bus contention
    'i := 0
    outa[A0..A7] := %00000000 'low
    outa[A8..A14] := %0000000 'low

pri read_byte(address) | data_in, i, msb, lsb
    'to read:
    
    lsb := address 
    msb := address >> 8
    'set we pin high
    outa[WE]~~
    'set data pins as input
    dira[D0..D7]~
    'set address pins
    'outa[A0..A7] := address 
    outa[A7..A0] := lsb
    outa[A14..A8] := msb
    'wait specified time
    'i := 0
    'read data pins
    data_in := ina[D7..D0]
    'i := 0
    outa[A0..A7] := %00000000 'low
    outa[A8..A14] := %0000000 'low
    return data_in
     

{{
┌──────────────────────────────────────────────────────────────────────────┐
│                       TERMS OF USE: MIT License                          │                                                            
├──────────────────────────────────────────────────────────────────────────┤
│Permission is hereby granted, free of charge, to any person obtaining a   │
│copy of this software and associated documentation files (the "Software"),│
│to deal in the Software without restriction, including without limitation │
│the rights to use, copy, modify, merge, publish, distribute, sublicense,  │
│and/or sell copies of the Software, and to permit persons to whom the     │
│Software is furnished to do so, subject to the following conditions:      │                                                           │
│                                                                          │                                                  │
│The above copyright notice and this permission notice shall be included in│
│all copies or substantial portions of the Software.                       │
│                                                                          │                                                  │
│THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR│
│IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  │
│FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL   │
│THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER│
│LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING   │
│FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER       │
│DEALINGS IN THE SOFTWARE.                                                 │
└──────────────────────────────────────────────────────────────────────────┘
}}