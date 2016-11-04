#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    my @range = (0..$len-1);	
    for 1..$how-many  {
        my @first = Bool.roll xx $len;
	my @second = Bool.roll xx $len;	
    	my @points = @range.pick(2);
	my @xover = ( @points[1] > @points[0] )??@points!!@points[1],@points[0];
	my @offspring1 = @first;
	my @offspring2 = @second;
	@offspring1[@xover[0]..@xover[1]-1] = @second[@xover[0]..@xover[1]-1];
	@offspring2[@xover[0]..@xover[1]-1] = @first[@xover[0]..@xover[1]-1];


    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}
