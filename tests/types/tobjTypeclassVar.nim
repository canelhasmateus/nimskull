discard """
errormsg: "invalid type: 'object' for var"
line: 6
description: "Trying to use object or tuple` typeclass as a variable's type crashes compiler, issues #6969 , #6461"
"""
var a: object

