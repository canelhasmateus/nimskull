discard """
  errormsg: "Invalid field assignment '2'"
  file: "tincorrectArgSyntax_1.nim"
  line: 10
  description: "nim crashes when instancing with incorrect arg syntax; issues #5965"
"""
type Foo = object
  a, b, c: int

discard Foo(a: 1, 2)

