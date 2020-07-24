.PHONY: install
install:
	make fonts
	make terminal-tools
	make hack
	make toys
	make zsh
	make neovim
	make nohang
	make desktop-environment
	make thunar-extra

.PHONY: desktop-environment
desktop-environment:
	./desktop-environment

.PHONY: zsh
zsh:
	./zsh-install

.PHONY: nohang
nohang:
	./nohang-install

.PHONY: neovim
neovim:
	source /usr/share/nvm/init-nvm.sh ./neovim-install

.PHONY: fonts
fonts:
	./fonts-install

.PHONY: terminal-tools
terminal-tools:
	yay -S --noconfirm --needed - < ./terminal-tools.txt
	source /usr/share/nvm/init-nvm.sh && nvm install node
	yay -S --noconfirm --needed python-pip
	pip install --user pipx

.PHONY: hack
hack:
	yay -S --noconfirm --needed - < ./hack-packages.txt

.PHONY: toys
toys:
	yay -S --noconfirm --needed - < ./toys.txt

.PHONY: thunar-extra
thunar-extra:
	yay -S --noconfirm --needed - < ./thunar-extra.txt
