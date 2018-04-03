#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $start = ($len -2 ).rand.Int;
	my $this-len = 1+($len-$start-2).rand.Int;
	my @chromosome1 = Bool.roll($len);
	my @chromosome2 = Bool.roll($len);
	my @out1 = Array.new( @chromosome2.head($start)).append(@chromosome1.skip($start).head($this-len)).append( @chromosome2.tail($len-$this-len-$start));
	my @out2 = Array.new( @chromosome1.head($start)).append(@chromosome2.skip($start).head($this-len)).append( @chromosome1.tail($len-$this-len-$start));
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}


