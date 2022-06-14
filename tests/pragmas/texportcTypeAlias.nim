discard """
  errormsg: "{.exportc.} not allowed for type aliases"
  line: 9
  description: "C++ codegen: type alias with exportc leads to incorrect generated code; exortc not allowed for type aliases; #5149"
  tags : [ exportc ; codegen ; BackendC++ ; TypeAlias]
"""

type
  X* = object
    a: int
  Y* {.exportc.} = X

proc impl*(x: X) =
  echo "it works"

