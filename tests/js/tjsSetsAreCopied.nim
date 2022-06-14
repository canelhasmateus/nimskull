discard """
  output: '''
{}
{}
'''

description: [ set, global, scope, backend_js, copy ]
"""

proc foo() =
  var bar: set[int16] = {}
  echo bar
  bar.incl(1)

foo()
foo()

