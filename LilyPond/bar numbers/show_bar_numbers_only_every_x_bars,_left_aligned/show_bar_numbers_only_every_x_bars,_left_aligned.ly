\version "2.23.4"


% this function will make all bar numbers always left-aligned to the bar.

consistentlyLeftAlignedBarNumbers = {
  \override Score.BarNumber.break-visibility = #end-of-line-invisible
  \override Score.BarNumber.self-alignment-X =
  #(lambda (grob)
     (let ((break-dir (ly:item-break-dir grob)))
       (if (= break-dir RIGHT) RIGHT LEFT)))
}

\new PianoStaff <<
  % here is the command from above, placed here in the music.
  \consistentlyLeftAlignedBarNumbers
  \new Staff
  {
    % this command simply sets the current bar number to the number you choose.
    \set Score.currentBarNumber = #112
    \repeat unfold 48 { R1 }
  }
  \new Staff
  \relative c' {
    \repeat unfold 48 { R1 }
  }
>>



\layout {
  \context {
    \Score
    % this will print barlines every X bars.
    barNumberVisibility = #(every-nth-bar-number-visible 10)
  }
}