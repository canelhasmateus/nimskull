discard """
  output: '''
0
@[@[0, 1]]
'''

description: "JS compiler error related to implicit return and return var type #11354"
tags : [ codegen, backend_js , implicit_return , var_types ]
"""

type
  TrackySeq[T] = object
    s: seq[T]
    pos: int

proc foobar(ls: var TrackySeq[seq[int]], i: int): var seq[int] =
  echo ls.pos  # removing this, or making the return explicit works
  ls.s[i]

var foo: TrackySeq[seq[int]]
foo.s.add(@[0])
foo.foobar(0).add(1)
echo foo.s
