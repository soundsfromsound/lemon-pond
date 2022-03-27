\version "2.23.4"



\relative c'
\repeat unfold 50 { c4 d e f c1 }






\layout {
  \context {
    \Score
    % change font size of bar numbers
    \override BarNumber.font-size = #1
    % change the position for all bar numbers, XY
    \override BarNumber.extra-offset = #'( 8.0 . 1.0)
    % change vertical offset of bar numbers
    \override BarNumber.Y-offset = -0.75
  }
}