# default

bootstrap:
	./bootstrap

install:
	make fonts
	make terminal-tools
	make hack
	make toys
	make zsh
	make neovim
	make desktop-environment
	make thunar-extra

desktop-environment:
	./desktop-environment

zsh:
	./zsh-install

neovim:
	./neovim-install

fonts:
	./fonts-install

terminal-tools:
	yay -S --noconfirm --needed - < ./terminal-tools.txt

hack:
	yay -S --noconfirm --needed - < ./hack-packages.txt

toys:
	yay -S --noconfirm --needed - < ./toys.txt

thunar-extra:
	yay -S --noconfirm --needed - < ./thunar-extra.txt
