discard """
  errormsg: "invalid type: 'openArray[int]' for result"
  line: 6
  description: "Auto deduction sidesteps the check enforcing that no procedure returns an open array; issues #8259"
  tags: [ proc, auto-deduction, open-array , Type-System , Type-Inference]
"""

proc foo(a: openArray[int]):auto = a
echo foo(toOpenArray([1, 2], 0, 2))

