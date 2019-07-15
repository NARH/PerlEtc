#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use CGI;
use JSON;
use Encode;
use DB_File;
use Fcntl ;

my $q = CGI->new;
my $json  = JSON->new->utf8(0);

# REQUEST HEADER の取得
my %headers = map { $_ => $q->http($_) } $q->http();

# REQUEST_METHOD が POST の場合のみ値を取得する
# それ以外はエラーとする
my $requestData = $q->param('POSTDATA');

# 取得したデータをJSONオブジェクトとしてパースする
my $requestJSON = $json->decode($requestData);

# Content-type の出力
print $q->header(-type=>'application/json', -charset=>'utf-8');

# JSONに期待するパラメータがあるか判定
if($requestJSON->{'auid'}) {
} else {
  # 存在しない場合はエラーを返却
  my $errorData = {
    result=>"9",
    error_detail=>"E001"
  };
  print
    $q->header(
      -status=>"500 Internal Server Error",
      -type=>'application/json', -charset=>'utf-8');
  print $json->encode($errorData);
  exit 1;
}

# 取得したデータの出力
foreach(keys %headers){print "$_ : $headers{$_}\n"};
print $json->encode($requestJSON);

exit 0;

=pod

=encoding utf8

=head1 NAME

ゆったり後払いのスタブCGI

=head1 SINOPSYS

https://<サーバーFQDN>/yuttari/Auth.cgi

へ規定のJSONデータをPOSTしてください。
curl  の場合は

curl -H 'Content-Type:application/json' -H 'Accept-Encoding:gzip,deflate' -d "{"key":"val","key2":",val2"}" https://<サーバーFQDN>/yuttari/Auth.cgi

のようにPOSTします。

=cut
# vim: set ts=2 sw=2 sts=2 expandtab ff=unix fenc=utf-8:
