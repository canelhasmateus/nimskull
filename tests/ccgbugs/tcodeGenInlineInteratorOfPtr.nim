discard """
description: "Incomplete types being generated in C code from ptr to unchecked array #8616"
tags: [ ptr, array, codegen, backend_c , iterators, pragma, inline]
"""
import pkg8616 / scheduler

when true:
  init()

