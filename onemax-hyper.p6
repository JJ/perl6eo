#!/usr/bin/env perl6

use v6;

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len < $maxlen {
    my $start = now;
    my $to-eval = (1..$how-many).map( {Bool.roll xx $len} );
    $to-eval.race.map( *.sum );
    say "perl6-BitVector-hyper,$len,",now - $start;
    $len = $len*2;
}
