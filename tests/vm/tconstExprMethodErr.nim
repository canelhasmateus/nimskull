discard """
  errormsg: "cannot call method eval at compile time"
  line: 14
  description: "const expression calling methods not reported as error by the compiler, issue #2574"
"""

type
  PExpr = ref object of RootObj

method eval(e: PExpr): int =
  discard

static:
  let x = PExpr()
  discard x.eval

