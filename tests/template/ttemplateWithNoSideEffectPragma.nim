discard """
  output: '''
start
side effect!
end
'''
description: "no side effect pragma problem; #6217"
tags: "template, pragma, sideEffects, regressionTest"
"""

# bug #6217

template optMul{`*`(a, 2)}(a: int{noSideEffect}): int = a+a

proc f(): int =
  echo "side effect!"
  result = 55

echo "start"
doAssert f() * 2 == 110
echo "end"

