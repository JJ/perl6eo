#!/usr/bin/env perl6

use NativeCall;

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len < $maxlen {
    my $start = now;
    for 1..$how-many  {
    	my $ones = CArray[int].new;
	$ones = Bool.roll xx $len ;
	my $maxones = $ones.sum;	
#	say $maxones;
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}
