#!/usr/bin/env tclsh
package require base64

proc crypto {input times method} {
  set output $input
  for {set i 0} {$i < $times} {incr i} {
    if { $method == "encrypt" } {
      set output [::base64::encode $output]
    } elseif { $method == "decrypt" } {
      set output [::base64::decode $output]
    } else {
      puts "Invalid method specified"
      exit 1
    }
  }
  return $output
}

proc usage {} {
  puts "Insufficient arguments. Expects: <string:input> <int:times>"
  exit 1
}

if { [llength $argv] != 2 } {
  usage
}

set input [lindex $argv 0]
set times [lindex $argv 1]

if {![string is integer -strict $times]} {
  usage
}

set encryptedResult [crypto $input $times "encrypt"]
set decryptedResult [crypto $encryptedResult $times "decrypt"]

puts "\"encrypted\" $encryptedResult" 
puts "\"decrypted\" $decryptedResult"
