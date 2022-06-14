discard """
  cmd: "nim doc -r $file"
  errormsg: "runnableExamples must appear before the first non-comment statement"
  line: 10
  description: "runnableExamples silently ignored if placed after some code ;#17615"
  tags: [ runnableExamples, nimdoc ]
"""

func fn*() =
  ## foo
  discard
  runnableExamples:
    assert true

