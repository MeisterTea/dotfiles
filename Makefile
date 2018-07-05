default:
	install-yay

install-yay:
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si

install-packages:
	yay -S --noconfirm `cat packages.txt`

link:
	sudo mv /etc/pacman.conf /etc/pacman.conf.bkp
	sudo ln -s ~/.pacman.conf /etc/pacman.conf

plug-install:
	nvim +PlugInstall +qall
