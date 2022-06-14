discard """
  errormsg: "type \'ptr void\' is not allowed"
  line: 6
  description: "it shouldn't crash but you can use 'pointer' instead, issues #6456"
"""
proc foo(x: ptr void) =
  discard

