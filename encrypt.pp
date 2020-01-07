class encrypt(
    $secret = "secret",
    $rounds = "3"
){
    exec { "encrypt":
        provider => "shell",
        command  => "encrypt.sh ${secrets} ${rounds}"
    }
}

# Execute declared class
contain encrypt
