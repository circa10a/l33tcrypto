#!/usr/bin/env node

const crypto = (string, rounds, method) => {
    for (let i = 0; i < rounds; i++) {
        if (method == 'encrypt') {
            string = Buffer.from(string).toString('base64');
        } else if (method == "decrypt") {
            string = Buffer.from(string, 'base64').toString('ascii');
        }
    }
    return string;
}

string = process.argv[2];
rounds = process.argv[3];

let encvalue = crypto(string, rounds, "encrypt");

console.log(`"encrypted" ${encvalue}"`);
console.log(`"decrypted" ${crypto(encvalue, rounds, "decrypt")}`);
