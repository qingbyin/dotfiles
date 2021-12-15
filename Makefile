SHELL=/usr/bin/bash
ZSH=$(HOME)/.oh-my-zsh

# Variables
dotdir=~/dotfiles
zshdir=~/.oh-my-zsh/custom

all: preparation install_fonts install_common_apps install_vim install_zsh install_fcitx
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

	# ArchlinuxCN contains common fonts, apps
	echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf
	echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
	sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring

install_conda:
	@echo "Install miniconda3.."
	bash < (curl -s https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh)

install_ssr:
	pip install shadowsocksr-cli

install_fonts:
	# i3 config use them for windows
	sudo pacman -S nerd-fonts-fira-code # require ArchlinuxCN
	yes | @sudo pacman -S wqy-microhei

install_basic:
	# rofi
	sudo pacman -S rofi
	mkdir -p ~/.config/rofi
	ln -sf $(dotdir)/rofi/config.rasi ~/.config/rofi/config.rasi	

	# terminal
	yes | sudo pacman -S xfce4-terminal

	# i3 config
	ln -sf $(dotdir)/i3/config ~/.i3/config
	ln -sf $(dotdir)/i3/i3status.sh ~/.i3/i3status.sh
	mkdir -p ~/.local/bin
	mkdir -p ~/.config/conky
	ln -sf $(dotdir)/conky/start_conky_custom ~/.local/bin/start_conky_custom
	ln -sf $(dotdir)/conky/conky1.10_shortcuts_maia ~/.config/conky/conky1.10_shortcuts_maia
	ln -sf $(dotdir)/conky/conky_maia ~/.config/conky/conky_maia
	# Map Caps Lock to Ctrl
	# ln -sf $(dotdir)/Xmodmap ~/.Xmodmap
	# Terminal settings
	# ln -sf $(dotdir)/Xresources ~/.Xresources
	
	# git config
	git config --global user.name "Qing Yin"
	git config --global user.email "qingbyin@gmail.com"

install_common_apps:
	yes | sudo pacman -S chromium
	yes | sudo pacman -S lazygit
	yes | yay -S autotiling-git
	yes | sudo pacman -S docker
	sudo systemctl enable docker
	sudo systemctl start docker
	yes | sudo pacman -S udiskie
	yes | sudo pacman -S evince # eps viewer
	yes | sudo pacman -S freedownloadmanager
	# Also install thunderbird add-ons, Thunderbird Conversations
	yes | sudo pacman -S thunderbird 
	yes | yay -S birdtray

	yes | sudo pacman -S flameshot
	yes | sudo pacman -S textlive-most texlive-langchinese
	yes | sudo pacman -S arandr # xrandr GUI
	yes | yay -S drawio-desktip-bin 
	# doc option: very big (with all package documentations)
	# yes | yay -S texlive-most-doc
	# without doc, and use online doc: https://texdoc.org/index.html
	sudo pacman -S texlive-most

install_zathura:
	yes | sudo pacman -S zathura zathura-pdf-mupdf
	mkdir -p ~/.config/zathura
	ln -sf ${dotdir}/zathura ~/.config/zathura/zathurarc	


install_pomodoro:
	sudo pacman -S python-gobject gtk3
	pip install click pydbus i3ipc pygobject
	yay -S gnome-shell-pomodoro
	yay -S i3-gnome-pomodoro-git
	

install_vim:
#ifeq (, $(shell which nvim))
	@echo "Install neovim..."
	sudo pacman -S neovim python-pynvim
	pip install pynvim
	# Install node and yarn(required by coc.nvim)
	sudo pacman -S yarn	
	yarn config set registry https://registry.npm.taobao.org/
	ln -sf $(dotdir)/nvim ~/.config/nvim

	# Required by coc-nvim search
	sudo pacman -S ripgrep
#endif

install_fcitx:
	@echo "Install fcitx..."
	@echo ""
	sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-nord
	yay -S fcitx5-pinyin-zhwiki
	ln -sf $(dotdir)/fcitx/pam_environment ~/.pam_environment
	ln -sf $(dotdir)/fcitx/pinyin.conf ~/.config/fcitx5/conf/pinyin.conf
	ln -sf $(dotdir)/fcitx/classicui.conf ~/.config/fcitx5/conf/classicui.conf
