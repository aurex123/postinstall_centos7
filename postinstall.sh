#!/bin/bash

if [[ "$USER" == "root" ]]; then
  echo
  echo "Debes setear las variables de entorno, USER actualmente es 'root'."
  echo "Ejemplo:"
  echo
  echo "USER=aurex \ "
  echo "PASS=PASSWORD \ "
  echo "KEY_URL=https://gist.githubusercontent.com/aurexs/d27be135ac167559ac0f4abd4dae7714/raw/3ede1a447776818a0f1e1ab0a6f721db7b052a2f/id_rsa.pub \ "
  echo "HOST=myapp.uan.mx \ "
  echo "./postinstall.sh"

  exit 1
fi

if [[ -z "$HOST" ]]; then
  echo
  echo "Necesitas setear las variables de entorno y correr el ./postinstall.sh"
  echo "USER, PASS y KEY_URL son opcionales."
  echo "Ejemplo:"
  echo
  echo "USER=aurex \ "
  echo "PASS=PASSWORD \ "
  echo "KEY_URL=https://gist.githubusercontent.com/aurexs/d27be135ac167559ac0f4abd4dae7714/raw/3ede1a447776818a0f1e1ab0a6f721db7b052a2f/id_rsa.pub \ "
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

