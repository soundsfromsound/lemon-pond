% \once \override Staff.OttavaBracket.shorten-pair = #'(0 . -10)

\version "2.19.83"

\relative c'
{

  \once \override Staff.OttavaBracket.shorten-pair = #'(0 . -10)
  \ottava #1
  c4 c2.
  \ottava #0
  c4 c2.

  c4 c2.


}


\paper {
  ragged-right = ##f

}
