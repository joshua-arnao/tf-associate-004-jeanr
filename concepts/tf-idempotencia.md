# IDENPOTENCIA
La **idempotencia** es la propiedad de algunas herramientas y sistemas mediante la cual **ejecutar una misma operación múltiples veces produce exactamente el mismo resultado** que si se hubiera ejecutado una sola vez, sin alterar el estado del sistema ni duplicar recursos.

En el contexto de Terraform e IaC, significa que no importa el estado inicial de tu infraestructura, ni cuántas veces ejecutes tu código; **Terraform siempre garantizará que el entorno real coincida exactamente con lo que declaraste en tus archivos `.tf`**.

# Ejemplo Práctico (Examen)

Imagina que tienes un código de Terraform que define la creación de **1 base de datos** y ejecutas el comando `terraform apply`:

1. **Primera ejecución:** Terraform ve que no hay ninguna base de datos en tu nube. **Crea la base de datos.**
2. **Segunda ejecución (Inmediatamente después):** Terraform lee tu código, revisa el archivo de estado (`terraform.tfstate`), ve que la base de datos ya existe en la nube y que no hay cambios. **No hace nada.**
3. **Tercera ejecución:** Terraform vuelve a revisar. **Sigue sin hacer nada.**

Si esta operación **no** fuera idempotente (como un script de Bash imperativo tradicional), cada vez que corrieras el comando se crearía una base de datos nueva, lo que resultaría en 3 bases de datos y triples costos.

