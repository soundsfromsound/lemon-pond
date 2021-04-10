\version "2.23.0"
\language "english"
%% http://lsr.di.unimi.it/LSR/Item?id=544

stemlessharm = {
  \tiny
  \override Staff.NoteColumn.ignore-collision = ##t
  \override Stem.stencil = ##f
  \override Flag.stencil = ##f
  \override ParenthesesItem.font-size = #0
}

{
  % \override NoteHead.style = #'harmonic-mixed
  \time 1/4
  <<
    {
      \oneVoice
      <bf' d''\harmonic>4
    }

    \\

    {
      \oneVoice
      \stemlessharm
      <\parenthesize d''''>4
    }
  >>

}
