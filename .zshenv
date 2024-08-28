export EDITOR=nvim
alias vim=nvim

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

export PATH="$PATH:/opt/nvim-linux64/bin:~/.bin/"

# Z 'jump around' integration with fzf
source ~/.z.sh
unalias z
z() {
  local dir=$(
    _z 2>&1 |
    fzf --height 40% --layout reverse --info inline \
        --nth 2.. --tac --no-sort --query "$*" \
        --bind 'enter:become:echo {2..}'
  ) && cd "$dir"
}
