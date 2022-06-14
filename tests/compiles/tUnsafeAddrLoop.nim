discard """
  output: '''
foo
bar
'''
  description: "Cannot use unsafeAddr on an element from for loop, issues #8630"
"""

proc test(strings: seq[string]) =
  for s in strings:
    var p3 = addr(s)
    echo p3[]

test(@["foo", "bar"])

