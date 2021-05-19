SHELL=/usr/bin/bash

# Variables
dotdir=~/dotfiles
zshdir=~/.oh-my-zsh/custom

all: preparation install_fonts install_common_apps install_vim link_configs
	@echo "Install dotfiles."
	@echo "================="
	@echo ""
	@echo "All done."

preparation:
	sudo pacman-mirrors -c China
	sudo pacman-mirrors -f 0
	sudo pacman -Syu

install_fonts:
	@yay -S nerd-fonts-fira-code
	yes | @sudo pacman -S wqy-microhei

install_common_apps:
	yes | sudo pacman -S chromium
	yes | sudo pacman -S xfce4-terminal
	yes | sudo pacman -S lazygit
	
install_zsh:
#ifeq (, $(shell which zsh))
	@echo "Install zsh..."
	sudo pacman -S zsh
	# Need to manually run the oh-my-zsh script
	#sh $(dotdir)/zsh/install.sh
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git $(zshdir)/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions $(zshdir)/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting $(zshdir)/plugins/zsh-syntax-highlighting
	ln -sf $(dotdir)/zsh/zshrc ~/.zshrc
	ln -sf $(dotdir)/zsh/p10k.zsh ~/.p10k.zsh
#endif

install_vim:
#ifeq (, $(shell which nvim))
	@echo "Install neovim..."
	sudo pacman -S neovim python-pynvim
	# Install node and yarn(required by coc.nvim)
	sudo pacman -S yarn	
	yarn config set registry https://registry.npm.taobao.org/
	ln -sf $(dotdir)/nvim ~/.config/nvim
#endif

link_configs:
	ln -sf $(dotdir)/i3/config ~/.i3/config
	git config --global user.name "Qing Yin"
	git config --global user.email "qingbyin@gmail.com"
	
	

