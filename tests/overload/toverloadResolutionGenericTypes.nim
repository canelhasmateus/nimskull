discard """
  description: " Since IntFoo is a concrete type, it should be preferred over a generic type object|tuple. issue #7416"
"""
type
  Foo[T] = object
  IntFoo = Foo[int]

proc bar(b: object|tuple) = discard
proc bar(b: IntFoo) = discard

var f: IntFoo
bar(f)
