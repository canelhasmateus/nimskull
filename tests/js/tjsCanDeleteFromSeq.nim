discard """
  output: '''
@[42]
@[24, 42]
'''
description: "Seq delete not working"
tags: [ 'seq', codegen , backend_js ]
"""

var x = @[42,4242]
x.delete(1)
echo x
x.insert(24)
echo x

