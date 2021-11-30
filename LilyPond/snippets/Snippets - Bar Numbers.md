# Snippets: Bar Numbers

## Hide bar numbers throughout the entire piece

```
\layout {
  \context {
    \Score
    \omit BarNumber
  }
}
```

## Modify bar numbers: position, font size, offsets, etc.

```
\layout {
  \context {
    \Score
    \override BarNumber.break-visibility = #all-visible
    \override BarNumber.font-size = #1
    \override BarNumber.Y-offset = -2.0
    \override BarNumber.extra-offset = #'( 0.0 . 12.0)
  }
}
```

## Show bar numbers *only* every X bars, left aligned

```
consistentlyLeftAlignedBarNumbers = {
  \override Score.BarNumber.break-visibility = #end-of-line-invisible
  \override Score.BarNumber.self-alignment-X =
  #(lambda (grob)
     (let ((break-dir (ly:item-break-dir grob)))
       (if (= break-dir RIGHT) RIGHT LEFT)))
}

\new PianoStaff <<
  \consistentlyLeftAlignedBarNumbers
  \new Staff
  {

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
    barNumberVisibility = #(every-nth-bar-number-visible 10)
    % \override BarNumber.break-visibility = #all-visible
    % \override BarNumber.font-size = #1
    % \override BarNumber.Y-offset = -2.0
    % \override BarNumber.extra-offset = #'( 0.0 . 22.0)
  }
}
```
