\version "2.25.8"

% see: https://lists.gnu.org/archive/html/lilypond-user/2014-11/msg00210.html

% Vertical brackets with text around chords (piano RH, LH)

rhMark = \markup {
  \concat {
    \path #0.1 #'((moveto 0 -2.75)(rlineto 0.5 0)(rlineto 0 4.25)(rlineto -0.5 0))
    \override #'(font-encoding . latin1) \italic " R.H."
  }
}

lhMark = \markup {
  \concat {
    \path #0.1 #'((moveto 0 1.75)(rlineto 0.5 0)(rlineto 0 -3.25)(rlineto -0.5 0))
    \override #'(font-encoding . latin1) \lower #1.25 \italic " L.H."
  }
}

\new Staff \relative c, {
  \clef bass
  \set fingeringOrientations = #'(right)
  <e f bes\finger \lhMark e\finger \rhMark g b! dis>1\arpeggio
  \unset fingeringOrientations
}

