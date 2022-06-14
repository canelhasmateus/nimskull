discard """
description: "Echos 2.293GiB for C/C++ mode but 37568YiB for JS mode. ; I've investigated a bit, and it seems to be like that because bitwise operators in JS are 32-bit, so 1 << 40 gives 256 and
not 1099511627776 ;  changing bitwise move operation to mul and div. ; "
tags: [ , 32-bit,  JavaScript ,  bitwise, moveOperation ]
"""
import strutils

doAssert formatSize(2462056448, '.', bpIEC, false) == "2.293GiB"
