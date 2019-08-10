#!/usr/bin/env perl6

sub xover( @x, @y ) {
    my @pairs = @x Z @y;
    my $xover1point = @x.keys.pick;
    my $xover2point = ($xover1point^..@x.elems).pick;
    my @crossed =  gather for @pairs.kv -> $index, @value {
        take ( ($xover1point <= $index <= $xover2point) ?? @value.reverse !!
            @value );
    }
    return ([Z] @crossed).Slip;
}

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $start = ($len -2 ).rand.Int;
	my $this-len = ($len-$start).rand.Int;
	xover( Bool.roll($len), Bool.roll($len));
    }
    say "perl6-BitVector-xover-v2,$len,",now - $start;
    $len = $len*2;
}
