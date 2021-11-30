# Snippets: Time Signatures

## Hide cautionary time signature at end of line

```
\version "2.23.4"

\relative c'
{
 \override Score.TimeSignature.break-visibility = ##(#f #t #t)
  \time 4/4
  c d e f e d f e d f c c d e f d e f d c
  \break
  \time 3/4 c d e f g f e d c d c c c2.
}
```

