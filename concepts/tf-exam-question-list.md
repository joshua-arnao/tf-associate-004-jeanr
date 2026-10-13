# Exam question list
1. **Your team manages long-lived VMs with a configuration management tool, but drift and rollbacks are frequent. You're evaluating alternatives. Which option best reflects an IaC advantage over traditional configuration management?**
A) Using declarative IaC and immutable infrastructure allows you to define the desired state in code, easily replace resources, and version everything.
- **¿Es correcta?** **SÍ.**
- **¿Por qué?** Al usar **infraestructura inmutable**, en lugar de intentar "reparar" o "parchear" un servidor viejo que ha sufrido desvíos (*drift*), simplemente lo destruyes y lo reemplazas por uno nuevo idéntico basado en tu código. Además, al ser **declarativo**, el código define el estado final que deseas y permite que todo el entorno sea controlado por versiones (Git), solucionando de raíz el problema de los desvíos frecuentes y los fallos al revertir cambios (*rollbacks*).

B) Use configuration management to provision resources and IaC to patch resources while keeping the same mutable servers and workflows.
- **¿Es correcta?** **No.**
- **Invierte erróneamente los roles.** Las herramientas de gestión de configuración (como Ansible) están diseñadas para configurar y parchear el software dentro de los servidores, mientras que la IaC (como Terraform) se usa para el aprovisionamiento de la infraestructura base. Además, propone mantener servidores mutables, lo cual perpetúa el problema del *drift*.

C) IaC isn't useful in this scenario. Standardize on imperative scripts to run identical steps on each server during scheduled maintenance windows.
- **¿Es correcta?** **No.**
- **Es incorrecta conceptualmente.** Afirma que la IaC no es útil en este escenario, lo cual es falso, ya que la IaC inmutable es justamente la solución estándar de la industria para erradicar el desajuste de configuraciones en máquinas virtuales de larga vida útil. Además, propone regresar a scripts imperativos, que son más difíciles de mantener y propensos a errores.

D) Maintain configuration management for servers and export the current VMs as golden images once configurations have converged.
- **¿Es correcta?** **No.**
- **No soluciona el problema de fondo de forma automatizada.** Exportar imágenes fijas (*golden images*) manualmente o depender de que las configuraciones tradicionales converjan en servidores mutables sigue requiriendo un mantenimiento operativo alto y no aprovecha la ventaja de un flujo declarativo basado 100% en código dinámico.


2. **Your organization uses Chef to configure application settings and install software packages on existing servers. The DevOps team is evaluating whether to adopt Terraform alongside Chef. Which statement best explains how Infrastructure as Code tools, like Terraform, differ from configuration management tools?**

**A) Infrastructure as Code tools focus on provisioning and managing the lifecycle of infrastructure resources, while configuration management tools focus on installing and managing software on existing servers.**
* **¿Es correcta?** **SÍ.**
* **¿Por qué?** Define a la perfección la separación de responsabilidades en la industria. Las herramientas de IaC (como Terraform) nacieron para el **aprovisionamiento** (crear la base: redes, subredes, firewalls y balanceadores). Las herramientas de gestión de configuración (como Chef, Ansible o Puppet) entran en una fase posterior para **configurar el interior** de esos servidores (instalar paquetes, parches, bases de datos o mover archivos de código).

**B) Infrastructure as Code tools can only create cloud resources and virtual machines, while configuration management tools can create both cloud and on-premises resources, including physical hardware.**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Es completamente falsa porque Terraform **no está limitado a la nube pública**. A través de sus proveedores (*providers*), Terraform puede aprovisionar recursos *on-premises* (locales) interactuando con tecnologías como VMware vSphere, OpenStack o hardware de red físico (Cisco, F5). Por otro lado, Chef no es una herramienta diseñada para crear hardware físico.

**C) Infrastructure as Code tools use agentless architectures to communicate with cloud providers, while configuration management tools always require agents to be installed on target systems.**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Aunque Terraform es *agentless* (no requiere agentes instalados en las VMs de destino porque se comunica directo con las APIs de la nube), la afirmación falla al decir que las herramientas de gestión de configuración *siempre* requieren agentes. Herramientas líderes como **Ansible** son 100% *agentless* y trabajan a través de SSH/WinRM, rompiendo esa regla absoluta.

**D) Infrastructure as Code tools use imperative programming models to define step-by-step infrastructure changes, while configuration management tools use declarative models for desired state.**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Invierte los papeles de manera incorrecta. Como ya aprendiste, Terraform (IaC) utiliza un modelo **declarativo** (defines el estado final en HCL y él calcula el camino). Por su parte, aunque herramientas como Chef usan enfoques declarativos para sus "recetas", catalogar a Terraform como un modelo puramente imperativo de paso a paso es conceptualmente erróneo y una trampa clásica del examen.

3.**Your company uses AWS for production and Azure for development, and currently uses CloudFormation for AWS and ARM templates for Azure. What is the main benefit of switching to Terraform for both cloud platforms?**

**A) teams can use the same workflow and configuration language for both clouds**
* **¿Es correcta?** **SÍ.**
* **¿Por qué?** Esta es la definición exacta de la ventaja competitiva de Terraform en escenarios multi-cloud. Al unificar ambas nubes bajo Terraform, tu equipo de ingeniería DevOps solo necesita dominar un único lenguaje de configuración (**HCL**) y un único flujo de trabajo operativo (**init -> plan -> apply -> destroy**). Esto elimina la necesidad de que el equipo aprenda y mantenga sintaxis totalmente distintas y propietarias como los JSON/YAML de CloudFormation y ARM Templates.

**B) Terraform runs faster than native cloud tools like CloudFormation and ARM**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Aunque la velocidad de ejecución puede variar dependiendo del tamaño de la infraestructura, decir que una herramienta externa como Terraform siempre "corre más rápido" de manera nativa que las herramientas oficiales de los propios proveedores de nube (diseñadas e integradas directamente en el plano de control de AWS y Azure) es un supuesto incorrecto y **no representa el beneficio principal** ni la razón por la cual una empresa adopta Terraform.

**C) Terraform automatically syncs resources between AWS and Azure environments**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Terraform es una herramienta declarativa de aprovisionamiento, **no un motor de sincronización o replicación automática entre nubes**. Terraform creará de forma aislada los recursos que tú declares en AWS y los que declares en Azure. Si deseas que un entorno en AWS se sincronice o hable con Azure, debes configurar tú mismo esa conectividad y replicación de datos de forma explícita en tu código HCL (por ejemplo, mediante VPNs o conexiones de red dedicadas).

**D) teams no longer need to understand cloud-specific services and features**
* **¿Es correcta?** **NO.**
* **¿Por qué?** Esta es una de las trampas más recurrentes y peligrosas de la certificación. Aunque Terraform unifica el flujo de trabajo, **NO abstrae la infraestructura subyacente**. El equipo de DevOps aún necesita entender perfectamente cómo funcionan los servicios específicos de cada proveedor. Sigues necesitando saber qué es una VPC y una AMI en AWS, o qué es un Resource Group y una VNet en Azure. Terraform no convierte automáticamente un concepto de AWS en uno de Azure; solo te da un lenguaje común para declararlos.
