# IAC
Trata la infraestrucutura como software. Es una práctica clave que consiste en **gestionar**, **configurar** y **aprovisionar** recursos de TI (como servidores, redes y bases de datos) mediante archivos de texto legibles por máquina en lugar de hacerlo de forma manual.

Esto también se puede ejecutar desde pipelines de **CI/CD**

## Enfoques principales de IaC
Existen dos formas de estructurar el código según la herramienta elegida:

- **Declarativo**: Tú defines el estado deseado de la infraestructura (por ejemplo: "quiero 3 servidores y 1 balanceador de carga"). La herramienta se encarga de calcular los pasos necesarios para lograrlo.
- **Imperativo**: Tú defines la lista de comandos secuenciales que la máquina debe seguir paso a paso para configurar el entorno.


> IaC signfica Infractucture as Code


## Ansible
Es una herramienta de **Gestión de Configuración (Configuration Management)** y automatización de TI desarrollada por Red Hat. Su propósito principal no es crear la infraestructura (las redes o las máquinas virtuales), sino **configurar el sistema operativo y el software dentro de máquinas que ya existen**.

Está diseñado para gestionar **Infraestructura Mutable** (servidores de larga vida útil):
1. **Parcheo en Sitio (In-Place Updates):** Si un servidor tiene Nginx 1.20 y necesitas actualizarlo a Nginx 1.22, Ansible entra al servidor mediante SSH, descarga los paquetes, actualiza el software y reinicia el servicio dentro de la misma máquina viva.
2. **Ciclo de Vida Extendido:** Está pensado para servidores que van a durar meses o años encendidos, asegurando que sus configuraciones no se desvíen con el tiempo.


## Terraform
Es una herramienta de **Aprovisionamiento de Infraestructura (Orchestration / Provisioning)**. No le importa lo que pase dentro del sistema operativo del servidor; su único trabajo es hablar con las APIs de la nube (AWS, Azure, GCP) para construir la infraestructura base (crear la VPC, el disco duro, balanceadores de carga y la máquina virtual vacía).

Tiene la filosofía de la **Infraestructura Inmutable**:

1. **Reemplazo total:** Si necesitas actualizar ese mismo Nginx de 1.20 a 1.22, el enfoque con Terraform no es entrar a modificar la máquina. Terraform destruye la máquina virtual vieja por completo y despliega una nueva máquina virtual que ya viene con la versión 1.22 preinstalada (usando una imagen previa creada con herramientas como Packer).
2. **Agnóstico al Sistema Operativo:** A Terraform no le importa si la máquina corre Ubuntu, Red Hat o Windows; solo le importa que la API de AWS le confirme que la máquina virtual fue encendida con éxito.
