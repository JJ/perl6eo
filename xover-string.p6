#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $start = ($len -2 ).rand.Int;
	my $this-len = ($len-$start).rand.Int;
	my $chromosome1 = (<0 1>.roll xx $len).join;
	my $chromosome2 = (<0 1>.roll xx $len).join;
	my $x-chromosome =$chromosome2;
	$chromosome2.substr-rw($start,$this-len ) = $chromosome1.substr($start,$this-len);
	$chromosome1.substr-rw($start,$this-len ) = $x-chromosome.substr($start,$this-len);
    }
    say "perl6-BitString,$len,",now - $start;
    $len = $len*2;
}


