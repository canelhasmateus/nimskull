discard """
action: compile
description: "Multiple generic table types with different type signatures lead to compilation errors. #3669; Removing the inodes field, switching inodes and rnodes in the declaration, or making inodes a Table[int,int] makes the code compile."
tags: [ generics , tables, error_compile ]
"""

# bug #3669

import tables

type
  G[T] = object
    inodes: Table[int, T]
    rnodes: Table[T, int]

var g: G[string]
echo g.rnodes["foo"]

