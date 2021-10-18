import java.util.Base64
import kotlin.system.exitProcess

var ENCRYPT = "encrypt"
var DECRYPT = "decrypt"

class Encrypt(val input: String, val times: Int, val method: String) {

  fun crypto():String {
    if (input.count() == 0) return input

    var output = input
    for (i in 1..times) {
      if (ENCRYPT.equals(method, true)) {
       output = Base64.getEncoder().encodeToString(output.toByteArray())
      } else if (DECRYPT.equals(method, true)) {
       output = String(Base64.getDecoder().decode(output))
      } else {
        println("Unsupported method entered")
        exitProcess(1)
      }
    }
    return output
  }
}

fun main(args: Array<String>) {
  if (args.size != 2) {
    println("Insufficient arguments. Expects: <string:input> <int:times>")
    exitProcess(1)
  }
  val input = args[0]
  var times:Int

  try {
    times = args[1].toInt()
  } catch(e: java.lang.NumberFormatException) {
    println("Times must be an integer value.")
    exitProcess(1)
  }

  val encryptResult = Encrypt(input, times, ENCRYPT).crypto()

  println("\"encrypted\" " + encryptResult)
  println("\"decrypted\" " + Encrypt(encryptResult, times, DECRYPT).crypto())
}
