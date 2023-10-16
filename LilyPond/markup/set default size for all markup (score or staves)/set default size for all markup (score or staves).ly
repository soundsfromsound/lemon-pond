\version "2.23.0"

%  set the default size for all markups in a staff

% entire score
\layout {
  \context {
    \Score
    % \override TextScript.font-size = #-12
  }
} 

% or an entire staff

\new Staff
\with { \override TextScript.font-size = #-3 }

{  
 
  c4 d e^\markup { "Hello there!" } f g2 g
 
}

