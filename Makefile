SHELL=/usr/bin/bash
ZSH=$(HOME)/.oh-my-zsh

# Variables
dotdir=~/dotfiles
zshdir=~/.oh-my-zsh/custom

all: preparation install_fonts install_common_apps install_vim install_zsh install_fcitx link_configs
	@echo "Install dotfiles."
	@echo "================="
	@echo ""
	chsh -s "/usr/bin/zsh"
	export SHELL="/usr/bin/zsh"
	exec zsh -l
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
	yes | sudo yay -S autotiling-git
	
.ONESHELL:
install_zsh:
	if [[ -d $(ZSH) ]]; then 
		@echo "Removing installed oh-my-zsh..."
		rm -rf $(ZSH)
		rm ~/.zshrc
	fi
	@echo "Install zsh and oh-my-zsh..."
	yes | sudo pacman -S zsh
	#sh ./zsh/ohmyzsh.sh
	# sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" "" --unattended
	curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh | sh

	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${zshdir}/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ${zshdir}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ${zshdir}/plugins/zsh-syntax-highlighting
	ln -sf $(dotdir)/zsh/zshrc ~/.zshrc
	ln -sf $(dotdir)/zsh/p10k.zsh ~/.p10k.zsh

install_vim:
#ifeq (, $(shell which nvim))
	@echo "Install neovim..."
	sudo pacman -S neovim python-pynvim
	# Install node and yarn(required by coc.nvim)
	sudo pacman -S yarn	
	yarn config set registry https://registry.npm.taobao.org/
	ln -sf $(dotdir)/nvim ~/.config/nvim
#endif

install_fcitx:
	@echo "Install fcitx..."
	@echo ""
	sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-nord
	yay -S fcitx5-pinyin-zhwiki
	ln -sf $(dotdir)/fcitx/pam_environment ~/.pam_environment
	ln -sf $(dotdir)/fcitx/pinyin.conf ~/.config/fcitx5/conf/pinyin.conf

link_configs:
	ln -sf $(dotdir)/i3/config ~/.i3/config

	mkdir -p ~/.local/bin
	mkdir -p ~/.config/conky
	ln -sf $(dotdir)/conky/start_conky_custom ~/.local/bin/start_conky_custom
	ln -sf $(dotdir)/conky/conky1.10_shortcuts_maia ~/.config/conky/conky1.10_shortcuts_maia
	ln -sf $(dotdir)/conky/conky_maia ~/.config/conky/conky_maia

	# Map Caps Lock to Ctrl
	ln -sf $(dotdir)/Xmodmap ~/.Xmodmap

	# Terminal settings
	ln -sf $(dotdir)/Xresources ~/.Xresources

	# rofi
	ln -sf $(dotdir)/rofi/config.rasi ~/.config/rofi/config.rasi	

	git config --global user.name "Qing Yin"
	git config --global user.email "qingbyin@gmail.com"
