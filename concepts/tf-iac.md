# IAC
Trata la infraestrucutura como software. Es una práctica clave que consiste en **gestionar**, **configurar** y **aprovisionar** recursos de TI (como servidores, redes y bases de datos) mediante archivos de texto legibles por máquina en lugar de hacerlo de forma manual.

Esto también se puede ejecutar desde pipelines de **CI/CD**

## Enfoques principales de IaC
Existen dos formas de estructurar el código según la herramienta elegida:

- **Declarativo**: Tú defines el estado deseado de la infraestructura (por ejemplo: "quiero 3 servidores y 1 balanceador de carga"). La herramienta se encarga de calcular los pasos necesarios para lograrlo.
- **Imperativo**: Tú defines la lista de comandos secuenciales que la máquina debe seguir paso a paso para configurar el entorno.


> IaC signfica Infractucture as Code