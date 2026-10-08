# HCL, HASHICORP CONFIGURATION LANGUADE
Terrafomr se escribe en HCL, es un lenguade declarativo orientado a infrastructura

```hcl
resource "aws_instance" "example" {
    instance_type = "t3.micro"
}
```

En los archivos `.tf`describes **resources** arguemntos y relaciones entre componentes.


## La anatomía de un archivo 
La sintaxis se compone esencialmente de **Bloques**, **Argumentos** y **Atributos**.

## Estructura de un Bloque - La anatomía básica
Un bloque es un contenedor que define un objeto de infraestructura. Tiene este aspecto:

````hcl
# Tipo de Bloque | Etiqueta 1 (Provider tipo) | Etiqueta 2 (Nombre local)
resource "aws_instance" "servidor_web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Argumento (Key = Value)
  instance_type = "t2.micro"               # Argumento
}
```

### Block Type
Define qué estamos haciendo. Ejemplo:
- resource
- veriable
- output
- provider
- data

### Block Labels
Varían según el tipo de bloque. En un resource, la primera etiqueta indica el tipo de recurso del proveedor (ej. aws_instance) y la segunda es un nombre lógico e interno que tú eliges para identificarlo dentro de tu código (ej. servidor_web).


### Arguments
Son pares de clave = valor dentro de las llaves {} que configuran el bloque.

