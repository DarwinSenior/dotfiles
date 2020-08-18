alias vim=nvim
alias ss=proxychains -q

export VISUAL='nvim'
export EDITOR='nvim'
export PAGER='less'
repair_history() {
  strings ~/.zhistory >> /tmp/zhistory
  mv /tmp/zhistory ~/.zhistory
}

declare -A ZINIT
typeset ZINIT[HOME_DIR]=$HOME/.config/zinit

### Added by Zplugin's installer
if [ ! -f $ZINIT[HOME_DIR]/bin/zinit.zsh ]; then
  rm -rf $ZINIT[HOME_DIR] && mkdir -p $ZINIT[HOME_DIR]
  git clone https://github.com/zdharma/zinit.git $ZINIT[HOME_DIR]/bin
fi
source $ZINIT[HOME_DIR]/bin/zinit.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk


zinit load eendroroy/alien-minimal

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


zinit svn lucid wait has'svn' for \
  atclone'git clone https://github.com/clvv/fasd.git external' \
  PZT::modules/fasd \
  PZT::modules/rsync \
  PZT::modules/ssh \
  PZT::modules/git \
  PZT::modules/ssh \
  silent PZT::modules/archive \

zinit lucid wait as'program' for \
  pick'vim-pack-*' light-mode mkarpoff/vim8-pack \
  pick'yadm' make"PREFIX=$ZPFX install" TheLocehiliosan/yadm \
  pick'nnn' make"PREFIX=$ZPFX install" jarun/nnn \

zinit lucid wait for \
  blockf zsh-users/zsh-completions \
  light-mode zsh-users/zsh-autosuggestions \
  light-mode atinit"zpcompinit; zpcdreplay; finish_setup" zdharma/fast-syntax-highlighting \
  zdharma/history-search-multi-word \


export PATH=$HOME/.yarn/bin:$HOME/.local/bin:$PATH

finish_setup() {
  command -v kitty >/dev/null && . <(kitty + complete setup zsh 2>/dev/null)
  command -v pip >/dev/null && . <(pip completion --zsh)
}

# unblock_china() {
#   export GOPROXY=https://goproxy.cn
#   export PUB_HOSTED_URL=https://pub.flutter-io.cn
#   export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
# }


### End of Zinit's installer chunk
