discard """
  nimout: '''@["1", "2", "3"]'''
  description: "mapIt from sequtils not working in {.push compile_time.} context ; #12558"
  tags: [ compileTime , seqUtils , stdlib ]
"""

import sequtils

{.push compile_time.}

proc foo =
  echo map_it([1, 2, 3], $it)

{.pop.}

static:
  foo()


