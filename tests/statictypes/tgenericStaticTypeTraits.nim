discard """
output: "T[1, 1]"
description: "Static[T] generic type cause invalid type; #3784
tags: "Static Generic Typetraits RegressionTest"
"""

# https://github.com/nim-lang/Nim/issues/3784

import typetraits

type
  S[N: static[int]] = object
  T[A,B: static[int]] = object
  
  C = S[1]

var
  x: T[1,1]
  y: T[C.N, C.N]

echo y.type.name


