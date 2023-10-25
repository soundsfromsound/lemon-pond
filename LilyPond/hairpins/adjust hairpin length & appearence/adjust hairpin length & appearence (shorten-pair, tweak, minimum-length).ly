\version "2.25.8"

% Setting the minimum length of hairpins: if hairpins are too short, they can be lengthened by modifying the minimum-length property of the Hairpin object. The minimum-length adjusts horizontal spacing.
%%%%%%%%%%%%%%%%%%%%%%%%%%

% SHORTEN-PAIR: Moving the ends of hairpins

% The ends of hairpins may be offset by setting the shorten-pair property of the Hairpin object. Positive values move endpoints to the right, negative to the left.

% Unlike the minimum-length property, shorten-pair ONLY affects the APPEARENCE of the hairpin; it does NOT adjust horizontal spacing (including the position of bounding dynamics).

% This method is thus suitable for fine-tuning a hairpin within its allotted space.

\markup { Hairpin.minimum-length }
\new Voice \relative {
  \override Hairpin.minimum-length = #12
  d'2 \< c2 \> <>\!
  \revert Hairpin.minimum-length d c
  d2 \< c2 \> <>\! d c d c \break
  c'2-\tweak minimum-length #17 \<
  c2 -\tweak minimum-length #17 \> <>\!
  c2 c2
  c2 c2
  c2 c2
}

\markup { Hairpin.minimum-length with spacers }
\new Voice \relative <<
  { c'2 c2 }
  { \override Hairpin.minimum-length=#7 s2 \< s2\> <>\! c c }
>>

\markup { DynamicLineSpanner.staff-padding }
\relative c' {
  \override DynamicLineSpanner.staff-padding = #4
  c16 \< e g c \! g \> e c g \!
}

\markup { Hairpin.shorten-pair }
{
  c'16\tweak shorten-pair #'(0 . 1.8) \< e' g' c'
  g'-\tweak shorten-pair #'(-1 . 0) \> e' c' g' \!
  c'2~\< |
  c'2~ c'\!
  \once \override Hairpin.shorten-pair = #'(2 . 2)
  c'1~\<
  c'2~ c'\!
  \once \override Hairpin.shorten-pair = #'(-2 . -2) \break
  c'1~\<
  c'2~ c'\!
  c'1~\p-\tweak shorten-pair #'(2 . 0)\<
  c'2~ c'\ffff
  c' c' c' c' c'1
}