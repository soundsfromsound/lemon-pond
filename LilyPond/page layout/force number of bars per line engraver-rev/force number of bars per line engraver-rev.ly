\version "2.23.0"


#(define (expand-repetitions lst seed)
   (if (symbol? (car lst))
       (let* ((str (symbol->string (car lst)))
              (split (string-split str #\*))
              (split (map (lambda (elem) (string->number elem)) split)))
         (set! seed (append seed (make-list (cadr split) (car split)))))
       (set! seed (append seed (list (car lst)))))
   (if (null? (cdr lst))
       seed
       (expand-repetitions (cdr lst) seed)))

#(define ((bars-per-line-engraver bar-list) context)
   (let* ((bar-list (expand-repetitions bar-list '()))
          (working-copy bar-list)
          (total (1+ (car working-copy))))
     `((acknowledgers
        (paper-column-interface
         . ,(lambda (engraver grob source-engraver)
              (let ((internal-bar (ly:context-property context 'internalBarNumber)))
                (if (and (pair? working-copy)
                         (= (remainder internal-bar total) 0)
                         (eq? #t (ly:grob-property grob 'non-musical)))
                    (begin
                     (set! (ly:grob-property grob 'line-break-permission) 'force)
                     (if (null? (cdr working-copy))
                         (set! working-copy bar-list)
                         (begin
                          (set! working-copy (cdr working-copy))))
                     (set! total (+ total (car working-copy))))))))))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXAMPLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\relative c' {
  \repeat unfold 47 {
    c d e f
  }
}

\layout {
  \context {
    \Score
    %use the line below to insist on your layout
    %\override NonMusicalPaperColumn #'line-break-permission = ##f

    %   this line below will create
    %     1 line of 2 measures
    %     5 lines, each with 7 measures
    %     1 line of 1 measure
    %     3 lines, each with 3 measures


    \consists #(bars-per-line-engraver '(2 7*5 1 3*3))
  }
}

