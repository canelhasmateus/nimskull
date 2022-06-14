discard """
  errormsg: '''ambiguous call'''
  line: 10
  disabled: "32bit"
  description: "local macro overrides imported macro silently; #6448"
  tags : [ Scope, Override, Macro ,  ]
"""

import foobar, barfoo
import macros

proc bar() {.async.} =
  echo 42

proc foo() {.async.} =
  bar()

foo()

