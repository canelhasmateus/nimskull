discard """
  errormsg: '''
type mismatch: got <proc (a0: int): string{.noSideEffect, gcsafe, locks: 0.}>
'''
  line: 13
  description: "Compiler hangs forever instead of giving CT error; Construction of recurseive tyStatic Types. ; #Issues 9255"
  tags: "Static ; Recursive ; Types ; Regression Test"
"""
macro fun(a: static float): untyped =
  discard

when true:
  proc bar(a0: int): string = discard
  fun(bar)

