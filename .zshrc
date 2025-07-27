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

# aliase
alias nano=micro
alias pacman="sudo pacman"
alias edithypr="cd ~/.config/hypr && code . && exit"
alias reloadzsh="source ~/.zshrc"
alias code="codium"
alias cls="clear"
# alias dart="/home/floschy/custominstall/flutter/bin/dart"
# alias flutter="/home/floschy/custominstall/flutter/bin/flutter"
alias editzsh="nano ~/.zshrc && reloadzsh"
alias kys='shutdown && eval $(notify-send -u critical --wait "Shutting down" "Your system will shutdown in 1 minute." -A "shutdown -c"="Cancel" -A "shutdown now"="Now" -A "shutdown -r now"="Reboot")'
alias i='yay -S --answerclean A --answerdiff N --answeredit N --answerupgrade A --noremovemake --cleanafter --noconfirm'
alias upgrade='yay -Syu --noconfirm --devel --rebuildtree --answerclean A --answerdiff N --answeredit N --answerupgrade A --noremovemake --cleanafter'
alias updates="yay -Sy; yay -Qu | wc -l"
alias updateTheme="cd /home/floschy/.config/globalStyle && ./.venv/bin/python update.py"
alias ls="lsd"
compressPDF() {
	input=$1
	output=$2
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=0.1 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$output $input
}

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/floschy/.dart-cli-completion/zsh-config.zsh ]] && . /home/floschy/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

