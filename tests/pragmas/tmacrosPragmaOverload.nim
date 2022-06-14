discard """
description: "Macros not subjected to overload resolution when used as pragmas. #4384"
tags: [ Macros, Pragmas, Overload , Regression]
"""
macro testMacro(body: untyped): untyped = discard
macro testMacro(s: string, body: untyped): untyped = discard
proc foo() {.testMacro: "foo".} = discard

