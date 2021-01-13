\version "2.21.4"

{
  c'1 -\tweak extra-offset #'(0 . -2) ^\markup { hello }
  c2  -\tweak padding 0 ^\markup { hi }
  c2  -\tweak padding 4 ^\markup { hi }
}
