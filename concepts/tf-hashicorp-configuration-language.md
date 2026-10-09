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

## Diferencia entre un lenguaje Declaratico vs Imperativo
En el mundo de la Infraestructura como Código (IaC) y DevOps, **Declarativo** e **Imperativo** son **paradigmas o enfoques de diseño**. Definen la filosofía bajo la cual una herramienta interpreta tus instrucciones y cómo interactúa con los recursos en la nube. 

Para el examen **Terraform Associate**, es una pregunta fija comprender que **Terraform y HCL pertenecen exclusivamente al modelo Declarativo**.

| Característica | Enfoque Declarativo <br>*(Terraform / HCL / Kubernetes)* | Enfoque Imperativo <br>*(Scripts Bash, AWS CLI, Python)* |
| :--- | :--- | :--- |
| **¿En qué se enfoca?** | En el **¿Qué?** (El estado final deseado). | En el **¿Cómo?** (Los pasos exactos a seguir). |
| **La analogía** | Le dices a un taxista: *"Lévame al aeropuerto"*. Él calcula la ruta para llegar ahí. | Le dices a un taxista: *"Avanza 3 cuadras, dobla a la derecha, frena, acelera"*. |
| **Ejemplo de lógica** | *"Quiero que existan 3 máquinas virtuales llamadas Servidor-Web"*. | *"Crea una máquina. Espera. Configura la IP. Si ya existe otra, detén el script..."* |
| **Manejo del estado** | **Excelente y nativo.** La herramienta compara tu código contra la realidad y solo aplica los cambios necesarios (Idempotencia pura). | **Complejo y manual.** Tienes que programar lógica para validar si un recurso ya existe antes de intentar crearlo de nuevo. |
| **Facilidad de lectura** | **Muy alta.** El código se lee como un inventario o plano arquitectónico de lo que tienes en tu nube. | **Media/Baja.** El código parece una receta de cocina llena de bucles, condicionales (`if/else`) y comandos secuenciales. |

