discard """
  action: run
  targets: '''c js'''
  description: "-0.0 (and expressions like -2.0 * 0.0) should give the floating point value for negative zero, but it gives the value for positive zero."
  tags: [codegen, backend_VM , floating_point ]
"""

import math
let x = -0.0
doAssert classify(x) == fcNegZero
doAssert classify(1 / -0.0) == fcNegInf
