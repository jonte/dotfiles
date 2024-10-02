#!/bin/bash
set -euo pipefail

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
NVIMDIR=~/.config/nvim/
REQUIRED_COMMANDS="curl nvim tmux zsh"

function check_commands {
	for CMD in $REQUIRED_COMMANDS; do
		if [ "$(which "$CMD")" == "" ]; then
		    echo "You need to install $CMD"
		    exit 1
		fi
	done
}

function install_vim {
	curl -fLso "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	if [ ! -d "$NVIMDIR" ]; then
		mkdir -p "$NVIMDIR"
		ln -s "$DIR/init.vim" "$NVIMDIR/init.vim"
	fi

	nvim +PlugInstall +qa
}

function install_tmux {
	# Deploy oh-my-tmux
    (
        cd "$HOME" || exit
        if [ ! -d ~/.tmux ]; then
            git clone https://github.com/gpakosz/.tmux.git
            ln -s -f .tmux/.tmux.conf .
            ln -s "$DIR/.tmux.conf.local" .
        fi
    )
}

function install_zsh {
    if [ ! -d ~/.oh-my-zsh ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    if [ ! -f ~/.zshenv ]; then
        ln -s "$DIR/.zshenv" ~/.zshenv
    fi
}

function install_fzf {
    if [ ! -d ~/.fzf ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    fi
}

function install_os_packages {
	# Install powerline-patched fonts
    if ! dpkg -l fonts-powerline &> /dev/null; then
        echo "Enter password in order to install powerline-patched fonts"
        sudo apt-get install fonts-powerline
    fi
}

function install_gdb_dashboard {
    if [ ! -f ~/.gdbinit ]; then
        ln -s "$DIR/.gdbinit" ~/.gdbinit
    fi
}

function install_z {
    if [ ! -f ~/.z.sh ]; then
        curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/.z.sh
    fi
}

check_commands
install_vim
install_tmux
install_zsh
install_fzf
install_gdb_dashboard
install_z
install_os_packages
