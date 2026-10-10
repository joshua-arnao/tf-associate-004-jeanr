# INFRAESTRUCTURA MUTABLE E INMUTABLE
Estos conceptos definen **cómo se aplican las actualizaciones o cambios** a los servidores y recursos de TI una vez que ya han sido desplegados en la nube.

## 1. Infraestructura Mutable
En este enfoque, cuando un servidor necesita una actualización (como pasar Nginx de la versión 1.17 a la 1.18 o cambiar una configuración), **el cambio se aplica directamente sobre el servidor existente en producción**.
- **Herramientas típicas**: Ansible, Chef, Puppet, o scripts SSH manuales.
- **Problema**: Con el tiempo, si modificas 50 servidores uno por uno, algunos fallarán a mitad del proceso o acumularán parches distintos. Esto genera inconsistencias y da origen a los entornos "copo de nieve" (servidores que se supone que son iguales, pero tras bambalinas son únicos y diferentes).

## 2. Infraestructura Inmutable (Reemplazar en lugar de Modificar)
En este enfoque, **los recursos nunca se modifican en caliente**. Si necesitas actualizar Nginx de la versión 1.17 a la 1.18, no entras al servidor antiguo. En su lugar:
1. Se levanta un **servidor completamente nuevo** que ya viene preconfigurado con la versión 1.18.
2. Se valida que el nuevo servidor funcione.
3. El tráfico se desvía al nuevo servidor y **el servidor viejo se destruye**.

> ️ **Terraform utiliza un enfoque INMUTABLE por defecto**. Cuando modificas un argumento en HCL que la API de la nube no permite editar en vivo, Terraform destruirá el recurso viejo y creará uno nuevo desde cero (`Destroy and Replace`).

## ¿Qué es el Configuration Drift
El **Configuration Drift** ocurre cuando el estado real de los recursos desplegados en la nube **se desincroniza ** del estado deseado que definiste en tus archivos de código HCL o en tu archivo `terraform.tfstate`.

### ¿Por qué se produce el Drift?
- **Cambios manuales ("ClickOps"):** Un operador entra a la consola web y modifica un puerto, una regla de seguridad o un tamaño de disco sin actualizar el código de Terraform.
- **Herramientas externas:** Scripts automáticos de terceros que alteran propiedades de los recursos en segundo plano.

> El Drift es sumamente peligroso en producción. Si existe un desfase oculto en la nube que tú no conoces y ejecutas un comando como `terraform apply`, Terraform se verá obligado a forzar su comportamiento inmutable o declarativo. 
>
> Esto puede causar:
>- **Destrucción accidental:** Si el cambio manual alteró un atributo crítico (como la subnet o la AMI), Terraform destruirá el recurso vivo para intentar recrearlo con el formato original del código, provocando caídas de servicio (*downtime*) no planeadas.
>- **Brechas de seguridad:** Que se eliminen accesos creados manualmente para solucionar emergencias de infraestructura.

