discard """
  errormsg: "'testEpo' can have side effects"
  line: 8
  description: "I write a func that call the non-deterministic times.epochTime() and Nim compiles it without error or warning; #13306"
  tags: [ EffectSystem ; Func  ; Regression ]
"""

import times

func testEpo(x: float): float = epochTime() + x

echo testEpo(1.0)

