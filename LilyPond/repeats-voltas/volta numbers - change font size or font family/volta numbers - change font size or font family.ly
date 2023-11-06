\version "2.25.9"

\relative c' {
  \repeat volta 6 {
    c4( d e) f->
    %\override Score.VoltaBracket.font-size = #-4 default size
    \override Score.VoltaBracket.font-size = #2
    %\override Score.VoltaBracket.font-name = "CabinSketch"
    \override Score.VoltaBracket.font-name = "Lora"

    \alternative {

      \volta 1,2,3 { c2 e }
      \volta 4,5 { f2 d }
      \volta 6 { e2 f }
    }
  }
  c1\bar "|."
}

