SHELL=/bin/bash

# Variables
dotdir=~/dotfiles
zshdir=~/.oh-my-zsh/custom

all: preparation install_fonts install_common_apps install_zsh install_vim
	@echo "Install dotfiles."
	@echo "================="
	@echo ""
	@echo "All done."

preparation:
	sudo pacman-mirrors -f 0
	sudo pacman -Syu

install_fonts:
	@yay -S nerd-fonts-fira-code
	@sudo pacman -S wqy-microhei

install_common_apps:
	sudo pacman -S chromium
	sudo pacman -S xfce4-terminal
	yes | sudo pacman -S lazygit
	
install_zsh:
ifeq (, $(shell which zsh))
	@echo "Install zsh..."
	sudo pacman -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git $(zshdir)/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions $(zshdir)/plugins/zsh-autosuggestions
	ln -sf $(dotdir)/zsh/zshrc ~/.zshrc
	ln -sf $(dotdir)/zsh/p10k.zsh ~/.p10k.zsh
endif

install_vim:
ifeq (, $(shell which nvim))
	@echo "Install neovim..."
	sudo pacman -S neovim
	pip install pynvim
	ln -sf $(dotdir)/nvim ~/.config/nvim
endif

link_configs:
	ln -sf $(dotdir)/i3/config ~/.i3/config
	git config --global user.name "Qing Yin"
	git config --global user.email "qingbyin@gmail.com"
	
	

