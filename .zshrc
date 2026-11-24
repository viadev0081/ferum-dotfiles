zmodload zsh/parameter  # Needed to access jobstates variable for STARSHIP_JOBS_COUNT

if [[ $ZSH_VERSION == ([1-4]*) ]]; then
    __starship_get_time() {
        STARSHIP_CAPTURED_TIME=$(/usr/local/bin/starship time)
    }
else
    zmodload zsh/datetime
    zmodload zsh/mathfunc
    __starship_get_time() {
        (( STARSHIP_CAPTURED_TIME = int(rint(EPOCHREALTIME * 1000)) ))
    }
fi
prompt_starship_precmd() {
    STARSHIP_CMD_STATUS=$? STARSHIP_PIPE_STATUS=(${pipestatus[@]})

    if (( ${+STARSHIP_START_TIME} )); then
        __starship_get_time && STARSHIP_DURATION=$(( STARSHIP_CAPTURED_TIME - STARSHIP_START_TIME ))
        unset STARSHIP_START_TIME
    else
        unset STARSHIP_DURATION STARSHIP_CMD_STATUS STARSHIP_PIPE_STATUS
    fi

    STARSHIP_JOBS_COUNT="${#jobstates[*]}"
}

prompt_starship_preexec() {
    __starship_get_time && STARSHIP_START_TIME=$STARSHIP_CAPTURED_TIME
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_starship_precmd
add-zsh-hook preexec prompt_starship_preexec

starship_zle-keymap-select() {
    zle reset-prompt
}

if [[ -v widgets[zle-keymap-select] ]]; then
    __starship_preserved_zle_keymap_select=${widgets[zle-keymap-select]#user:}
fi

if [[ -z ${__starship_preserved_zle_keymap_select:-} ]]; then
    zle -N zle-keymap-select starship_zle-keymap-select;
else
    starship_zle-keymap-select-wrapped() {
        $__starship_preserved_zle_keymap_select "$@";
        starship_zle-keymap-select "$@";
    }
    zle -N zle-keymap-select starship_zle-keymap-select-wrapped;
fi

STARSHIP_SESSION_KEY="$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM"; # Random generates a number b/w 0 - 32767
STARSHIP_SESSION_KEY="${STARSHIP_SESSION_KEY}0000000000000000" # Pad it to 16+ chars.

VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

PROMPT='$('/usr/local/bin/starship' prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="${STARSHIP_CMD_STATUS:-}" --pipestatus="${STARSHIP_PIPE_STATUS[*]:-}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
RPROMPT='$('/usr/local/bin/starship' prompt --right --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="${STARSHIP_CMD_STATUS:-}" --pipestatus="${STARSHIP_PIPE_STATUS[*]:-}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
PROMPT2="$(/usr/local/bin/starship prompt --continuation)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONF="$HOME/.zsh"
export "MICRO_TRUECOLOR=1"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch $(uname -m)"
export STARSHIP_SHELL="zsh"
export STARSHIP_SESSION_KEY=${STARSHIP_SESSION_KEY:0:16}; 
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

alias ls="exa --icons --color=always --group-directories-first"
alias cat="bat --theme-dark=base16-256"
alias ff="fastfetch"
alias nf="neofetch"
alias v="vim"
alias dv="sudo vim"
alias nv="nvim"
alias dnv="sudo nvim"
alias lg="lazygit"
alias yz="yazi"

eval "$(zoxide init zsh)"
