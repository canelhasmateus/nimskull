discard """
  output: '''
18
'''
description: "Can't get ord of a value of a Range type in the JS backend #14570"
tags: [ ord, Range, js , codegen ]
"""

type A = range[15 .. 30]

let a: A = 18

echo ord(a)

