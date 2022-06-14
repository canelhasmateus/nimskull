discard """
  targets: "cpp"
  description: "cpp codegen: broken variable definition in defer outside a proc definition; #4834"
  tags: [ Defer , proc, backend_cpp , codegen]
"""

# issue #4834
block:
  defer:
    let x = 0


proc main() =
  block:
    defer:
      raise newException(Exception, "foo")

doAssertRaises(Exception):
  main()

