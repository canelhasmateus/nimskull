discard """
description: "Error with distinct generic TableRef #6060; Curiously, it does seem to work when Table is used instead of TableRef; Coercions with distinct types should traverse pointer modifiers transparently. #7165"

tags: [ error_compile , generics, distinct ,  ref , cast?]

While it's possible to "cast" the original type to its distinct counterpart directly, when a ref modifier is added, this coercion gets rejected.;
The problem seems to be limited to generic types, because a simplified version of the code works correctly;
Is it an issue though? It seems that a ref distinct T is not the same as a distinct ref T, which makes sense to me
"""
import tables

type MyTab[A,B] = distinct TableRef[A,B]

proc `$`[A,B](t: MyTab[A,B]): string =
  "My special table " & $TableRef[A,B](t)

proc create[A,B](): MyTab[A,B] = MyTab(newTable[A,B]())

var a = create[int,int]()
doAssert $a == "My special table {:}"

