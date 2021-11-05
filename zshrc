# zmodload zsh/zprof # Uncomment to enable profiling

alias pmake="make -j $(nproc)"

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
setopt nomatch
setopt histignorespace
bindkey -e

#Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true  # automatically rehash completion

#Needed for colorful prompts
autoload -U colors && colors
setopt promptsubst
setopt HIST_IGNORE_SPACE

#Antigen
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/doc/find-the-command/ftc.zsh
antigen bundle zdharma/fast-syntax-highlighting
source /usr/share/zsh/scripts/git-prompt.zsh
#antigen bundle olivierverdier/zsh-git-prompt
antigen apply



function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

#PROMPT=$'%{$fg_bold[blue]%}%n@%m %{$fg[green]%}%d %{$fg_bold[white]%}[%?] %{$reset_color%}$(git_super_status)\
#%D{[%X]} %{$fg_bold[green]%}%_$(prompt_char)%{$reset_color%} '

PROMPT=$'%{$fg_bold[blue]%}%n@%m %{$fg[green]%}%d %{$fg_bold[white]%}[%?] %{$reset_color%}$(gitprompt)\
%D{[%X]} %{$fg_bold[green]%}%_$(prompt_char)%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
#GIT_PROMPT_EXECUTABLE="haskell"


export LD_LIBRARY_PATH=/usr/local/lib


source    /usr/share/fzf/key-bindings.zsh
source    /usr/share/fzf/completion.zsh

if (( ${+RUSTUP_HOME} )); then
    PROMPT="(rustup) $PROMPT"
fi

# zprof # Uncomment to end profiling

