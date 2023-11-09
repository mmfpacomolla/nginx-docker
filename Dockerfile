#Imagen base
FROM debian

#Actualizaciones + instalación de VIM + instalación del servidor web NGINX
RUN apt update && \
    apt install -y vim && \
    apt install -y nginx && \
    apt install -y php8.2-fpm

#Copio la web que quiero publicar desde el anfitrión al contenedor
COPY web1/public_html /var/www/html/web1/public_html

#--- VirtualHosts ---
#Copio el archivo de configuración del VirtualHost
COPY web1/web1.com /etc/nginx/sites-available
#Activo el virtualhost previamente copiado
RUN ln -s /etc/nginx/sites-available/web1.com /etc/nginx/sites-enabled/

#Expongo el puerto de NGINX
EXPOSE 80

#Habilito nginx para que cada vez que el contenedor se inicie, NGINX se inicie también
ENTRYPOINT ["/bin/bash", "-c", "php-fpm8.2; nginx -g 'daemon off;' "]