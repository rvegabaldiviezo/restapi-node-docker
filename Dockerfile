#Desde DockerHub voy a utilizar el repo de NODE, especificamente la version 12.
FROM node:12 

#Directorio de trabajo: crear una carpeta o especificar donde esta el directorio de trabajo
## le decimos que esta en la carpeta llamada app, va a contener todos los archivos necesarios 
## para que funcione la app. Pero ¿como pasamos los archivos que tenemos en el proyecto a este 
## directorio de trabajo? Atraves de otro comando Docker llamado COPY.
WORKDIR /app 

#Comando para copiar archivos: 
## ./ significa que es el directorio de trabajo
## usar asterisco (*) significa que son todos los archivos que empiezan con package y que terminan con .json
COPY package*.json ./

## necesitamos ejecutar el comando npm install que ejecuta los archivos "package*.json" que
## instalan todas las dependencias que en el se indiquen y que son necesarias para la app.

#Comando de Docker para ejecutar comandos
## al ejecutar este comando se crea la carpeta "node_modules" DENTRO DEL CONTAINERS
## una vez creada esta carpeta ya puede comenzara a ejecutar las depencias.
RUN npm install

## el siguiente paso es copiar todos los archivos necesarios dentro del container
## usando "." le indicamos que copie todo lo que contiene nuestro proyecto
## COPIA TODOS LOS ARCHIVOS DEL PROYETO AL DIRECTORIO ACTUAL O AL DIRECTORIO ACTUAL DE TRABAJO
## copia todos los archivos adentro de nuestro contenedor 
COPY . .

##Para no copiar la carpeta node_modules ya que esta puede ser descargada, usamos ".dockerignore"
## que es un archivo para tal fin.

#Para correr/ejecutar el proyecto
## Le indicamos que ejecute el comando: $ node src/index.js
## CMD [ "node", "src/index.js" ]
## Pero como dentro del archivo package.json definimos en la key scripts el comando start, podemos 
## ejecutarlo de esta manera
CMD [ "npm", "start"]

#Para que todo esto pueda ejecutarse necesitamos primero crear una IMAGEN:
## Es todos los archivos y la configuraciones necesarias para que funcione el proyecto.
## Correr x consola el siguiente comando para generar una Imagen:
##  $ docker build
## Pero tenemos que indicarle el nombre, para eso le pasamos el parametro: -t <nombre>
##  $ docker build -t node-restapi
## Falta indicarle que archivos va a tener esta imagen: usando un punto (.) le indicamos que todos los archivos.
##  $ docker build -t node-restapi .