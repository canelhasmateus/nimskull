discard """
cmd: "nim check $file"
errormsg: "invalid type: 'typedesc[int]' in this context: 'array[0..0, typedesc[int]]' for var"
nimout: '''
tArrayTypeDesc.nim(10, 5) Error: invalid type: 'type' in this context: 'array[0..0, type]' for var
tArrayTypeDesc.nim(11, 5) Error: invalid type: 'typedesc[int]' in this context: 'array[0..0, typedesc[int]]' for var
'''
description: '''
  . From https://github.com/nim-lang/Nim/pull/13261,
    https://github.com/nim-lang/Nim/issues/7331,
    https://github.com/nim-lang/Nim/issues/9932,
  . Compiler should crash when using typedesc inside of array.
'''
"""
var y: array[1,type]
var x = [int]

