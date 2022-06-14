discard """
  nimout: '''
tinit_var_tracking_tuples.nim(14, 7) Hint: BEGIN [User]
tinit_var_tracking_tuples.nim(25, 7) Hint: END [User]
'''
description: '''
  . From https://github.com/nim-lang/Nim/issues/8314
    Incorrect 'Cannot prove that 'y' is initialized' caused by tuple assignment
  . If a normal assignment is used instead, the warning disappears.
  . Fixed by https://github.com/nim-lang/Nim/pull/8321
'''
"""

{.hint: "BEGIN".}
proc foo(x: range[1..10]) =
  block:
    var (y,) = (x,)
    doAssert y == x
  block:
    var (_,y) = (1,x)
    doAssert y == x
  block:
    var (y,_,) = (x,1,)
    doAssert y == x
{.hint: "END".}

foo(1)

