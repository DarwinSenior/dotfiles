alias ss=proxychains4 -f $HOME/.config/proxychains.conf -q

export VISUAL='nvim'
export EDITOR='nvim'
export PAGER='less -R'
repair_history() {
  strings ~/.zhistory >> /tmp/zhistory
  mv /tmp/zhistory ~/.zhistory
}

declare -A ZINIT
typeset ZINIT[HOME_DIR]=$HOME/.local/zinit

### Added by Zplugin's installer
if [ ! -f $ZINIT[HOME_DIR]/bin/zinit.zsh ]; then
  rm -rf $ZINIT[HOME_DIR] && mkdir -p $ZINIT[HOME_DIR]
  git clone https://github.com/zdharma/zinit.git $ZINIT[HOME_DIR]/bin
fi
source $ZINIT[HOME_DIR]/bin/zinit.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk


zstyle ':prezto:module:*' color 'yes'
zstyle ':prezto:module:*' case-sensitive 'no'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor:info:completing' format '...'
zstyle ':prezto:module:*' color 'yes'
zstyle ':prezto:module:*' case-sensitive 'yes'
zstyle ':prezto:module:syntax-highlighting' color 'yes'
zstyle ':prezto:module:utility:ls' color 'yes'
zstyle ':prezto:module:utility' safe-ops 'no'
zstyle ':prezto:module:autosuggestions' color 'yes'

zinit svn has'svn' for \
  PZT::modules/utility \
  PZT::modules/history \
  PZT::modules/editor \
  PZT::modules/directory \
  PZT::modules/environment \
  PZT::modules/gnu-utility \
  PZT::modules/terminal \

configure_geometry() {
  zinit snippet OMZP::shrink-path;
  geometry_shrink_path() {
    ansi ${GEOMETRY_PATH_COLOR:-blue} $(shrink_path -s -l -t -3)
  }
  GEOMETRY_PROMPT=(geometry_status geometry_shrink_path)
  GEOMETRY_RPROMPT=(geometry_exitcode geometry_jobs geometry_virtualenv geometry_git)
}

zstyle ':completion:complete:*:options' sort false
zinit wait lucid for \
  light-mode nocd atload'configure_geometry;geometry::prompt' geometry-zsh/geometry \
  blockf zsh-users/zsh-completions \
  light-mode zsh-users/zsh-autosuggestions \
  light-mode Aloxaf/fzf-tab \
  light-mode atinit"zpcompinit; zpcdreplay; finish_setup" zdharma/fast-syntax-highlighting \
  zdharma/zui \
  zinit-zsh/zinit-console \
  hlissner/zsh-autopair \
  zdharma/history-search-multi-word \

zinit light-mode for \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node \
  zinit-zsh/z-a-submods \

zinit wait lucid pick'/dev/null' for \
  make"PREFIX=$ZPFX install" atclone"./autogen.sh && ./configure" tmux/tmux \
  atload"compdef _precommand proxychains4" \
  make"install" atclone"./configure --prefix=$ZPFX" rofl0r/proxychains-ng \
  make"install" atclone"autoreconf -i && ./configure --prefix=$ZPFX" proto"git" from"g.blicky.net" ncdu.git \
  cp"completion/yadm.zsh_completion -> _yadm" \
  make"PREFIX=$ZPFX install" TheLocehiliosan/yadm \
  make"PREFIX=$ZPFX O_ICONS=1 install" jarun/nnn \
  make"PREFIX=$ZPFX install" dylanaraps/neofetch \
  make"prefix=$ZPFX install" nodakai/tree-command \
  atclone"./install.sh" sebastiencs/icons-in-terminal \
  atload"export NNN_FIFO=/tmp/nnn.fifo; export NNN_OPENER=$HOME/.config/nnn/plugins/nuke; export NNN_PLUG='p:preview-tui'" \
  cp"_the_silver_searcher -> _ag" \
  sbin'ag' make atclone'./build.sh' ggreer/the_silver_searcher \
  sbin'fzf' from'gh-r' junegunn/fzf-bin \
  sbin'**/bat' from'gh-r' @sharkdp/bat \
  sbin'fd/fd' from'gh-r' @sharkdp/fd \
  sbin'exa* -> exa' from'gh-r' ogham/exa \

zinit svn lucid wait'1' has'svn' for \
  submods'clvv/fasd -> external' PZT::modules/fasd \
  PZT::modules/rsync \
  PZT::modules/ssh \
  PZT::modules/git \
  PZT::modules/ssh \
  silent PZT::modules/archive \



export PATH=$HOME/.yarn/bin:$HOME/.local/bin:$PATH


finish_setup() {
  command -v kitty >/dev/null && . <(kitty + complete setup zsh 2>/dev/null)
  command -v pip >/dev/null && . <(pip completion --zsh)

  command -v nvim >/dev/null && alias vim=nvim
  command -v bat >/dev/null && alias cat=bat
  command -v htop >/dev/null && alias top=htop
  command -v nnn >/dev/null && alias nnn="nnn -e"
  command -v exa >/dev/null && alias ls="exa" && alias ll="exa -lh" && alias la="exa -lhaa"
}

### End of Zinit's installer chunk
