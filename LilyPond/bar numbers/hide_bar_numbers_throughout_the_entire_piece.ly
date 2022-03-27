\version "2.23.4"

\relative c'
\repeat unfold 50 { c4 d e f c1 }




\layout {
  \context {
    \Score
    \omit BarNumber % this will hide all bar numbers in the score
  }
}

