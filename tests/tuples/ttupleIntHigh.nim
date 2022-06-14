discard """
  disabled: i386
  description: "uint.high -1 broken in tuple, issues #12892"
"""

template works[T](): auto = T.high - 1
template breaks[T](): auto = (T.high - 1, true)
doAssert $works[uint]() == "18446744073709551614"
doAssert $breaks[uint]() == "(18446744073709551614, true)"

