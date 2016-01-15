# Postinstall
##Post instalacion de una VM.

Uso:
```
wget https://github.com/aurex123/postinstall/archive/v0.1.zip
unzip postinstall.zip
cd postinstall-0.1
chmod +x postinstall.sh

USER=aurex \
PASS=PASSWORD \
KEY_URL=https://dl.dropboxusercontent.com/s/5asd5asd5as5d/Mi-public-key.pub \
HOST=myapp.uan.mx \
./postinstall.sh
```

##Ajustes
- Actualiza paquetes.
- Instala algunos paquetes básicos según la version del server.

- Agrega un \$USER y le pone el \$PASS o lo pide si no se setea la variable PASS
- Lo hace sudoero.
- Sy trae una \$KEY_URL la instala en la carpeta de .ssh
- Instala los git-completion
- Instala los alias y el tema de vim
- Instala cualquier DotFile en la carpeta ./files/dot
- Instala algunos DotFiles para el root (coloreo de sintaxis en sudo vi, aliases, etc).
- Instala algunos bin utiles (spot: para buscar dentro de archivos).

- Optimizaciones de red

- Establece zona horaria a America/Mazatlan
- Sincroniza la hora con ntp
- Mensaje del dia
