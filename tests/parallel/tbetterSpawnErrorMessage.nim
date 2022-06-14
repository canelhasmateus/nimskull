discard """
  matrix: "--threads:on"
  errormsg: "'spawn' takes a call expression; got: proc (x: uint32) = echo [x]"
  description: "Poor error message for spawn when a procedure (without calling it) is passed, issues #7535"
"""

import threadpool

# bug #7535
proc print_parallel_nok(r: uint32) =
  for x in 0..r:
    spawn (proc (x: uint32) = echo x)

