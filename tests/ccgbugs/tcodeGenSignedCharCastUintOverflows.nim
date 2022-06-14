discard """
description: "char to int conversion in string lookup leads to index out of bounds #10128; A signed char (in C) wraps around at 128 to -128. The conversion from -128 to NU (uint) then produces 18446744073709551488, because the signed byte is fileed up with 0xff bytes and then reinterpreted as unsigned."
tags: [ codegen , char, int, conversion, backend_c ]
"""
# bug #10128
let data = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
var seq2 = newSeq[char](data.len)
for i in 0..<data.len:
  seq2[i] = data[i]

let c = '\128'

# case 1
doAssert data[c.int] == 'y'
doAssert seq2[c.int] == 'y'

proc play(x: openArray[char]) =
  doAssert x[c.int] == 'y'

# case2
play(data)
play(seq2)
