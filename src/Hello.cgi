#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use CGI;
use JSON;
use Encode;
use DB_File;
use Fcntl ;

my $database = '/tmp/transaction.db';
my %contents;
my $db = tie %contents, 'DB_File', $database, O_RDWR|O_CREAT, 0644, $DB_BTREE || die "Could not open DBM file $database: $!\n";

my $json = {
  result=>"success",
  message=>"OK"
};

$contents{"1"} = $json;

print "Content-type: text/html \n\n";

foreach(keys %contents) {
  print "$_ => $contents{$_}{result}\n";
}
untie %contents;

print "Hello World\n";

exit 0;

=pod

=encoding utf8

=head1 NAME

はろーわーるどです。

=head1 SINOPSYS

とくに使い方はありません。

=cut
