#!/usr/bin/env perl
#

use strict;
use warnings;
use utf8;
use DB_File;

my %hash;
my $filename = "test.db";
my $X = tie %hash,  'DB_File', $filename, O_RDWR|O_CREAT, 0600, $DB_BTREE ;
my $status = $X->put("a","TEST");
print $status;
undef $X;
untie %hash ;
exit 0;
