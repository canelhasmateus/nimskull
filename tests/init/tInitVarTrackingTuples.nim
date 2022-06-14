discard """
  nimout: '''
tInitVarTrackingTuples.nim(14, 7) Hint: BEGIN [User]
tInitVarTrackingTuples.nim(25, 7) Hint: END [User]
  '''

output: '''
1
1
1
'''
  description: "Incorrect 'Cannot prove that 'y' is initialized' caused by tuple assignment, issues #8314"
"""

{.hint: "BEGIN".}
proc foo(x: range[1..10]) =
  block:
    var (y,) = (x,)
    echo y
  block:
    var (_,y) = (1,x)
    echo y
  block:
    var (y,_,) = (x,1,)
    echo y
{.hint: "END".}

foo(1)

