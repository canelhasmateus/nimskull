discard """
  targets: "c cpp js"
  output: '''
{'a', 'b'}
'''
description: "Regression: Runtime Error in peg function #9098; Taking the LHS type when a temporary result value was needed lead to bad
              code being generated if we get a tyRef. ; turn out the + operator for ref set trigger bad codegen"
tags : [ error_runtime , ]
"""

var x = new(ref set[char])
var y = new(ref set[char])
x[] = {'a'}
y[] = {'b'}
echo x[] + y[]

