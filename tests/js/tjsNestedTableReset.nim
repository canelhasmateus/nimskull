discard """
description: "JS backend crashes when trying to reset a Table inside a Table #11697"
tags: [ nesting , tables, reset , backend_js ]
"""

import tables

var xs: Table[int, Table[int, int]]

doAssertRaises(KeyError): reset xs[0]

