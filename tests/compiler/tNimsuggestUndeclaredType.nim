discard """
  cmd: "nim check --hints:off --warnings:off $file"
  errormsg: "undeclared identifier: 'Undeclared'"
  description: "nimsuggest crash with import after encountering undeclared type , issues #12684"
"""

var x: Undeclared
import std/strutils

