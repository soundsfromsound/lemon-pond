\version "2.23.4"

\markup "This example shows the piano part: it includes the solo instrument part with staff size reduced"
\markup "(i.e. traditionally engraved chamber music scores with piano)"

<<
  \new Staff \with {
    instrumentName = "Violin"
    \magnifyStaff #4/7
    % \magnifyStaff #5/7 also looks nice if you prefer a little larger
  }
  \relative c'
  { \repeat unfold 10 { c16 d e f c d e f e c e f c d } c4 c1 c1 }


  \new PianoStaff
  \with {
    instrumentName = "Piano"

  }
  {
    <<
      \new Staff = "RH" \relative c' { \clef treble c1 d e f c d \break e f d e c}
      \new Staff = "LH" \relative c { \clef bass c1 d e f c d \break e f d e c }
    >>

  }

>>

\paper {
  top-margin = 0.5\in
  left-margin = 0.75\in
  right-margin = 0.75\in
  bottom-margin = 0.5\in
  
}
