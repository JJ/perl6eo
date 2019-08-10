#!/usr/bin/env perl6

sub xover( @chromosome1 is copy, @chromosome2 is copy ) {
    my @x-chromosome = @chromosome2;
    my $len = @x-chromosome.elems;
    my $start = ($len -2 ).rand.Int;
    my $this-len = ($len-$start).rand.Int;
    @chromosome2.splice($start,$this-len, @chromosome1.skip($start).head($this-len));
    @chromosome1.splice($start,$this-len, @x-chromosome.skip($start).head($this-len));
    return (@chromosome1, @chromosome2).Slip;
}

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	xover(Bool.roll($len), Bool.roll($len) );
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}


