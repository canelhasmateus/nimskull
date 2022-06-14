discard """
description: "VM crash with object variant, adding seq to seq field , issue #17039"
"""
type
  Obj1 = object
    case kind: bool
    of false:
      field: seq[int]
    else: discard

static:
  var obj1 = Obj1()
  obj1.field.add(@[])

