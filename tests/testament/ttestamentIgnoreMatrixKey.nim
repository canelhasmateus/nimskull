discard """
  matrix:"-d:nimTest_t16576"
  description: "testament can silently ignore matrix spec , issues #16576"
"""

# bug #16576
doAssert defined(nimTest_t16576)
doAssert not defined(nimMegatest)

