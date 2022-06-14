discard """
  targets: "cpp"
  action: "compile"
  description: "The compiler assumes that once the nodes reach genCall the symbol sym.loc.r points to a valid leafy rope but that's not the case when mangleDynLibProc is thrown in the mix. Using $ is a (possibly costly) solution or, as an alternative, we could just make mangleDynLibProc always produce a single rope piece."
  tags: [ codegen , cpp , dll , import ]
  """
"""

proc foo(): cstring {.importcpp: "", dynlib: "".}
echo foo()


## bug #9222
import os
import amodule
proc findlib2: string =
  let path = getEnv("MYLIB2_DOES_NOT_EXIST_PATH")
  if path.len > 0 and dirExists(path):
    path / "alib_does_not_matter.dll"
  else:
    "alib_does_not_matter.dll"

proc imported_func2*(a: cint): cstring {.importc, dynlib: findlib2().}

echo imported_func(1)
echo imported_func2(1)

# issue #8946

from json import JsonParsingError
import marshal

const nothing = ""
doAssertRaises(JsonParsingError):
  var bar = marshal.to[int](nothing)

