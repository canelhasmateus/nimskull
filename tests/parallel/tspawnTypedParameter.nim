discard """
  matrix: "--threads:on"
  errormsg: "'spawn'ed function cannot have a 'typed' or 'untyped' parameter"
  description: " spawn echo() results in internal error, issues #9691 #10913"
"""

# bug #9691

import threadpool
spawn echo()

