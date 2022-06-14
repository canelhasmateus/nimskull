discard """
  errormsg: "Your case statement contains too many branches, consider using if/else instead!"
  description: "JS codegen can produce extreme switch statements with case a of range; #8821"
  tags: [ case, branches, backend_js ]
"""

proc isInt32(i: int): bool =
  case i 
  of 1 .. 70000:
    return true
  else:
    return false

discard isInt32(1)
