#!/bin/bash

if [[ "$USER" == "root" ]]; then
  echo
  echo "Debes setear las variables de entorno, USER actualmente es 'root'."
  echo "Ejemplo:"
  echo
  echo "USER=aurex \ "
  echo "PASS=PASSWORD \ "
  echo "KEY_URL=https://dl.dropboxusercontent.com/s/j3xj1n5nqgur9af/Mi-public-key.pub \ "
  echo "HOST=myapp.uan.mx \ "
  echo "./postinstall.sh"

  exit 1
fi

if [[ -z $HOST ]]; then
  echo
  echo "Necesitas setear las variables de entorno y correr el ./postinstall.sh"
  echo "USER, PASS y KEY_URL son opcionales."
  echo "Ejemplo:"
  echo
  echo "USER=aurex \ "
  echo "PASS=PASSWORD \ "
  echo "KEY_URL=https://dl.dropboxusercontent.com/s/j3xj1n5nqgur9af/Mi-public-key.pub \ "
  echo "HOST=myapp.uan.mx \ "
  echo "./postinstall.sh"

  exit 1
fi

if [[ ! -f /postinstall/postinstall-ok-init ]]; then
	mkdir /postinstall
  # cp -rf ./ /postinstall
  # chmod +x /postinstall/*.sh
  # chmod +x /postinstall/shell/*.sh
    chmod +x ./*.sh
    chmod +x ./shell/*.sh
  touch /postinstall/postinstall-ok-init

	echo -e "\n\n----------\n- Scripts de postinstall instalados /postinstall/postinstall-ok-init\n----------\n\n\n"
fi

./shell/postinstall-setup.sh 	# Post install... Crea usuario, yum update, instala dev tools, git, puppet y sus necesarios,
./shell/aurex.sh   				# Snippets personales

