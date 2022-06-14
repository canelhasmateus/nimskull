discard """
  targets: "c cpp"
  description: "marshal.nim can't be compiled for the cpp backend #8967; Sometimes sets are materialized as arrays and we must treat them as
                                                                         such: the CPP backend is pickier than the C one and would sometimes
                                                                         produce invalid code."
  tags: [codegen, backend_cpp , seq, generics, error_compile, array]
"""

import marshal

let orig: set[char] = {'A'..'Z'}
let m = $$orig
let old = to[set[char]](m)
doAssert orig - old == {}

