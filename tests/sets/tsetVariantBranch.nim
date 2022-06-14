discard """
  matrix: "--gc:refc; --gc:arc"
  description: "error when a discriminator branch is constructed with certain sets; issues #5792"
  tags: [Variants  ; Sets ; RegressionTest ]
"""

type
  T = enum
    a
    b
    c
  U = object
    case k: T
    of a:
      x: int
    of {b, c} - {a}:
      y: int

doAssert U(k: b, y: 1).y == 1

