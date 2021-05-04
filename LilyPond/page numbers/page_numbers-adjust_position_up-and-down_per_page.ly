\version "2.23.0"


% \include "folio-offset.ly"

%% After an idea by Torsten Haemmerle
%% http://www.lilypondforum.de/index.php?topic=1393.msg7673#msg7673

#(set-default-paper-size "letter")

%% Define your general settings for odd/even page-numbers
%% Exceptions for certain pages are possible, too.
#(define folio-offset '(
                         ;; general
                         (odd . (-2 . 1))
                         (even . (-2 . 1))
                         ;; exceptions for page 3 and 4
                         (3 . (-3 . -1))
                         (4 . (-5 . -5))
                         ))

#(define-markup-command (place-folio layout props folio) (markup?)
   (let* ((page-number (chain-assoc-get 'page:page-number props))
          (general-off
           (if (odd? page-number)
               (assoc-get 'odd folio-offset '(0 . 0))
               (assoc-get 'even folio-offset '(0 . 0))))
          (page-off (assoc-get page-number folio-offset '(0 . 0)))
          (offs
           (cons
            (+ (car general-off) (car page-off))
            (+ (cdr general-off) (cdr page-off))))
          (m (interpret-markup layout props folio))
          (x-ext (ly:stencil-extent m X))
          (y-ext (ly:stencil-extent m Y)))

     (interpret-markup layout props
       (markup
        ;#:box   ;; uncomment for testing
        #:with-dimensions x-ext y-ext
        #:line (#:translate offs folio)))))

\paper {
  indent = 0
  ragged-right = ##f
  oddHeaderMarkup =
  \markup \fill-line {
    \place-folio \fromproperty #'page:page-number-string \null
  }
  evenHeaderMarkup =
  \markup \fill-line {
    \null \place-folio \fromproperty #'page:page-number-string
  }
}

{ \repeat unfold 10 { s1 s1 s1 s1\pageBreak } }
