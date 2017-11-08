setopt multios autocd extendedglob glob bareglobqual nullglob rcexpandparam extendedglob autopushd auto_continue auto_cd
setopt append_history
setopt hist_no_store
setopt hist_ignore_space
setopt hist_ignore_all_dups

unset complete_aliases
export LANG="en_US.UTF-8"
export EDITOR=vim
export PAGER=most
export BROWSER=google-chrome
export HIST_PATH=~/
export TEMP_PATH=~/

bindkey -v

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=15000
SAVEHIST=15000

source .zsh_alias

autoload -Uz compinit && compinit
zmodload -i zsh/complist
autoload -U zmv
eval $(dircolors ~/.dir_colors)
alias allcolors='for i in {0..255}; do echo -e "\e[38;05;${i}m\\\e[38;05;${i}m"; done | column -c 80 -s " "; echo -e "\e[m"]]]""'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete # _correct  _approximate
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/5 )) numeric )'
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#cache for package managers
zstyle ':completion:*' use-cache on
zstyle ':completion:*' verbose on
zstyle ':completion:*' cache-path ~/.zshcache

#proper tabing for directorys ../ is niiice
zstyle ':completion:*' special-dirs true

#tabbing menu
zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' menu select=2

#vim style control in completion lists
bindkey -M menuselect 'h' vi-backward-char                # links
bindkey -M menuselect 'j' vi-down-line-or-history         # unten
bindkey -M menuselect 'k' vi-up-line-or-history           # oben
bindkey -M menuselect 'l' vi-forward-char                 # rechts

#parameter completions for programms that understand --hrlp
compdef _gnu_generic df wc tar make date mv cp grep sed feh awk tail head watch unzip unrar ln ssh diff cdrecord nc strings objdump od

#nice for kill (now with colors)
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*[0-9][0-9]:[0-9][0-9]:[0-9][0-9] #([|\\_ ]#) #([^ ]#)*=0=01;31=0=01;34'

#nice for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd|grep --color=none -Eo "^[^ ]*"| grep --color=none -Eo "[^/]*$"|sed -e 1d'

#tabing for man pages
zstyle ':completion:*:man:*' separate-sections true

#allready rmed files will not show up again
zstyle ':completion:*:(cp|rm):*' ignore-line yes
zstyle ':completion:*:*:firefox:*:*' file-patterns '*.(html|htm)' '%p:all-files'
#cd into folder only
zstyle ':completion:*:*:cd_wrapper:*:*' file-patterns '*(-/):directories'
zstyle ':completion:*:*:evince:*:*' file-patterns '*.pdf:pdfs:pdfs *(-/):directories'
#zstyle ':completion:*:*:foo:*:*' file-patterns '*.yo:yodl-files:yodl\ files *(-/):directories'
#zstyle ':completion:*:*:foo:*:*' command 'ps xf -u $USER -o pid,%cpu,tty,cputime,cmd'

# zsh with pwd in window title
function precmd {
    term=$(echo $TERM | grep -Eo '^[^-]+')
    print -Pn "\e]0;$term:zsh %~\a"
    if [[ "$term" == "screen" ]]; then
        echo -ne "\033kzsh\033\0134"
    fi
}

# current command with args in window title
function preexec {
    term=$(echo $TERM | grep -Eo '^[^-]+')
    printf "\033]0;%s:%s\a" "$term" "$1"
    if [[ "$term" == "screen" ]]; then
        name=$(echo $1 | grep -Eo '^[^ ]+')
        echo -ne "\033k$name\033\0134"
    fi
}

#history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#fix insert mode fuckup
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

#proper undo
zle -A .undo vi-undo-change

#key up/down will search for history lines beginning with the current line
bindkey "\e[A"  history-beginning-search-backward-end
bindkey "\e[B"  history-beginning-search-forward-end
#key home/end for first/last char in insert mode
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

#TODO add VIMODE to prompt
#function zle-keymap-select {
#        VIMODE="${${KEYMAP/vicmd/ M:command}/(main|viins)/}"
#        zle reset-prompt
#}

#zle && zle -N zle-keymap-select

autoload promptinit && promptinit

rm -R ~/.macromedia/Flash_Player/ 2> /dev/null 1 > /dev/null

#will make an iso
  mkiso() {
    echo " * Volume name "
    read volume
    echo " * ISO Name (ie. tmp.iso)"
    read iso
    echo " * Directory or File(s)"
    read files
    mkisofs -o $iso -A $volume -allow-multidot -J -R -iso-level 3 -V $volume -R ${(z)files}
  }

export PATH=/sbin:/usr/sbin:$PATH:$CONFIG_PATH/scripts

bindkey -v

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^h' backward-delete-char

#edit current command in vim
autoload edit-command-line
zle -N edit-command-line
#vim style commands
bindkey -M vicmd 'v' edit-command-line

#lets you autocomplete i3bar commands
autoload bashcompinit && bashcompinit
source /home/leex/dotfiles/generated/zsh/i3-completion.sh

# hjem - home is where my prompt is
[ ! -f ~/.hjem ] && wget -O ~/.hjem 'https://raw.githubusercontent.com/cornerman/prompt-hjem/master/prompt_hjem_setup'
[ -f ~/.hjem ] && prompt_hjem_setup 8bit vimode

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
