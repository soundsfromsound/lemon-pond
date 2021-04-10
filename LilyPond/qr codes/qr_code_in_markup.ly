\version "2.23.0"

% I use this function on my GNU Linux computers without issue, however I don't know how well it works on Windows and OSX. Please make sure you install qrencode, imagemagick, and potrace for this code to run.

#(define-markup-command (qr-code layout props str size idn)(string? number? boolean?)
   "create QR-Code markup from <str> with width <size>. Use IDN for international domain names.
It needs qrencode, imagemagick convert, potrace and optionally idn commands installed in PATH."
   (let ((tmp (format "~A-~2A.eps" (strftime "%Y%m%d%H%M%S" (localtime (current-time))) (random 100)))
         (qr-stencil (interpret-markup layout props (markup #:with-color red #:filled-box (cons 0 size) (cons 0 size) 0.7)))
         (quali (chain-assoc-get 'qr-quality props "L")))
     (if (symbol? str)(let ((tmp (chain-assoc-get str props #f)))
                        (if tmp (set! str tmp))))
     (system (format (if idn
                         "echo \"~A\" | idn --quiet | qrencode -o - -m 0 -l ~A | convert PNG:- BMP:- | potrace -a -1 -o \"~A\""
                         "echo \"~A\" | qrencode -o - -m 0 -l ~A | convert PNG:- BMP:- | potrace -a -1 -o \"~A\"")
               str quali tmp))
     (set! qr-stencil (eps-file->stencil X size tmp))
     (system (format "rm -v \"~A\"" tmp))
     qr-stencil
     ))

% adjust the value #10 and #5 below to change the size of the QR code on the printed page.

\markup { For more information about ordering scores or parts, visit my website: }
\markup { \qr-code #"https://soundsfromsound.com/" #10 ##f }
\markup \vspace #2
\markup { To see a video performance of this piece: }
\markup { \qr-code #"https://youtube.com" #5 ##f }
