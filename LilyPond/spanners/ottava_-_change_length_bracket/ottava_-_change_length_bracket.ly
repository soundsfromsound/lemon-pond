\version "2.23.0"


\relative c'
{

  \once \override Staff.OttavaBracket.shorten-pair = #'(0 . -10)
  \ottava #1
  c4 c2.
  \ottava #0
  c4 c2.
  % \once \override Staff.OttavaBracket.shorten-pair = #'(0 . -10)
  \ottava #1
  c4 c2.


}


\paper {
  ragged-right = ##f
}
