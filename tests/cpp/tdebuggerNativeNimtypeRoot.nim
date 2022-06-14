discard """
  targets: "cpp"
  cmd: "nim $target --debugger:native $options $file"
  description: "debugger:native is currently unusable, coupled with gc and types diagnostics #9013"
"""

# The --debugger switch is needed in order to enable the defined(nimTypeNames)
# code path in hti.nim
import typeinfo
var tt: Any

