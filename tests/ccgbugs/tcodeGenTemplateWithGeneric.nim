discard """
output: '''
(v: 3)
'''
description: "Error in template when using the type of the parameter inside it #6756"
tags: [ error_compilation , generics , template , codegen]
"""

import typetraits
type
  A[T] = ref object
    v: T

template templ(o: A, op: untyped): untyped =
  type T = typeof(o.v)

  var res: A[T]

  block:
    var it {.inject.}: T
    it = o.v
    res = A[T](v: op)
  res

let a = A[int](v: 1)
echo templ(a, it + 2)[]

