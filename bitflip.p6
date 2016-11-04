#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    my @ones = Bool.roll xx $len;
    my $range = (1..$len);	
    for 1..$how-many  {
    	my $position = $range.pick;
	@ones[$position] = !@ones[$position];
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}
