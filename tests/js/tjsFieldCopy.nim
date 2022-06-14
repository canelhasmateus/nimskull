discard """
  output: "{ b: 2 }"
  description: "small nimCopy jsgen bug: field is not copied to #12303"
  tags : [ js, codegen, cast, copy , var ]
"""

import jsconsole, jsffi

type
  A = ref object
   b: B

  B = object
    b: int

var a = cast[A](js{})
a.b = B(b: 2)
console.log a.b

