#!/usr/bin/env python3

import base64
import sys

def crypto(string="test", rounds=3, method="encrypt"):
    for i in range(rounds):
        if method == "encrypt":
            string = base64.b64encode(string.encode("utf-8"))
        elif method == "decrypt":
            string = base64.b64decode(string.encode("utf-8"))
        string = string.decode("utf-8")
    return string


string = sys.argv[1]
rounds = int(sys.argv[2])

enc_value = crypto(string, rounds, "encrypt")

print(f'"encrypted" {enc_value}')
print(f'"decrypted" {crypto(enc_value, rounds, "decrypt")}')
