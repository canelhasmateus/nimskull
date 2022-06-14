discard """
joinable: false
description: "Internal error when assigning seq for type that have custom = operator #7346"
tags: [ ]
"""

# This bug could only be reproduced with --newruntime

type
  Obj = object
    a: int

proc `=`(a: var Obj, b: Obj) = discard

let a: seq[Obj] = @[] # bug #7346
let b = newSeq[Obj]() # bug #7345

