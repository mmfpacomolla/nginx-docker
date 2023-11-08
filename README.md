# Contruir la imagen
Para construir la imagen, ejecutar:
`docker build -t mi-nginx:1 .`
- Si lo deseas, puedes cambiar el nombre y la etiqueta de la imagen

# Crear y arrancar contenedor
Para construir la imagen, ejecutar:
`docker run --name my_nginx -p 8080:80 -d mi-nginx:1`
- Si lo deseas, puedes cambiar el nombre del contendor y el mapeo del puerto
