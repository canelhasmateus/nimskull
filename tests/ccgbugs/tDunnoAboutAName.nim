discard """
  output: "[p = nil]"
  targets: "c cpp"
  description: "C++ Atomics in union: ::<unnamed union>::<unnamed struct>::field with constructor not allowed in anonymous aggregate #13062"
  tags: [ backend_cpp , pragma , atomics , union ]
"""

import atomics

type
  Pledge* {.exportc.} = object
    p: PledgePtr

  PledgeKind {.exportc.} = enum
    Single
    Iteration

  PledgePtr {.exportc.} = ptr object
    case kind: PledgeKind
    of Single:
      impl: PledgeImpl
    of Iteration:
      discard

  PledgeImpl {.exportc.} = object
    fulfilled: Atomic[bool]

var x: Pledge
echo x.repr

