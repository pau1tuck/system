

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.cargo/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export VIRTUAL_ENV_DISABLE_PROMPT=0

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv z fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#bindkey '^I' autosuggest-accept
#bindkey '\t' autosuggest-accept
bindkey '^[OQ' autosuggest-accept


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prom

# CUSTOM PROMPT
NEWLINE=$'\n'

PROMPT="%* %B%F{cyan}%d %B%F{yellow}$(virtualenv_prompt_info) %F{red}${vcs_info_msg_0_}%f ${NEWLINE}%B%F{green}➜ "

# Drop this into your .zshrc or .bashrc file:
git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ -n "${branch}" ] && echo " (${branch})"
}

# This is specific to zsh but you could call $(git_prompt) in your .bashrc PS1 too.
setopt PROMPT_SUBST
PROMPT='${NEWLINE}%B%{$fg[green]%}%n %B%F{white}@ %* %B%{$fg[cyan]%}%d%{$fg[yellow]%}$(git_prompt)%{$reset_color%} ${NEWLINE}%B%F{red}➜ %B%F{green}'

# Aliases
alias zshrc="nano ~/.zshrc"
alias apt="aptitude"
alias exa="exa -alh"
alias manage="python3 manage.py"
alias nightmode="/$HOME/bin/nightmode.sh"
alias python="python3"
alias py="python3"
alias pysa="cd ~/dev/pysaurus-applet/pysaurus/bin/ && python3 pysaurus.py"
alias install="sudo apt install" 
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"

alias home="cd ~"
alias bin="cd ~/bin"
alias dev="cd ~/dev"
alias dl="cd ~/dl"
alias dox="cd ~/dox"
alias img="cd ~/img"
alias etc="cd /etc && ls"
alias shared="cd ~/shared"
