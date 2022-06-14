discard """
  errormsg: "Closure iterators are not supported by JS backend!"
  description: "Better error message when attempting to use closure iterators with js backend #7109"
  tags: [ backend_js, error, messages , closure_iterators ]
"""

iterator iter*(): int {.closure.} =
  yield 3

var x = iter

