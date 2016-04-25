#!/usr/bin/env perl6


my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len < $maxlen {
    my $start = now;
    for 1..$how-many  {
	my @ones = map( { rand >= 0.5 ?? True !! False }, 1..$len );
	my $maxones = reduce { $^b + $^a }, 0, |@ones;
#	say $maxones;
    }
    say "perl6-BitVector,$len,",time.Int - $start;
    $len = $len*2;
}
