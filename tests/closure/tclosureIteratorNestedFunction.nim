discard """
  output: "@[\"42\"]"
  description: "Iterating closure iterator in nested function is empty, issues #8550"
"""

proc chk_fail(): seq[string] =
  iterator x(): int {.closure.} = yield 42
  proc f(cl: iterator(): int {.closure.}): seq[string] =
    result = @[]
    for i in cl(): result.add($i)
  result = f(x)

echo(chk_fail())

