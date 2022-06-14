discard """
  output: '''
test1
test2
'''
description: "Compiler crash when using jsffi and compiles #11166 ; Combining the jsffi module with compiles statements involving dot calls can crash the compiler ; The problem seems to be caused by the . macro"
tags: [ macro , js , codegen , compiles ]
"""

import jsffi

type
  C = object
    props: int

var c: C

when compiles(c.props):
  echo "test1"

when not compiles(d.props):
  echo "test2"

