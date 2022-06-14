discard """
  errormsg: "illegal recursion in type 'Node'"
  description: "Infinite recursion through semOverloadedCallAnalyseEffects with ref-recursive tuple, issues #7012"
"""

type Node[T] = tuple
    next: ref Node[T]
var n: Node[int]
