\version "2.19.46"

% Returns default parens

#(define (parenthesize grob m)
   (let* ((fm (ly:grob-default-font grob))
          (op (ly:font-get-glyph fm "accidentals.leftparen"))
          (cl (ly:font-get-glyph fm "accidentals.rightparen"))
          (m (ly:stencil-combine-at-edge m X LEFT op 0))
          (m (ly:stencil-combine-at-edge m X RIGHT cl 0)))
     m))

% Parens as brackets

#(define (parenthesize grob mol)
   (let* ((ext (ly:stencil-extent mol Y))
          (ss (ly:staff-symbol-staff-space grob))
          (ext (interval-widen ext (/ ss 2.0)))
          ; too thin
          ;(thickness (ly:output-def-lookup (ly:grob-layout grob) 'line-thickness))
          (thickness 0.2)
          (protrusion 0.5)
          (lb (ly:bracket Y ext thickness protrusion))
          (rb (ly:bracket Y ext thickness (- protrusion)))
          (mol (ly:stencil-combine-at-edge mol X LEFT lb 0))
          (mol (ly:stencil-combine-at-edge mol X RIGHT rb 0)))
     mol))

#(define accidental-interface::square-brackets
   (lambda (grob)
     (let* ((fm (ly:grob-default-font grob))
            (alist (ly:grob-property grob 'glyph-name-alist))
            (alt (ly:grob-property grob 'alteration))
            (glyph-name (ly:assoc-get alt alist #f))
            (mol (if (string? glyph-name)
                     (ly:font-get-glyph fm glyph-name)
                     (begin
                      (ly:warning (_ "Could not find glyph-name for alteration ~s") alt)
                      (ly:font-get-glyph fm "noteheads.s1cross"))))
            (mol (if (eq? #t (ly:grob-property grob 'restore-first))
                     (let ((acc (ly:font-get-glyph fm "accidentals.natural")))
                       (if (ly:stencil? acc)
                           (ly:stencil-combine-at-edge mol X LEFT acc 0.1)
                           (begin
                            (ly:warning "natural alteration glyph not found")
                            mol)))
                     mol)))
       (if (eq? #t (ly:grob-property grob 'parenthesized))
           (parenthesize grob mol)
           mol))))


{
  cis''?1 ces''? cisis''? ceses''? c''!?
  \override Staff.AccidentalCautionary.stencil = #accidental-interface::square-brackets
  cis''? ces''? cisis''? ceses''? c''!?
  % not cautionary...
  cis''
  <es'? ges'? bes'?>
}
