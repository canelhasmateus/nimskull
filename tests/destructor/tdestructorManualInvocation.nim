discard """
  matrix: "--gc:refc; --gc:arc"
  output: '''
1
2
here
2
1
'''
description: "Enable manual destructor invocation for implicitly generated destructors ; Right now, it does not appear to be possible to manually invoke the destructor for a type when that
destructor is defined implicitly, ie, it contains a destructable type.; #5342"
tags: [ desctructors ]
"""


type
  A = object
    id: int
  B = object
    a: A
proc `=destroy`(a: var A) = echo a.id
var x = A(id: 1)
var y = B(a: A(id: 2))
`=destroy`(x)
`=destroy`(y)
echo "here"
