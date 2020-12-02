#!/usr/bin/perl -w

use strict;
use warnings;

my $debug=0;

my $validcount = 0;

while(<>) {
    if (/(\d+)-(\d+)\s+(.):\s+(.*)/) {
        my $p1 = $1;
        my $p2 = $2;
        my $char = $3;
        my $pass = $4;

        print("pos1=$p1, pos2=$p2, char=$char, pass=$pass  ") if $debug;
    
        my @array = split(//,$pass);

        if (($array[$p1-1] eq $char) xor ($array[$p2-1] eq $char)) {
            print("valid\n") if $debug;
            $validcount++;
        } else {
            print("FAIL!\n") if $debug;
        }
    }
}

print("Found $validcount valid passwords\n")