import gleam/bit_array
import gleam/int
import gleam/io
import shellout.{arguments}

type Method {
  Encrypt
  Decrypt
}

fn crypto(s: String, rounds: Int, method: Method) {
  case rounds, method {
    0, _ -> s
    n, Encrypt ->
      s
      |> bit_array.from_string()
      |> bit_array.base64_encode(True)
      |> crypto(n - 1, method)

    n, Decrypt -> {
      let assert Ok(dec) = bit_array.base64_decode(s)
      let assert Ok(dec_s) = bit_array.to_string(dec)

      crypto(dec_s, n - 1, method)
    }
  }
}

pub fn main() {
  let assert [secret, rounds_s] = arguments()
  // why handle errors when we can just crash?
  let assert Ok(rounds) = int.parse(rounds_s)

  let encrypted = crypto(secret, rounds, Encrypt)

  io.println("\"encrypted\" " <> encrypted)
  io.println("\"decrypted\" " <> crypto(encrypted, rounds, Decrypt))
}
