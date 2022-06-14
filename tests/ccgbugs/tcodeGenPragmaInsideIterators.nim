discard """
  ccodecheck: "__restrict__"
  action: compile
  joinable: false
  description: "Pragma codegenDecl doesn't work inside iterators #6497"
  tags: [codegen, pragma, iterators ]
"""

# see bug #16027 and #6497
iterator myitems(s: seq[int]): int =
  var data {.codegenDecl: "$# __restrict__ $#".} : ptr int = nil
  yield 1

for i in @[1].myitems:
  discard

