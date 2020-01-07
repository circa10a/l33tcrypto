#!/usr/bin/env bash

crypto() {
	string="$1"
	rounds=$2
	method="$3"

	for i in $(seq 1 $rounds); do
		if [ $method == "encrypt" ]; then
			string=$(echo $string | base64)
		elif [ $method == "decrypt" ]; then
			string=$(echo $string | base64 --decode)
		fi
	done

	[ $method == "encrypt" ] && echo "\"encrypted\" $string" && enc_value=$string
	[ $method == "decrypt" ] && echo "\"decrypted\" $string"
}

enc_value=""
crypto $1 $2 "encrypt"
crypto $enc_value $2 "decrypt"
