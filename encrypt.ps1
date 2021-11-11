#!/usr/bin/env pwsh

function crypto ($string,$rounds,$method) {
  if ($method -eq "encrypt") {
    foreach ($i in (1..$rounds)) {
      $string = [System.Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($string))
      $global:enc_value = $string
    }
  }
  elseif ($method -eq "decrypt") {
    foreach ($i in (1..$rounds)) {
      $global:enc_value = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($global:enc_value))
    }
  }
  return "`"$method`" $global:enc_value"
}

# Calling all functions
crypto $args[0] $args[1] encrypt
crypto $args[0] $args[1] decrypt
