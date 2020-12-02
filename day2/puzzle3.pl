#!/usr/bin/perl -w

use strict;
use warnings;

my $debug=0;

my $validcount = 0;

while(<>) {
    if (/(\d+)-(\d+)\s+(.):\s+(.*)/) {
        my $min = $1;
        my $max = $2;
        my $char = $3;
        my $pass = $4;

        print("min=$min, max=$max, char=$char, pass=$pass  ") if $debug;
    
        my $charcount = () = $pass =~ m/$char/g;
        print("count=$charcount => ") if $debug;

        if ($min <= $charcount && $charcount <= $max) {
            print("valid\n") if $debug;
            $validcount++;
        } else {
            print("FAIL!\n") if $debug;
        }
    }
}

print("Found $validcount valid passwords\n")