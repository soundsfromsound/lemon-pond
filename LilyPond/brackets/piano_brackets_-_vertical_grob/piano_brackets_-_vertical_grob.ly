\version "2.23.0"


%% functions for grob creation are adapted from `scheme-text-spanner.ly'

\header {
  tagline = ##f
}

#(define-event-class 'piano-bracket-event 'music-event)

#(define (add-grob-definition grob-name grob-entry)
   (let* ((meta-entry   (assoc-get 'meta grob-entry))
          (class        (assoc-get 'class meta-entry))
          (ifaces-entry (assoc-get 'interfaces meta-entry)))
     (set-object-property! grob-name 'translation-type? ly:grob-properties?)
     (set-object-property! grob-name 'is-grob? #t)
     (set! ifaces-entry (append (case class
                                  ((Item) '(item-interface))
                                  ((Spanner) '(spanner-interface))
                                  ((Paper_column) '((item-interface
                                                     paper-column-interface)))
                                  ((System) '((system-interface
                                               spanner-interface)))
                                  (else '(unknown-interface)))
                          ifaces-entry))
     (set! ifaces-entry (uniq-list (sort ifaces-entry symbol<?)))
     (set! ifaces-entry (cons 'grob-interface ifaces-entry))
     (set! meta-entry (assoc-set! meta-entry 'name grob-name))
     (set! meta-entry (assoc-set! meta-entry 'interfaces
                        ifaces-entry))
     (set! grob-entry (assoc-set! grob-entry 'meta meta-entry))
     (set! all-grob-descriptions
           (cons (cons grob-name grob-entry)
             all-grob-descriptions))))

#(define piano-bracket
   (lambda (grob)
     (let* ((th (ly:grob-property grob 'thickness 0.2))
            (pro (ly:grob-property grob 'protrusion -0.5))
            (pos (ly:grob-property grob 'positions))
            (bracket (ly:bracket Y pos th pro))
            (layout (ly:grob-layout grob))
            (props (ly:grob-alist-chain grob
                     (ly:output-def-lookup layout 'text-font-defaults)))
            (text (ly:grob-property grob 'text))
            (text-stil
             (ly:text-interface::interpret-markup layout props text))
            (text-stil (ly:stencil-aligned-to text-stil Y 0))
            (bracket-ext (interval-length (ly:stencil-extent bracket Y)))
            (mid-bracket-pos (/ (+ (cdr pos) (car pos)) 2))
            (text-stil
             (ly:stencil-translate-axis text-stil mid-bracket-pos Y))
            (padding (ly:grob-property grob 'padding))
            (bracket
             (ly:stencil-combine-at-edge bracket X 1 text-stil padding)))
       bracket)))

#(add-grob-definition
  'PianoBracket
  `(
     (direction . ,RIGHT)
     (padding . 0.5)
     (positions . ,ly:arpeggio::calc-positions)
     (script-priority . 0)
     (side-axis . ,X)
     (staff-position . 0.0)
     (stencil . ,piano-bracket)
     (Y-extent . ,(grob::unpure-Y-extent-from-stencil ly:arpeggio::pure-height))
     (Y-extent . ,grob::unpure-Y-extent-from-stencil)
     (X-offset . ,ly:side-position-interface::x-aligned-side)
     (Y-offset . ,ly:staff-symbol-referencer::callback)
     (meta . ((class . Item)
              (interfaces . (font-interface
                             side-position-interface
                             staff-symbol-referencer-interface
                             text-interface))))))

#(define piano-bracket-types
   '(
      (PianoBracketEvent
       . ((description . "Used to signal vertical brackets to indicate hands in piano music.")
          (types . (general-music piano-bracket-event event))
          ))
      ))

#(set!
  piano-bracket-types
  (map (lambda (x)
         (set-object-property! (car x)
           'music-description
           (cdr (assq 'description (cdr x))))
         (let ((lst (cdr x)))
           (set! lst (assoc-set! lst 'name (car x)))
           (set! lst (assq-remove! lst 'description))
           (hashq-set! music-name-to-property-table (car x) lst)
           (cons (car x) lst)))
    piano-bracket-types))

#(set! music-descriptions
       (append piano-bracket-types music-descriptions))

#(set! music-descriptions
       (sort music-descriptions alist<?))

%%% based on `arpeggio-engraver.cc'
#(define piano-bracket-engraver
   (lambda (grob)
     (let ((event #f)
           (bracket #f))

       `((listeners
          (piano-bracket-event .
            ,(lambda (engraver ev)
               (if (not event)
                   (set! event ev)))))

         (acknowledgers
          (stem-interface .
            ,(lambda (engraver grob source-engraver)
               (if (ly:grob? bracket)
                   (begin
                    (if (not (ly:grob-parent bracket Y))
                        (set! (ly:grob-parent bracket Y) grob))
                    (ly:pointer-group-interface::add-grob bracket 'stems grob)))))
          
          (dots-interface .
            ,(lambda (engraver grob source-engraver)
               (if (ly:grob? bracket)
                   (ly:pointer-group-interface::add-grob bracket 'side-support-elements grob))))
          
          (rhythmic-head-interface .
            ,(lambda (engraver grob source-engraver)
               (if (ly:grob? bracket)
                   (ly:pointer-group-interface::add-grob bracket 'side-support-elements grob)))))

         (process-music .
           ,(lambda (trans)
              (if event
                  (set! bracket
                        (ly:engraver-make-grob trans 'PianoBracket event)))))

         (stop-translation-timestep .
           ,(lambda (trans)
              (set! event #f)
              (set! bracket #f)))))))


pianoBracket =  #(make-music 'PianoBracketEvent)


%%%%%%%%%%%%%%%%%%%%%% EXAMPLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \new PianoStaff <<
    \set PianoStaff.connectArpeggios = ##t
    \new Staff {
      s1
    }
    \new Staff <<
      \clef bass
   
      \new Voice {
        \voiceOne
        \override PianoBracket.text = #"RH"
        \pianoBracket <e g b! dis'>2.\arpeggio
        \override PianoBracket.font-size = #-2
        \pianoBracket <e g b! dis'>4\arpeggio
      }
      \new Voice {
        \voiceTwo
        \override PianoBracket.text = #"LH"
        \pianoBracket <e, f, bes,>2.\arpeggio
        \override PianoBracket.protrusion = #-2
        \override PianoBracket.font-size = #-2
        \override PianoBracket.font-shape = #'italic
        \pianoBracket <e, f, bes,>4\arpeggio
      }
    >>
  >>
  \layout {
    \context {
      \Global
      \grobdescriptions #all-grob-descriptions
    }
    \context {
      \Voice
      \consists #piano-bracket-engraver
   
    }
  }
}


