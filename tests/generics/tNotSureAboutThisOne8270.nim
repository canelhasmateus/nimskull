discard """
  errormsg: "cannot instantiate: \'T\'"
  line: 6

related: "Do not crash while instantiating a generic outside a call #8279"
"""

proc m[T](x: T): int = discard
echo [m]

