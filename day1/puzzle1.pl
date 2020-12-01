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
    if (($val1+$val2)==2020) {
      print("Multiplication of $val1 and $val2 = ",$val1*$val2,"\n");
      exit();
    }
  }
}
