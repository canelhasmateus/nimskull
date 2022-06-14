discard """
  matrix: "--gc:refc; --gc:orc"
  description: "Codegen bug with Table mvalues in loop and ARC & ORC GC #16374; Putting it into procs seems to work"
  tags: [iterators , table, gc_arc , error_compile , top_level ]
"""

block:
  iterator mvalues(t: var seq[seq[int]]): var seq[int] =
    yield t[0]

  var t: seq[seq[int]]

  while false:
    for v in t.mvalues:
      discard

  proc ok =
    while false:
      for v in t.mvalues:
        discard

  ok()

block:
  iterator mvalues(t: var seq[seq[int]]): lent seq[int] =
    yield t[0]

  var t: seq[seq[int]]

  while false:
    for v in t.mvalues:
      discard

  proc ok =
    while false:
      for v in t.mvalues:
        discard

  ok()


