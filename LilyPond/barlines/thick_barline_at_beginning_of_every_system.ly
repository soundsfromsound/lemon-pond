\version "2.23.0"


\new Staff \with {
  \consists "System_start_delimiter_engraver"
  systemStartDelimiter = #'SystemStartBar
  \override SystemStartBar.collapse-height = 0
  \override SystemStartBar.thickness = 5
}
{

  \repeat unfold 100 {c'1}
}
