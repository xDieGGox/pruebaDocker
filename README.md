# EJECUCIÓN DE LA IMAGEN
Link de DockerHub: https://hub.docker.com/r/dieggox/prueba
Link de la aplicacion de angular: https://github.com/xDieGGox/bienvenido.git
La imagen nos sirve para poder desplegar un sistema de angular en una imagen de ubuntu con node

Ejecutamos el comando como administrador en una terminal:
#### docker pull dieggox/prueba

Este nos descarga la imagen para poder utilizarla.

Para poder ejecutar la imagen y acceder a los puertos de forma local recomendamos utilizar el siguiente comando:
#### "docker run -d -it -v /var/www/html/:"directoriodesucarpeta" -p 4200:80 dieggox/prueba"

El puerto 4200 puede cambiarse por los deseados por el usuario, sin embargo los del contenedor no.

Finalmente, en nuestro navegador de forma local, abrimos ambos puertos, el 4200 para ver la aplicacion de angular en funcionamiento.

Al final se desplegara la aplicación de la siguiente manera:


[![JiDmx6v.md.png](https://iili.io/JiDmx6v.md.png)](https://freeimage.host/i/JiDmx6v)
