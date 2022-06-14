discard """
cmd: "nim c -r -d:fulldebug -d:smokeCycles --gc:refc $file"
output: '''@["a"]'''
description: "GC Bug"
tags: [code_gen, gc, compiler_gcc , 32_bit_only, seqs ]
"""

# bug #6279
var foo = newSeq[tuple[a: seq[string], b: seq[string]]]()
foo.add((@["a"], @["b"]))
echo foo[0].a # Crashes on this line

