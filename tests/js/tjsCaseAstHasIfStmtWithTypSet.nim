discard """
description: "case expression with if generates AST nkIfStmt without typ, breaking JS backend #7534 ;  for case, a nkCaseStmt is generated, and within it, a nkIfStmt - this nkIfStmt doesn't have its typ set, even though the right thing to do in this case would be to generate an nkIfExpr with typ set (it's an expression after all.. or just deprecate nkIfExpr, but at least set the typ"
"""
proc f(x: int): int =
  result = case x
    of 1: 2
    elif x == 2: 3
    else: 1

doAssert 2 == f(f(f(f(1))))

