# Postinstall

## Post instalacion de un container LXC Centos 8

Uso:

```bash
wget https://github.com/aurexs/postinstall/archive/v0.2.zip
unzip postinstall.zip
cd postinstall-0.1
chmod +x postinstall.sh

USER=aurex \
KEY_URL=https://gist.githubusercontent.com/aurexs/d27be135ac167559ac0f4abd4dae7714/raw/3ede1a447776818a0f1e1ab0a6f721db7b052a2f/id_rsa.pub \
HOST=nas.se.uan.mx \
./postinstall.sh
```

## Ajustes

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
- Mensaje del día
