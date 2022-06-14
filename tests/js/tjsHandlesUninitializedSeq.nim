discard """
  action: "run"
  output: '''
caught
index out of bounds, the container is empty
'''
description: "except Exception as e: doesn't work with nim js when using unintialized seq #12223 ; "
tags : [ seq, unintialized,  exception_handling ]
"""

proc fun() =
  var z: seq[string]
  discard z[4]

proc main()=
  try:
    fun()
  except Exception as e:
    echo "caught"
    echo getCurrentExceptionMsg()

main()
