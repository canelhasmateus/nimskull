discard """
cmd: "nim c -d:release $file"
output: 1
description: "Compiling in release mode prevents valid code execution. #5296; I'm reasonably sure the problem is that the variable isn't declared as volatile.
                                                                              In optimizing mode, compilers often discard the variable and keep them register.
                                                                              which can mess up state restoration on longjmp."
tags: [ backend_c , mode_release, gcc_optimization, code_gen ]
"""

proc bug() : void =
    var x = 0
    try:
        inc x
        raise new(Exception)
    except Exception:
        echo x

bug()

