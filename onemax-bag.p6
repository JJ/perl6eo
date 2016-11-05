#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len < $maxlen {
    my $start = now;
    for 1..$how-many  {
	my $ones = bag Bool.roll xx $len ;
	my $maxones = $ones<True>;	
    }
    say "perl6-BitSet,$len,",now - $start;
    $len = $len*2;
}
