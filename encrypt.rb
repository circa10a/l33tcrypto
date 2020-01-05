#!/usr/bin/env ruby

require "base64"

def crypto(string, rounds, method)
    rounds.times do |i|
        if method == "encrypt"
            string = Base64.encode64(string)
        elsif method == "decrypt"
            string = Base64.decode64(string)
        end
    end
    return string
end

string = ARGV[0]
rounds = Integer(ARGV[1])

enc_value = crypto(string, rounds, "encrypt")

puts "\"encrypted\" #{enc_value}"
puts "\"decrypted\" #{crypto(enc_value, rounds, "decrypt")}"
