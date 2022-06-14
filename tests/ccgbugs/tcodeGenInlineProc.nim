discard """
  output: true
  description: "proc with inline pragma passed to generic proc leads to bad codegen #5345"
  tags: [ proc, pragma, generic, inline , codegen]
"""

proc cmpx(d: int): bool {.inline.} = d > 0

proc abc[C](cx: C, d: int) =
  echo cx(d)
  
abc(cmpx, 10)

