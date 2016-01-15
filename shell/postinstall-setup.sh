#!/bin/bash



if [[ ! -f /postinstall/postinstall-ok-setup ]]; then

	./shell/01-paquetes-Centos7.sh
	./shell/02-user.sh
	./shell/03-tunning.sh

	# Deshabilita SELinux
	sed -i "s/=enforcing/=disabled/" /etc/selinux/config

	# Que no espere el DNS reverso
	echo "UseDNS no" >> /etc/ssh/sshd_config

	#zona horaria
	timedatectl set-timezone America/Mazatlan

	# Inicia sincronizacion de horario
	systemctl enable ntpd

	# Para sincronizar de una vez
	ntpdate 0.us.pool.ntp.org


	# Mensaje del dia
	echo "

	Welcome to $HOST, pasa y sirvete de mis vinos y quesos finos.
	" > /etc/motd


	# Bandera de inicializacion OK
	touch /postinstall/postinstall-ok-setup
	echo -e "\n\n----------\n- Script de postinstall ejecutado /postinstall/postinstall-ok-setup\n----------\n\n\n"
fi