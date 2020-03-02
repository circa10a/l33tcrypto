# l33tcrypto 🔒

For HT

## Usage

- [l33tcrypto 🔒](#l33tcrypto)
  * [Usage](#usage)
    + [Go](#go)
    + [Python](#python)
    + [Bash](#bash)
    + [Java](#java)
    + [JavaScript](#javascript)
    + [Ruby](#ruby)
    + [Terraform (because why not)](#terraform-because-why-not)
    + [Ansible](#ansible)
    + [Puppet](#puppet)
    + [Clojure](#clojure)

### Go

```shell
# String, rounds of "encryption"
go run encrypt.go secret 3
```

### Python

```shell
# String, rounds of "encryption"
./encrypt.py secret 3
```

### Bash

```shell
# String, rounds of "encryption"
./encrypt.sh secret 3
```

### Java

```shell
# First, compile the class because this is fucking Java
$ javac Encrypt.java

# String, rounds of "encryption"
$ java Encrypt secret 3
```

### JavaScript

```shell
# String, rounds of "encryption"
node ./encrypt.js secret 3
```

### Ruby

```shell
# String, rounds of "encryption"
./encrypt.rb secret 3
```

### Terraform (because why not)

**Interactively**
```shell
$ terraform init && terraform apply -auto-approve
var.input
  Enter a value: secret

var.times
  Enter a value: 3

null_resource.encrypt: Creating...
null_resource.encrypt: Provisioning with 'local-exec'...
null_resource.encrypt (local-exec): Executing: ["/bin/sh" "-c" "./encrypt.py secret 3"]
null_resource.encrypt (local-exec): "encrypted" WXpKV2FtTnRWakE9
null_resource.encrypt (local-exec): "decrypted" secret
null_resource.encrypt: Creation complete after 0s [id=2042342408304500010]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

**Supply values on the CLI**

```shell
$ terraform apply -var input=secret -var times=3 -auto-approve
null_resource.encrypt: Creating...
null_resource.encrypt: Provisioning with 'local-exec'...
null_resource.encrypt (local-exec): Executing: ["/bin/sh" "-c" "./encrypt.py secret 3"]
null_resource.encrypt (local-exec): "encrypted" WXpKV2FtTnRWakE9
null_resource.encrypt (local-exec): "decrypted" secret
null_resource.encrypt: Creation complete after 0s [id=8726143734733607353]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

**Use a `tfvars` file**<br/>
Sample `terraform.tfvars`
```hcl
input="secret"
times=1
```


```shell
# Only run if it exists
$ test -f terraform.tfvars && terraform apply -auto-approve
null_resource.encrypt: Creating...
null_resource.encrypt: Provisioning with 'local-exec'...
null_resource.encrypt (local-exec): Executing: ["/bin/sh" "-c" "./encrypt.py secret 3"]
null_resource.encrypt (local-exec): "encrypted" WXpKV2FtTnRWakE9
null_resource.encrypt (local-exec): "decrypted" secret
null_resource.encrypt: Creation complete after 0s [id=3935885297718964381]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

### Ansible

```shell
ansible-playbook ./encrypt.yaml
```

### Puppet

```shell
puppet apply ./encrypt.pp
```


### Rust
```
cd rust
cargo run secret 3
```


### Clojure

```shell
# String, rounds of "encryption"
~/dev/l33tcrypto/l33tcrypto>lein run secret 3
```
