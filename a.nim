import experimental/[diff, colordiff, colortext]
import std/[algorithm, sequtils, strformat, strutils]



type
  StringMismatchCandidate = object
    distance: int
    edits: seq[SeqEdit]
    target: string

proc stringMismatchCandidates*(
    input: string,
    expected: openarray[string]
  ): seq[StringMismatchCandidate] =

  var results: seq[tuple[
    edits: tuple[distance: int, operations: seq[SeqEdit]],
    target: string
  ]]

  for str in expected:
    if str == input:
      return @[]

    else:
      let (distance, edits) = levenshteinDistance(input.toSeq(), str.toSeq())
      result.add StringMismatchCandidate(
        distance: distance,
        edits: edits,
        target: str
      )

proc stringMismatchMessage*(
    input: string,
    expected: openarray[string],
    fixSuggestion: bool = true,
    showAll: bool = false,
  ): ColText =

  coloredResult()

  let expected = deduplicate(expected)

  if expected.len == 0:
    add "No matching alternatives"
    return

  var results = stringMismatchCandidates(input, expected).
    sortedByIt(it.distance)

  let best = results[0]

  var fmt = diffFormatter(false)
  fmt.lineSplit = proc(s: string): seq[string] =
                    echo "split"
                    mapIt(s, $it)

  if best.distance > int(input.len.float * 0.8):
    add "No close matches to "
    add input + fgRed
    add ", possible alternative(s): "
    var first = true
    for it in results[0 .. min(results.high, 3)]:
      if not first: add " or "
      first = false
      add it.target + fgYellow

  else:
    add "Did you mean to use '"
    add best.target + fgYellow
    add "'?'"
    var edits = 0
    for edit in best.edits:
      if edit.kind != sekKeep:
        inc edits

    if fixSuggestion:
      if edits < min(3, input.len div 2):
        add " ("
        add formatInlineDiff(input, best.target, fmt)
        add ")"

      else:
        add " ("
        add input + fgRed
        add " -> "
        add best.target + fgGreen
        add ")"

    if showAll and expected.len > 1:
      add " ("
      for idx, alt in results[1 ..^ 1]:
        if idx > 0:
          add " "

        add alt.target + styleItalic
        add "?"

      add ")"

proc parseEnumOrErr[T: enum](s: string): T =
  try:
    result = parseEnum[T](s)

  except ValueError:
    echo stringMismatchMessage(s, mapIt(low(T) .. high(T), $it))


type
  A = enum
    ROLE_SPEC
    ROLE_REGRESSION
    ROLE_TORTURE
    TEST_FAST
    TEST_SLOW
    TEST_FLAKY


echo parseEnumOrErr[A]("ROLE_SPUC")
echo parseEnumOrErr[A]("ROLE_SFDE")
