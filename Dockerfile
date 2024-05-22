FROM ubuntu

# Instalamos Nginx
RUN apt-get update && apt-get install -y nginx

# Intalamos node
RUN apt install -y nodejs

# Instalamos npm
RUN apt install -y npm

# Copiamos el proyecto
COPY bienvenido /home/bienvenido

# Instalamos las dependencias necesarias para el proyecto Angular con angular CLI
RUN npm install -g @angular/cli && \
    cd home/bienvenido && \
    npm install

# Compila la aplicación Angular
RUN cd home/bienvenido && \
    npm run build

# Copiamos el directorio de la app de angular a la carpeta de html para el servidor nginx
COPY bienvenido/dist/bienvenido/angular-app /var/www/html/

# Copia la configuración personalizada de Nginx
COPY default /etc/nginx/sites-enabled/default

#Corremos el servicio de nginx 
RUN service nginx start

# Creamos un volumens para los archivos de la aplicacion de angular
VOLUME /var/www/html/
ADD ["/bienvenido/dist/bienvenido/angular-app","/var/www/html/"]

#Exponemos el puerto 80 para el servidor de nginx
EXPOSE 80

# Comandos para iniciar el servidor Nginx, solo en caso de que el anterior RUN no lo active
CMD ["sh", "-c","nginx -g 'daemon off;'"]
