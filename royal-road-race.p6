#!/usr/bin/env perl6

use v6;

my Int $len = 16;
my $maxlen = 4096;
my $how-many =10000;
while $len <= $maxlen {
    my $start = now;
    if $len >= 512 {
	for 1..$how-many  {
	    my $ones = Bool.roll xx $len ;
	    my $royal-road= $ones.race( degree => $len/128)
	        .rotor(4).grep( so (*.all == True|False) ).elems ;	
	}
    } else {
	for 1..$how-many  {
	    my $ones = Bool.roll xx $len ;
	    my $royal-road= $ones.rotor(4).grep( so (*.all == True|False) ).elems ;	
	}
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}
