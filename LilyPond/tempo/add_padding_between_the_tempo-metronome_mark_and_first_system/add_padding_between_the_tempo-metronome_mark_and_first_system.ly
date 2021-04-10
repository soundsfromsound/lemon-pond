%{
THE SNIPPET:
\override Score.MetronomeMark.padding = #8

WHAT IT DOES:
Add padding between the tempo / metronome mark and the first system (top)

%}

%% ------ EXAMPLE ------

\version "2.23.0"

\header {
  title = "Title"
  composer = "Composer"
  tagline = ##f
}

{
  \override Score.MetronomeMark.padding = #8
  \tempo "Very fast"
  \relative c'
  \repeat unfold 25 { c4 d e f }
}




