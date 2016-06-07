Claves para acceder a los repositorios:

Es necesario crear un directorio "ssh" con la siguiente estructura:

	+ ssh
	|-- keys
	|	|--- key1
	|	|----key1.pub
	|-- config

El subdirectorio "keys" contiene los pares de claves que queramos usar.
El archivo "ssh/config" es un archivo de configuracion ssh (~/.ssh/config) que se copia en el directorio $HOME del usuario "vagrant". Ahi se pueden definir todos los hosts y las claves asociadas que sean necesarios.

Configuración de git:

Se puede cargar la configuración de git para el usuario **vagrant** (el archivo .gitconfig) automáticamente.
Para ello, se deberá crear en el directorio principal, junto con la Vagrantfile un archivo llamado **_gitconfig** con el contenido deseado. Se puede copiar el de la máquina host.
Este archivo se colocará en el lugar adecuado durante la fase de aprovisionamiento.