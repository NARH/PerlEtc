#!/usr/bin/env perl
#

use warnings ;
use strict ;
use DB_File ;

my $filename = "text" ;
unlink $filename ;

my @h ;
tie @h, "DB_File", $filename, O_RDWR|O_CREAT, 0666, $DB_RECNO 
  or die "Cannot open file 'text': $!\n" ;

# いくつかのキー／値の組をファイルに加えます
$h[0] = "orange" ;
$h[1] = "blue" ;
$h[2] = "yellow" ;

push @h, "green", "black" ;

my $elements = scalar @h ;
print "The array contains $elements entries\n" ;

my $last = pop @h ;
print "popped $last\n" ;

unshift @h, "white" ;
my $first = shift @h ;
print "shifted $first\n" ;

# キーの存在をチェックします
print "Element 1 Exists with value $h[1]\n" if $h[1] ;

# マイナスのインデックスを使います
print "The last element is $h[-1]\n" ;
print "The 2nd last element is $h[-2]\n" ;

untie @h ;
