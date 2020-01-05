package main

import (
	b64 "encoding/base64"
	"fmt"
	"os"
	"strconv"
)

func crypto(s *string, r int, method string) {
	for i := 1; i <= r; i++ {
		if method == "encrypt" {
			*s = b64.StdEncoding.EncodeToString([]byte(*s))
		} else if method == "decrypt" {
			b, _ := b64.StdEncoding.DecodeString(*s)
			*s = string(b)
		}
	}
}

func main() {
	string := os.Args[1]
	rounds, err := strconv.Atoi(os.Args[2])
	if err != nil {
		fmt.Println(err)
	}

	crypto(&string, rounds, "encrypt")
	fmt.Printf("\"encrypted\" %v", string)

	fmt.Println()

	crypto(&string, rounds, "decrypt")
	fmt.Printf("\"decrypted\" %v\n", string)
}
