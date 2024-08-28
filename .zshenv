export EDITOR=nvim
alias vim=nvim

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

export PATH="$PATH:/opt/nvim-linux64/bin:~/.bin/"
