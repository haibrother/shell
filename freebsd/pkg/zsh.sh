pkg_add -r zsh
chsh -s zsh
# usermod -s /usr/local/bin/zsh neo
# chpass -s /usr/local/bin/zsh

cat > ~/.zshrc <<'EOD'
# Created by neo <netkiller@msn.com>
PROMPT='%n@%M:%~$ '

HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000

# enable color support of ls and also add handy aliases
autoload colors; colors
export PS1="%B[%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b%{$reset_color%}:%~%B]%b "

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Home/End/Del key
bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" overwrite-mode
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line

if [ -r ${HOME}/.profile ]; then
	. ${HOME}/.profile
fi

EOD
