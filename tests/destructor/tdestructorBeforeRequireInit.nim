discard """
  matrix: "--gc:refc; --gc:arc"
  description: "Constructing a named tuple of a requiresInit type causes destructions before initialization #16607"
  tags: [ namedtuple, destructor , pragma, requiresinit ]
"""

# bug #16607

type
  O {.requiresInit.} = object
    initialized: bool

proc `=destroy`(o: var O) =
  doAssert o.initialized, "O was destroyed before initialization!"

proc initO(): O =
  O(initialized: true)

proc pair(): tuple[a, b: O] =
  result.a = initO()
  result.b = initO()

proc main() =
  discard pair()

main()

