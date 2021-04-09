\version "2.23.0"
\language "english"
\relative c'' {
  \time 1/4
  \once \override Staff.AccidentalPlacement.right-padding = #.5 cs
  \once \override Staff.AccidentalPlacement.right-padding = #1 cs
  \once \override Staff.AccidentalPlacement.right-padding = #1.5 cs
  \once \override Staff.AccidentalPlacement.right-padding = #2 cs
}
