''------------------------------------------------------------------------------------------------
'' Commodore 64 Two Color VGA Display Demo
''
'' Copyright (c) 2018 Mike Christle
'' See end of file for terms of use.
''
'' History:
'' 1.0.0 - 10/10/2018 - Original release.
'' 1.1.0 - 10/31/2018 - Add RChar routine to print in reverse.
'' 1.2.0 - 11/02/2018 - Add blinking cursor.
'' 1.2.1 - 11/05/2018 - Fix errors in Line routine.
'' 1.3.0 - 11/12/2018 - Add LineTo routine to draw a series of lines.
''------------------------------------------------------------------------------------------------

CON

  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

OBJ

  C64 : "C64_2C_VGA.spin"
  pst : "Parallax Serial Terminal"

PUB Main | I, J, C

  pst.Start(115200)

  'Set the pin_group number for your board
  C64.Start(2)

  'Backgound and foreground colors
  C64.Color(0, C64#DK_BLUE)
  C64.Color(1, C64#LT_TEAL)

  'Character set from 32 to 255
  'C := 32
  'repeat J from 0 to 13
  '  C64.Pos(1, J)
  '  repeat I from 0 to 15
  '    C64.Char(C)
  '    C += 1

  'Test String
  C64.Pos(0, 0)
  'C64.StrA2(string(" String  "))
  C := 65
  repeat J from 0 to 25
    C64.CharA2(156)
    C += 1
  
  'return  
  C64.Pos(39,2)
  C64.CharA2(65)
  C64.Pos(39,23)
  C64.CharA2(65)
    
  C64.Pos(0,0)
  C64.CharA2(65)
  C64.Pos(1,0)
  C64.CharA2(65)
  C64.Pos(2,0)
  C64.CharA2(65)
  C64.Pos(3,0)
  C64.CharA2(65)
  C64.Pos(4,0)
  C64.CharA2(65)
  C64.Pos(5,0)
  C64.CharA2(65)
  C64.Pos(6,0)
  C64.CharA2(65)
  C64.Pos(7,0)
  C64.CharA2(65)
  C64.Pos(8,0)
  C64.CharA2(65)
  C64.Pos(9,0)
  C64.CharA2(65)
  
  C64.Pos(10, 10)
  C64.StrA2(string("HELLO WORLD"))
  C64.Pos(15, 12)
  C64.StrA2(string("APPLE ]["))
  C := 65
  C64.Pos(0, 0)
  repeat J from 0 to 25
    C64.CharA2(C)
    C += 1
  
  'C64.Pos(20, 10)
  'C64.CharA2(69)
  '4 pixels in a row
  'C64.Pixel(1, 140, 4)
  'C64.Pixel(1, 142, 4)
  'C64.Pixel(1, 144, 4)
  'C64.Pixel(1, 146, 4)

  'A pixel in each corner of the screen
  'C64.Pixel(1, 0, 0)
  'C64.Pixel(1, 0, C64#HEIGHT - 1)
  'C64.Pixel(1, C64#WIDTH - 1, 0)
  'C64.Pixel(1, C64#WIDTH - 1, C64#HEIGHT - 1)

  'Line Pattern
  'C64.Line(1, 140, 30, 158, 30)
  'C64.LineTo(1, 158, 48)
  'C64.LineTo(1, 140, 48)
  'C64.LineTo(1, 140, 30)
  'C64.LineTo(1, 149, 20)
  'C64.LineTo(1, 158, 30)
  'C64.LineTo(1, 149, 40)
  'C64.LineTo(1, 140, 30)

  C64.Cursor(TRUE)


PRI dec(val) 
 
    prn(val)


PRI prn(val) | dig

    dig := 48 + (val // 10)
    val := val/10
    if val > 0
        prn(val)
    print(dig)
    
PRI print(char)
    C64.Char(char)   

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