#!/usr/bin/env perl6

sub xover( @chromosome1, @chromosome2 ) {
    my $len = @chromosome1.elems;
    my $start = ($len -2 ).rand.Int;
    my $this-len = ($len-$start).rand.Int;
    return (@chromosome2.head($start), @chromosome1.skip($start).head($this-len),
	 @chromosome2.tail( $len - $this-len - $start  )).flat,
	(@chromosome1.head($start), @chromosome2.skip($start).head($this-len),
	 @chromosome1.tail( $len - $this-len - $start  )).flat;
}

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    my @chromosome1 := Bool.roll($len).list;
    my @chromosome2 := Bool.roll($len).list;
    for 1..$how-many  {
	my ($elem1, $elem2) = xover(@chromosome1, @chromosome2 );
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}


