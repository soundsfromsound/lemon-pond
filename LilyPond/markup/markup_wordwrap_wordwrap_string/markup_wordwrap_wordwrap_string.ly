\version "2.23.0"

{
  a4^\markup
     \override #'(line-width . 10) \wordwrap-string #"This is a bunch of text a bunch of text a bunch of text"

  r4 r r a4_\markup
     \override #'(line-width . 10) \wordwrap { This is a bunch of text a bunch of text a bunch of text }
  
  r4 r r a4_\markup
     \wordwrap { This is a bunch of text a bunch of text a bunch of text This is a bunch of text a bunch of text a bunch of text a bunch of text a bunch of text }
 r r r  e1
} 

\paper {
  top-margin = 0.5\in
  left-margin = 0.75\in
  right-margin = 0.75\in
  bottom-margin = 0.5\in
}