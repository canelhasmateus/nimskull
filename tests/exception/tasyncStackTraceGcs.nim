discard """
  matrix: "--gc:arc; --gc:refc"
  description: "Stacktrace when using async with arc/orc is different than when using refc, issues #18620"
"""

proc hello() =
  raise newException(ValueError, "You are wrong")

var flag = false

try:
  hello()
except ValueError as e:
  flag = true
  doAssert len(getStackTraceEntries(e)) > 0
  doAssert len(getStackTraceEntries(e)) > 0

doAssert flag

