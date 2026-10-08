# HCL, HASHICORP CONFIGURATION LANGUADE
Terrafomr se escribe en HCL, es un lenguade declarativo orientado a infrastructura

```hcl
resource "aws_instance" "example" {
    instance_type = "t3.micro"
}
```

En los archivos `.tf`describes **resources** arguemntos y relaciones entre componentes.
