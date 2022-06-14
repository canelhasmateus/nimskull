discard """
  output: "seq[float]\n0"
  targets: "c cpp"
  description: "inheriting from specialized generic object and calling generic proc generate wrong field type #5570; Wrong type substituted for generic parameter #5602"
  tags: [generics, proc, overload, inheritance]
"""

# https://github.com/nim-lang/Nim/issues/5602

import typetraits, module_with_generics

type
  Foo[T] = object of RootObj
  Bar[T] = object of Foo[seq[T]]

proc p[T](f: Foo[T]): T =
  echo T.name

var s: Bar[float]
echo p(s).len # the bug was: p(s) should return seq[float], but returns float instead

# Test overloading and code generation when
# downcasting is required for generic types:
var d = makeDerived(10)
setBaseValue(d, 20)


