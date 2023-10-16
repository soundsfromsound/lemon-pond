\version "2.23.0"


#(define lbracket "0.25 setlinewidth
                0 setlinejoin
                0 setlinecap
                0.5 -2 moveto
                -2 0 rlineto
                0 7.8 rlineto
                2 0 rlineto
                stroke")

#(define rbracket "0.25 setlinewidth
                0 setlinejoin
                0 setlinecap
                0.5 -2 moveto
                2 0 rlineto
                0 7.8 rlineto
                -2 0 rlineto
                stroke")


\relative c' {
  d4-\markup { \postscript #lbracket }
  c-\markup { \postscript #rbracket }
  \tweak extra-spacing-width #'(-1.8 . 0) c c
}

