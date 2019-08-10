#!/usr/bin/env perl6

use v6;

use Algorithm::Evolutionary::Simple;

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    for 1..$how-many  {
	crossover( Bool.roll($len), Bool.roll($len));
    }
    say "perl6-BitVector-xover-v2,$len,",now - $start;
    $len = $len*2;
}
