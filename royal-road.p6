#!/usr/bin/env perl6

use v6;

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $ones = Bool.roll xx $len ;
	my $royal-road= $ones.rotor(4).grep( so (*.all == True|False) ).elems ;	
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}
