discard """
  output: '''
a -> 2
a <- 2
'''
description: "when a is global, it's a "fat pointer": so it's an array with one element which is the actual object.
              However the for loop is for (.. in a_) so it iterates through the array instead through it's [0].
              If it's in a function, it works correctly, but because for some reason a is just the object instead of a fat pointer (which I am not sure why) ; Automatic deref for everything but
              pointers in asm/emit #8891"
tags: [ deref , pointers, array , backend_js, codegen , iterators]
"""

import jsffi

var a = JsAssoc[cstring, int]{a: 2}

for z, b in a:
  echo z, " -> ", b

proc f =
  var a = JsAssoc[cstring, int]{a: 2}

  for z, b in a:
    echo z, " <- ", b

f()

