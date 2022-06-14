discard """
description : "1 mod 0 gives NaN with JS backend #7127"
tags: [ backend_js , error ]
"""
doAssertRaises(DivByZeroDefect): discard 1 mod 0
doAssertRaises(DivByZeroDefect): discard 1 div 0
