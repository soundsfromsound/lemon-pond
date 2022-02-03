\version "2.23.4"

stringNumberSpanner =
#(define-music-function (parser location StringNumber) (string?)
#{
\override TextSpanner.style = #'solid
\override TextSpanner.font-size = #-8
\override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
\override TextSpanner.bound-details.right.padding = #-2
\override TextSpanner.bound-details.left.padding = #-2
\override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -1) } 
\override TextSpanner.bound-details.left.text = \markup { \number $StringNumber }
#})


\relative c'' {
 
\stringNumberSpanner "Sul IV " \textSpannerUp b2 \startTextSpan
e4 b f8.( b,16 ) \stopTextSpan b'2 r2 

\stringNumberSpanner "Sul G " \textSpannerUp b2 \startTextSpan
e4 b f8.( b,16 ) \stopTextSpan b'2

}