\version "2.23.0"

\relative c'
{
  c2\flageolet e\flageolet g\flageolet c\flageolet

}

Fsize = #(let ((m (make-music 'ArticulationEvent
                    'articulation-type "flageolet")))
           (set! (ly:music-property m 'tweaks)
                 (acons 'font-size -3
                   (ly:music-property m 'tweaks)))
           m)


\relative c'{ c2  d e f'\Fsize e\Fsize  }

