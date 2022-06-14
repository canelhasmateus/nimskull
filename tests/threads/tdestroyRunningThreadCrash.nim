discard """
  output: '''
In doStuff()
In initProcess()
initProcess() done
TEST
Crashes before getting here!
'''
  joinable: false
  description: " hread object being destroyed, while the thread is still running. In this particular case, I believe the Thread object was on the stack, but I assume the same would happen with a GCed Thread object.
  , issues #7172"
"""

import std/os

proc whatever() {.thread, nimcall.} =
  echo("TEST")

proc initProcess(): void =
  echo("In initProcess()")
  var thread: Thread[void]
  createThread(thread, whatever)
  echo("initProcess() done")
  joinThread(thread)

proc doStuff(): void =
  echo("In doStuff()")
  # ...
  initProcess()
  sleep(500)
  # ...
  echo("Crashes before getting here!")

doStuff()

