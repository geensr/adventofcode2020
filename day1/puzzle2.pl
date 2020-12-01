#!/usr/bin/perl -w

use strict;
use warnings;

my @vals = ();

while(<>) {
  chomp;
  push @vals, $_;
}

while(@vals) {
  my $val1 = pop @vals;
  foreach my $val2 (@vals) {
    foreach my $val3 (@vals) {
      if (($val1+$val2+$val3)==2020) {
        print("Sum 2020 multiplied=",$val1*$val2*$val3,"\n");
        exit();
      }
    }
  }
}
