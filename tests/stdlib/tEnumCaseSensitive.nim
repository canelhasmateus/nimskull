discard """
description: "issues #7686"
"""

import strutils

type
  MyEnum = enum
    A,
    a

doAssert parseEnum[MyEnum]("A") == A
doAssert parseEnum[MyEnum]("a") == a

