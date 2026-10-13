# CORE WORKFLOW
A pesar de que el código HCL cambie según la nube, el **Core Workflow de Terraform** no cambia nunca. Es una secuencia estricta de 4 pasos obligatorios que debes dominar para la certificación:

| Comando oficial | Función |
|:----------------|:--------|
| terraform init | inicializa el workind directory y prepara las dependencias necesarias |
| terraform plan | Genera un execution plan para revisar los cambios propuestos |
| terraform apply | Ejecuta los cambios aprobados y actualiza el state |
| terraform destroy | Genera y ejecuta un plan para destruir los objetos administrados por la configuración |

## El Core Workflow de Terraform frente a Múltiples Proveedores
Mientras que cada nube tiene sus propias reglas y nombres de recursos, el proceso para desplegarlos con Terraform es **exactamente el mismo**, sin importar si estás usando AWS, Azure, Google Cloud o cualquier otro proveedor.

