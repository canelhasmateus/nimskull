discard """
  matrix: "--threads:on"
  errormsg: "'spawn'ed function cannot have a 'typed' or 'untyped' parameter"
  description: " spawn echo() results in internal error, issues #9691 #10913"
"""

# bug #10913

import threadpool

proc useParallel*[T](unused: T) =
  # use a generic T here to show the problem.
  {.push experimental: "parallel".}
  parallel:
    for i in 0..4:
      spawn echo "echo in parallel"
  sync()
  
  {.pop.}

useParallel(1)

