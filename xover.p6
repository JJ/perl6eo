#!/usr/bin/env perl6

my Int $len = 16;
my $maxlen = 32768;
my $how-many =100000;
while $len <= $maxlen {
    my $start = now;
    my @range = (0..$len-1);	
    for 1..$how-many  {
        crossover( Bool.roll xx $len, Bool.roll xx $len );
    }
    say "perl6-BitVector,$len,",now - $start;
    $len = $len*2;
}

sub crossover ( @chromosome1 is copy, @chromosome2 is copy ) is export {
    my $length = @chromosome1.elems;
    my $xover1 = (^($length-2)).pick;
    my $xover2 = ($xover1^..^$length).pick;
    my @x-chromosome = @chromosome2;
    my @þone = $xover1..$xover2;
    @chromosome2[@þone] = @chromosome1[@þone];
    @chromosome1[@þone] = @x-chromosome[@þone];
    return [@chromosome1,@chromosome2];
}
