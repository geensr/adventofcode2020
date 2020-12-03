#!/usr/bin/perl -w

use strict;
use warnings;

use Data::Dumper;
my $debug = 2;

my @map = ();
my $width = 0;
my $depth = 0;

# read the map
while(<>) {
  s/[\r\n]//g;
  next unless /[.#]+/;

  $depth++;
  $width = length($_) if $width eq 0;
  if (length($_) != $width) {
      print("Not all lines have same length!!\n");
      exit();
  }
  my @row = split(//,$_);
  push(@map,[@row]);
}

print ("Dimensions: $width x $depth\n") if $debug;
print("At coord 0,0 there is $map[0][0]\n") if $debug > 2;
print("At coord 0,1 there is $map[0][1]\n") if $debug > 2;
print("At coord 1,0 there is $map[1][0]\n") if $debug > 2;
print Dumper(@map) if $debug > 5;

sub counttreesonpath {
  my ($dcol,$drow) = @_;

  # start moving in the map
  # start at the top
  my $col = 0;
  my $row = 0;

  my $treesencountered = 0;

  while($row<$depth) {
    print("Now at position ($col,$row) which has a $map[$row][$col%$width]\n") if $debug > 3;
    $treesencountered++ if ($map[$row][$col%$width] eq '#');
    $row+=$drow;
    $col+=$dcol;
  }
  print("Encountered $treesencountered trees\n") if $debug > 2;
  return $treesencountered;
}

print("Found ",counttreesonpath(3,1)," for the original path\n") if $debug > 2;

my @slopes = ( # pairs of deltas, col,row
  [1,1],
  [3,1],
  [5,1],
  [7,1],
  [1,2]
);

my $result = 1;

foreach my $slope (@slopes) {
  my $deltacol = $slope->[0];
  my $deltarow = $slope->[1];

  my $count = counttreesonpath($deltacol,$deltarow);
  print("Found $count for the path ($deltacol,$deltarow)\n") if $debug == 2;
  $result *= $count;
}

print("The multiplication of all the paths is $result\n");
