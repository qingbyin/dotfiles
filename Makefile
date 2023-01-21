SHELL=/usr/bin/bash
ZSH=$(HOME)/.oh-my-zsh

# Variables
dotdir=~/dotfiles
zshdir=~/.oh-my-zsh/custom

all: preparation install_zsh install_conda install_vim
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
	echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$$arch' | sudo tee -a /etc/pacman.conf
	sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring
	# git config
	git config --global user.name "Qing Yin"
	git config --global user.email "qingbyin@gmail.com"

install_zsh:
	@echo "Install zsh..."
	@echo "================="
	sudo pacman -S zsh
	@echo "Install oh my zsh..."
	@echo "================="
	git clone https://gitee.com/mirrors/oh-my-zsh/ $(ZSH)
	ln -sf $(dotdir)/zsh/zshrc ~/.zshrc
	# plugins
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${zshdir}/themes/powerlevel10k
	ln -sf $(dotdir)/zsh/p10k.zsh ~/.p10k.zsh
	sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
	chsh -s /usr/bin/zsh

install_conda:
	@echo "Install miniconda3.."
	wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh
	rm Miniconda3-latest-Linux-x86_64.sh

install_fonts:
	# i3 config use them for windows
	sudo pacman -S nerd-fonts-fira-code # require ArchlinuxCN
	yes | sudo pacman -S wqy-microhei
	sudo pacman -S ttf-joypixels # color emoji
	# Required Fonts (not noto-cjk which will put JP first)
	sudo pacman -S adobe-source-han-serif-cn-fonts
	sudo pacman -S adobe-source-han-sans-cn-fonts
	mkdir -p ${HOME}/.local/share/fonts
	cp -r ${dotdir}/fonts ${HOME}/.local/share/fonts
	fc-cache -vf

install_i3_config:
	# rofi
	sudo pacman -S rofi
	mkdir -p ~/.config/rofi
	ln -sf $(dotdir)/rofi/config.rasi ~/.config/rofi/config.rasi	
	# terminal
	yes | sudo pacman -S xfce4-terminal
	# i3 config
	ln -sf $(dotdir)/i3/config ~/.config/i3/config
	mkdir -p ~/.local/bin
	mkdir -p ~/.config/conky
	ln -sf $(dotdir)/conky/start_conky_custom ~/.local/bin/start_conky_custom
	ln -sf $(dotdir)/conky/conky1.10_shortcuts_maia ~/.config/conky/conky1.10_shortcuts_maia
	ln -sf $(dotdir)/conky/conky_maia ~/.config/conky/conky_maia
	# i3 status rust
	sudo pacman -S i3status-rust ttf-font-awesome
	mkdir -p ~/.config/i3status-rust
	ln -sf $(dotdir)/i3/i3status_config.toml ~/.config/i3status-rust/config.toml

	# Map Caps Lock to Ctrl
	# ln -sf $(dotdir)/Xmodmap ~/.Xmodmap
	# Terminal settings
	# ln -sf $(dotdir)/Xresources ~/.Xresources

install_terminal:
	sudo pacman -S kitty
	mkdir -p ~/.config/kitty
	ln -sf $(dotdir)/kitty.conf ~/.config/kitty/kitty.conf

install_rclone:
	sudo pacman -S rclone
	ln -sf $(dotdir)/rclone@onedrive.service ~/.config/systemd/user/rclone@onedrive.service

install_common_apps:
	sudo pacman -S pavucontrol # GUI tool for audio sound (PulseAudio)
	# Then click 'volumeicon' and set mixter to `pavucontrol`
	pip install shadowsocksr-cli
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
	yes | sudo pacman -S arandr # xrandr GUI
	yes | yay -S drawio-desktop-bin 
	# Show keystrokes on screen
	sudo pacman -S screenkey
	sudo pacman -S anki # require ArchlinuxCN
	# Webcam
	sudo pacman -S cheese
	# screen record
	sudo pacman -S simplescreenrecorder
	sudo pacman -S vokoscreen # can embed the webcam
	# Timer
	sudo pacman -S kteatime

install_tex:
	# without doc, and use online doc: https://texdoc.org/index.html
	sudo pacman -S texlive-most texlive-langchinese
	# doc option: very big (with all package documentations)
	# yay -S texlive-most-doc
	# Required tools
	sudo pacman -S biber texlab

install_zathura:
	yes | sudo pacman -S zathura zathura-pdf-mupdf
	mkdir -p ~/.config/zathura
	ln -sf ${dotdir}/zathurarc ~/.config/zathura/zathurarc	


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
	sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-nord fcitx5-config-qt
	yay -S fcitx5-pinyin-zhwiki
	ln -sf $(dotdir)/fcitx/pam_environment ~/.pam_environment
	ln -sf $(dotdir)/fcitx/pinyin.conf ~/.config/fcitx5/conf/pinyin.conf
	ln -sf $(dotdir)/fcitx/classicui.conf ~/.config/fcitx5/conf/classicui.conf

config_matplotlib:
	@echo "Config matplotlib sytle template..."
	@echo ""
	mkdir -p ~/.config/matplotlib/stylelib
	ln -sf $(dotdir)/matplotlib/* ~/.config/matplotlib/stylelib/
