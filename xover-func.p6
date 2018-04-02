#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my @points = (^$len).pick(2).sort;
	my @chromosome1 = Bool.roll xx $len;
	my @chromosome2 = Bool.roll xx $len;
	my @out1;
	my @out2;
	for ^$len -> $i {
	    if ( @points[0] <= $i < @points[1] )  {
		@out2[$i], @chromosome1[$i];
		@out1[$i], @chromosome2[$i];
	    } else {
		@out1[$i], @chromosome1[$i];
		@out2[$i], @chromosome2[$i];
	    }
	}
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}



