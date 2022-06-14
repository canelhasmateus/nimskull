discard """
  errormsg: "cannot convert array[0..0, string] to varargs[string]"
  line: 11
  description: "varargs with array ignores leading arguments ;#8172"
"""
proc f(v: varargs[string]) =
  echo(v)

f("b", "c")   # Works
f(["b", "c"]) # Works
f("b", ["c"]) # Fails

