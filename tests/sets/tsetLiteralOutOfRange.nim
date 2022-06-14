discard """
errormsg: "6 can't be converted to range 1..5(int8)"
line: 6
description: "Set literal drop out of range values ; issues #2669"
tags: [ Set ; Literal ; Range ; RegressionTest ]
"""
var c: set[range[1i8..5i8]] = {1i8, 2i8, 6i8}

