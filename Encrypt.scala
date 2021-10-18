import java.util.Base64
import scala.util.{Try, Success, Failure}

object Encrypt {
  val ENCRYPT = "encrypt"
  val DECRYPT = "decrypt"

  def main(args: Array[String]) = {
    if ( args.size != 2 ) {
      println("Insufficient arguments. Expects: <string:input> <int:times>")
      sys.exit(1)
    }

    var input = args(0)

    // show me the better way to do this cruft
    var times = 0
    try {
      times = args(1).toInt
    } catch {
      case e: Exception => {
        println("Times must be an integer value.")
        sys.exit(1)
      }
    }

    var encryptResult = crypto(input, times, ENCRYPT)

    println("\"encrypted\" " + encryptResult)
    println("\"decrypted\" " + crypto(encryptResult, times, DECRYPT))
  }

  def crypto(input: String, times: Int, method: String) : String = {
    var output = input
    for( a <- 1 to times) {
      if ( ENCRYPT.equalsIgnoreCase(method) )  {
        output = java.util.Base64.getEncoder.encodeToString(output.getBytes())
      } else if ( DECRYPT.equalsIgnoreCase(method) ) {
        output = new String(java.util.Base64.getDecoder.decode(output))
      } else {
        println("Unsupported method entered")
        sys.exit(1)
      }
    }
    return output
  }
}
