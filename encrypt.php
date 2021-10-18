#!/usr/bin/env php
<?php

function crypto($input, $times, $method) {
  $output = $input;
  for ($x = 0; $x < $times; $x++) {
    if ( $method == "encrypt" ) {
      $output = base64_encode($output);
    } else if ( $method == "decrypt" ) {
      $output = base64_decode($output);
    } else {
      echo "Unsupported method entered\n";
    }
  }
  return $output;
}

if ( $argc != 3 ) {
  echo "Insufficient arguments. Expects: <string:input> <int:times>\n";
  exit(1);
}


$input = $argv[1];
if (is_numeric($argv[2]))
  $times = $argv[2] + 0;
else
  echo "Times must be an integer value.\n";

$encryptResult = crypto($input, $times, "encrypt");

echo "\"encrypted\" " . $encryptResult . "\n";
echo "\"decrypted\" " . crypto($encryptResult, $times, "decrypt") . "\n";
