discard """
  targets: "cpp"
  action: "compile"
  description: "Invalid C++ code generation when returning discardable var T ; unintiated references ;  I confirm that it's the discardable pragma that causes an issue, this works (with more
  fleshed out importcpp) but using a discardable instead doesn't #10241"
  tags: [ "cpp",  "discard" , "pragma" , codegen]
"""

type
  String* {.importcpp: "std::string", header: "string".} = object

proc initString*(): String
    {.importcpp: "std::string()", header: "string".}

proc append*(this: var String, str: String): var String
    {.importcpp: "append", header: "string", discardable.}

var
  s1 = initString()
  s2 = initString()

s1.append s2

