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
export LS_COLORS='no=0:fi=0:ln=1;36:or=1;40:mi=1;40:pi=31:so=33:ex=1;31:*.tgz=38;05;13:*.TGZ=38;05;13:*.tar=38;05;13:*.TAR=38;05;13:*.zip=38;05;13:*.ZIP=38;05;13:*.gz=38;05;13:*.GZ=38;05;13:*.bz2=38;05;13:*.BZ2=38;05;13:*.rar=38;05;13:*.RAR=38;05;13:*.tbz2=38;05;13:*.TBZ2=38;05;13:*.Z=38;05;13:*.Z=38;05;13:*.7z=38;05;13:*.7Z=38;05;13:*.xz=38;05;13:*.XZ=38;05;13:*.lzma=38;05;13:*.LZMA=38;05;13:*.lzh=38;05;13:*.LZH=38;05;13:*.txz=38;05;13:*.TXZ=38;05;13:*.lha=38;05;13:*.LHA=38;05;13:*.taz=38;05;13:*.TAZ=38;05;13:*.arj=38;05;13:*.ARJ=38;05;13:*.iso=38;05;13:*.ISO=38;05;13:*.mpeg=38;05;3:*.MPEG=38;05;3:*.mov=38;05;3:*.MOV=38;05;3:*.avi=38;05;3:*.AVI=38;05;3:*.mp4=38;05;3:*.MP4=38;05;3:*.mkv=38;05;3:*.MKV=38;05;3:*.wmv=38;05;3:*.WMV=38;05;3:*.flv=38;05;3:*.FLV=38;05;3:*.divx=38;05;3:*.DIVX=38;05;3:*.jpeg=38;05;200:*.JPEG=38;05;200:*.png=38;05;200:*.PNG=38;05;200:*.jpeg=38;05;200:*.JPEG=38;05;200:*.svg=38;05;200:*.SVG=38;05;200:*.eps=38;05;200:*.EPS=38;05;200:*.gif=38;05;200:*.GIF=38;05;200:*.ppm=38;05;200:*.PPM=38;05;200:*.pgm=38;05;200:*.PGM=38;05;200:*.pbm=38;05;200:*.PBM=38;05;200:*.jpg=38;05;200:*.JPG=38;05;200:*.mp3=38;05;9:*.MP3=38;05;9:*.flac=38;05;9:*.FLAC=38;05;9:*.acc=38;05;9:*.ACC=38;05;9:*.ogg=38;05;9:*.OGG=38;05;9:*.c=38;05;220:*.C=38;05;220:*.h=38;05;220:*.H=38;05;220:*.rb=38;05;220:*.RB=38;05;220:*.erb=38;05;220:*.ERB=38;05;220:*.cc=38;05;220:*.CC=38;05;220:*.cs=38;05;220:*.CS=38;05;220:*.sh=38;05;220:*.SH=38;05;220:*.zsh=38;05;220:*.ZSH=38;05;220:*.java=38;05;220:*.JAVA=38;05;220:*.pl=38;05;220:*.PL=38;05;220:*.cpp=38;05;220:*.CPP=38;05;220:*.py=38;05;220:*.PY=38;05;220:*.js=38;05;220:*.JS=38;05;220:*.html=38;05;220:*.HTML=38;05;220:*.hml=38;05;220:*.HML=38;05;220:*.haml=38;05;220:*.HAML=38;05;220:*.slim=38;05;220:*.SLIM=38;05;220:di=38;05;27:cd=38;05;27:*.tex=38;05;5:*.TEX=38;05;5:*.doc=38;05;5:*.DOC=38;05;5:*.conf=38;05;5:*.CONF=38;05;5:*.nfo=38;05;5:*.NFO=38;05;5:*.srt=38;05;5:*.SRT=38;05;5:*.txt=38;05;5:*.TXT=38;05;5:*.log=38;05;5:*.LOG=38;05;5:*.aux=38;05;5:*.AUX=38;05;5:*.ps=38;05;6:*.PS=38;05;6:*.dvi=38;05;6:*.DVI=38;05;6:*.pdf=38;05;6:*.PDF=38;05;6'
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

source /home/leex/dotfiles/generated/zsh/prompt_hjem/prompt_hjem_setup
prompt_hjem_setup 8bit vimode

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
