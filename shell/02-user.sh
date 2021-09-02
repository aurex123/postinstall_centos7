#!/bin/bash

# Inserta el usuario como sudoero
#
if [[ ! -z "$USER" ]]; then
	groupadd -r admin || true
	useradd $USER -g admin -G wheel
	if [[ ! -z "$PASS" ]]; then
		echo "$PASS"|passwd --stdin $USER
	else
		passwd $USER
	fi
	echo "$USER        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/$USER
	chmod 0440 /etc/sudoers.d/$USER

	# Instala keys del usuario
	if [[ ! -z "$KEY_URL" ]]; then
		mkdir -pm 700 /home/$USER/.ssh && \
		curl -k $KEY_URL >> /home/$USER/.ssh/authorized_keys && \
		chmod 0600 /home/$USER/.ssh/authorized_keys && \
		chown -R $USER /home/$USER/.ssh
	fi

	# Mis Dotfiles (Aliases y tema colores de Vim)
	wget --no-check-certificate 'https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh' -O /home/$USER/.bash_git
	echo "if [ -f ~/.bash_git ] ; then source ~/.bash_git; fi" >> /home/$USER/.bash_profile
	echo "if [ -f ~/.bash_aliases ] ; then source ~/.bash_aliases; fi" >> /home/$USER/.bash_profile

	cp -rf ./files/dot/.[a-zA-Z0-9]* /home/$USER/ && chown -R $USER /home/$USER/.[a-zA-Z0-9]*
fi

# Dotfiles para el root (Aliases y tema colores de Vim)
cp -rf ./files/root/.[a-zA-Z0-9]* /root/

# Ejecutables
chmod +x ./files/bin/* && cp -rf ./files/bin/* /usr/local/bin/
