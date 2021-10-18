#!/usr/bin/env perl

use MIME::Base64;
use warnings;
use strict;
use Scalar::Util qw(looks_like_number);

sub crypto {
  my ($input, $times, $method) = @_;
  my $output = $input;
  for((1..$times)) {
    if ( $method eq "encrypt" ) {
      $output = encode_base64($output);
    } elsif ( $method eq "decrypt" ) {
      $output = decode_base64($output);
    } else {
      print("Unsupported method entered\n");
      exit(1)
    }
  }
  return $output;
}

if ( $#ARGV != 1 ) {
  print("Insufficient arguments. Expects: <string:input> <int:times>\n");
  exit(1)
}

my ($input, $times) = @ARGV;
if (not looks_like_number($times)) {
  print("Times must be an integer value.");
  exit(1)
}

my $encryptResult = crypto($input, $times, "encrypt");

print("\"encrypted\" " . $encryptResult);
print("\"decrypted\" " . crypto($encryptResult, $times, "decrypt") . "\n");
