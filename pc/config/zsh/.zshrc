# env
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

export EDITOR='micro'
ZSH_THEME="my"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30   # 30 days

# plugins
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="github"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
plugins=(
	git
	colorize
	thefuck

	zsh-autosuggestions
	fast-syntax-highlighting

	# autocompleters
	bun
	deno
	docker
	docker-compose
	pip
)

# imports
source $ZSH/oh-my-zsh.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# aliase
alias nano=micro
alias pacman="sudo pacman"
alias edithypr="cd ~/.config/hypr && code ."
alias reloadzsh="source ~/.zshrc"
alias updateRpiIp='(){ echo "Host rpi\n  Hostname $1\n  Port 22\n  User floschy\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config}'
alias code="codium"
alias cls="clear"
alias dart="/home/floschy/custominstall/flutter/bin/dart"
alias flutter="/home/floschy/custominstall/flutter/bin/flutter"
alias editzsh="nano ~/.zshrc && reloadzsh"
alias kys='shutdown && eval $(notify-send -u critical --wait "Shutting down" "Your system will shutdown in 1 minute." -A "shutdown -c"="Cancel" -A "shutdown now"="Now" -A "shutdown -r now"="Reboot")'
alias i='yay -S --answerclean A --answerdiff N --answeredit N --answerupgrade A --noremovemake --cleanafter --noconfirm'
alias upgrade='yay -Syu --noconfirm --devel --rebuildtree --answerclean A --answerdiff N --answeredit N --answerupgrade A --noremovemake --cleanafter'
alias updateTheme="cd /home/floschy/.config/globalStyle && ./.venv/bin/python update.py"
