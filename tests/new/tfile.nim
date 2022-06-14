discard """
  nimoutFormat: sexp
  cmd: "nim c --msgFormat=sexp --filenames:canonical $file"
"""

{.hint: "hint".} #[tt.Hint
     ^ (User :str "hint") ]#