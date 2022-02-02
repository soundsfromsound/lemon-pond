% This template is primarily for practicing jazz riffs in different keys, quickly transposing the music across all 12 keys. This is a starting point.


\version "2.23.4"
\language "english"

\header {
  title = "My Jazz Riff Practice Template"
  subtitle = "Riff #1 - Example 1"
  composer = "Your Name"
  tagline = ##f
}


music = \relative c'
{
  \override Staff.TimeSignature.break-visibility = ##(#f #t #t)
  %%%%%%%% INSERT YOUR TIME SIGNATURE AND RIFF HERE %%%%%%%%%%
  \numericTimeSignature \time 4/4
  c4. ef8 e!4 g4 c4. ef8 e!4 g4
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%% END MUSIC %%%%%%%%%

\score {
  <<
    \new Staff
    {
      \transpose c c    { \music }\break
      \transpose c df   { \music }\break
      \transpose c d    { \music }\break
      \transpose c ef   { \music }\break
      \transpose c f    { \music }\break
      \transpose c fs   { \music }\break
      \transpose c g    { \music }\break
      \transpose c af   { \music }\break
      \transpose c a    { \music }\break
      \transpose c bf   { \music }\break
      \transpose c b    { \music }\break
    }
  >>
}

\paper {
  top-margin = 0.5\in
  left-margin = 0.75\in
  right-margin = 0.75\in
  bottom-margin = 0.5\in
  ragged-right = ##t
  indent = 0
}
