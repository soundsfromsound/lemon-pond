# Snippets: Templates

## TEMPLATE: Worksheet / School exam

```
\header {
  piece = \markup { \pad-around #0 \fontsize #2 \bold "Worksheet Example I" }
  arranger = "Instructor Name"
  composer = "Music Theory 401"
  tagline = ##f
}

\new Staff
\relative c'
{
  \override Score.TimeSignature.break-visibility = ##(#f #t #t)
  \numericTimeSignature \time 4/4
  c4 d e f g a b d4 c1\bar "|."
  \break
  \time 4/4
  c,4 d e f g a b d4 c1 \bar "|." \break
  \time 4/4
  c,2 d e f g a b c \bar "|." \break
  \time 3/4 c,4 d e f g a b d4 c c2. \bar "|." \break
}


\paper {
  indent = 0
  top-margin = 0.5\in
  left-margin = 0.5\in
  right-margin = 0.5\in
  bottom-margin = 0.5\in
  ragged-right = ##t
}

\layout {
  \context {
    \Score
    \omit BarNumber
  }
}
```

