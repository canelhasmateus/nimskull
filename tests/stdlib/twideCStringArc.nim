discard """
  cmd: "nim c --gc:arc $file"
  output: "Test"
  description: "$(s: WideCString) changes result to repr on --gc:arc , issues #15663"
"""

let ws = newWideCString("Test")
echo ws
