\version "2.23.0"


tapecue = #(define-event-function
            (parser location N vlength)
            (number? number?)
            (define Nstring (number->string N))
            (if (< N 10)
                (set! Nstring (string-append "  " Nstring "  "))
                )
            (if (and (>= N 10) (< N 100))
                (set! Nstring (string-append " " Nstring " "))
                )
            #{
              -\markup {
                \hspace #-1.2
                \center-column {
                  \raise #1
                  \combine
                  \arrow-head #Y #UP ##t
                  \draw-line #(cons 0 (* -1 vlength)) 
                  \circle #Nstring
                }
              }
            #}
            )

tapecueText = #(define-event-function
                (parser location N vlength description)
                (number? number? string?)
                (define Nstring (number->string N))
                (if (< N 10)
                    (set! Nstring (string-append "  " Nstring "  "))
                    )
                (if (and (>= N 10) (< N 100))
                    (set! Nstring (string-append " " Nstring " "))
                    )
                #{
                  -\markup {
                    \hspace #-1.2
                    \center-column {
                      \raise #1
                      \combine
                      \arrow-head #Y #UP ##t
                      \draw-line #(cons 0 (* -1 vlength))
                      \circle #Nstring
                    }
                    \raise #(+ -2 (* -1 vlength)) $description
                  }
                #}
                )

{
  \textLengthOn
  c'1\tapecue #1 #3
  g1\tapecue #2 #1.5
  c''1\tapecue #37 #4.4
  f'1\tapecue #123 #2 \break
  c'1\tapecueText #3 #8 "harmonizer"
  f1\tapecueText #20 #6 "frozen reverb"
  c'1\tapecueText #300 #8 "EQ -3.7 A +1.2"
  c'1
}
