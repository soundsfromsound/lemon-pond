\version "2.23.0"

crescText = {
  \set crescendoText = \markup { \italic { poco a poco cresc. } }
  \set crescendoSpanner = #'text
  \override DynamicTextSpanner.style = #'dashed-line
}

crescHair = {
  \unset crescendoText
  \set crescendoSpanner = #'hairpin
}


\score{
  {
    \override DynamicLineSpanner.staff-padding = #4
    \crescText
    c'4\< \repeat unfold 14 { c' } c'\!
    \crescHair
    c'4\< \repeat unfold 14 { c' } c'\!
  }

  \layout{}

}

