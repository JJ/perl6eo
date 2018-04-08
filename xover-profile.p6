#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 256;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $start = ($len -2 ).rand.Int;
	my $this-len = ($len-$start).rand.Int;
	my @chromosome1 = Bool.roll($len);
	my @chromosome2 = Bool.roll($len);
	my @x-chromosome = @chromosome2;
	@chromosome2.splice($start,$this-len, @chromosome1.skip($start).head($this-len));
	@chromosome1.splice($start,$this-len, @x-chromosome.skip($start).head($this-len))
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}


