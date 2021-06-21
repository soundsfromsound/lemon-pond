\version "2.23.0"

% Code block from Abraham Lee: Because they force some space in between words and around hyphens, your music will get spread out a little, so just be aware of that. This can be put inside or outside the \score block, depending on where you want them to influence.

\layout {
  \context Lyrics {
    \override LyricHyphen.padding = #0.15
    \override LyricHyphen.length = #0.6
    \override LyricHyphen.minimum-length = #0.66
    \override LyricHyphen.minimum-distance = #1
    \override LyricHyphen.thickness = 2.0
    \override LyricHyphen.dash-period = 8.0
    \override LyricExtender.minimum-length = #0
    \override LyricExtender.right-padding = #0.5
    \override LyricSpace.minimum-distance = #1
  }
}

%%%%
% You can also use this approach, from Aaron Hill on the mailing list.
%%%%
forceHyphen = \lyricmode {
  \once \override LyricHyphen.minimum-distance = #2
}

%%%%
% You then use it like this:
%%%%
\lyricmode { And the \forceHyphen white -- robed mar -- tyrs fol -- low, }
%%%% 
