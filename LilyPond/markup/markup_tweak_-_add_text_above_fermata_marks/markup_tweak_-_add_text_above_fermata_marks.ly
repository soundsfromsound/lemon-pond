\version "2.23.0"

% The "arco" above is a TextScript which has a default outside-staff-priority of 450.  There is nothing magical about using 100 in particular for the fermata, only that it is a smaller number.  Grobs with a smaller outside-staff-priority will sit closer to the staff. 
% -- Aaron Hill (taken from the mailing list)


\relative c'' {
  c1 -\tweak outside-staff-priority 100 \fermata ^"arco"
  c1 -\tweak outside-staff-priority 100 \fermata ^"arco"
     -\tweak outside-staff-priority 100 \fermata ^ \markup { \italic "expression" }
     % and so on
}
