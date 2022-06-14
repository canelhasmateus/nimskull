discard """
  cmd: "nim c -d:useGcAssert $file"
  joinable: false
  description: "Calling GC_ref() on an empty string when running with -d:useGcAssert causes a GCASSERT error (which is different than if the string is non-empty). , issues #10307"
"""

proc someProc(x:bool): cstring =
  var res:string = ""
  if x:
    res = "yes"
  GC_ref(res)
  result = res

doAssert someProc(true) == "yes".cstring
doAssert someProc(false) == "".cstring

