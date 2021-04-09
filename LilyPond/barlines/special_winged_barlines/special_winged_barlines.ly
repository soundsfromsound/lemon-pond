\version "2.23.0"


\defineBarLine "[" #'("" "[" "")
\defineBarLine "]" #'("]" "" "")

{
    \override  Staff.BarLine.thick-thickness = #2
    \override  Staff.BarLine.font-size = #-4
    c' \bar "[" 
    \tweak extra-spacing-width #'(-1.2 . 0)
    c' c' \bar "]" c'
} 