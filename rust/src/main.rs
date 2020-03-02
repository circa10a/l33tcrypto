extern crate base64;

use base64::{decode, encode};
use std::{env, str};

fn encrypt(plain_text: &String, rounds: i32) -> String {
    let mut cipher_text: String = plain_text.clone();
    for _x in 0..rounds {
        cipher_text = encode(&cipher_text);
    }

    return cipher_text;
}

fn decrypt(cipher_text: &str, rounds: i32) -> String {
    let mut plain_text: &str = cipher_text;
    let mut tmp_slice: Vec<u8>;
    for _x in 0..rounds {
        tmp_slice = decode(&plain_text).unwrap();
        plain_text = str::from_utf8(&tmp_slice).unwrap();
    }

    return plain_text.to_string();
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let plain_text: &String = &args[1];
    let rounds: i32 = args[2].parse().unwrap();
    let cipher_text: String = encrypt(plain_text, rounds);
    println!("\"encrypted\" {}", cipher_text);
    let plain_text: String = decrypt(&cipher_text, rounds);
    println!("\"decrypted\" {}", plain_text);
}
