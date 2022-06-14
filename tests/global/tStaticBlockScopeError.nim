discard """
  errormsg: "undeclared identifier: 'a'"
  line: 9
  description: " incomplete code generation when using a compile time variable at run time (undeclared identifier) issue #5958, #6036"
"""

static:
  var a = 1

echo a

