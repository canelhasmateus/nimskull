

when defined(windows):
  import winlean
else:
  import posix

when defined(Windows):
  template orig: expr = 
    winlean
else:
  template orig: expr = 
    posix

proc socket(domain, typ, protocol: int): int =
  result = orig.socket(ord(domain), ord(typ), ord(protocol)))

