neofetch
bindkey -v

export XDG_CONFIG_HOME="$HOME/.config"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:/snap/bin:$HOME/.dotfiles/bin:$PATH"
export EDITOR="$HOME/.local/bin/nvim"
source ~/.local/repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/.nvm/nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zsh-nvm.zsh ]] || source ~/.zsh-nvm.zsh

#nnn
source ~/.config/nnn/nnnrc.sh

alias df=~/.dotfiles/bin/dotfiles
alias rz="source ~/.zshrc"
alias op="pass open --timer 10min"
alias gp="pass -c "
alias bedtime='cmd.exe /C "Shutdown /s /t 3600"'
alias bedtime2='cmd.exe /C "Shutdown /s /t 7200"'
alias connect_server='ssh kryses@192.168.1.27'
alias pw='powershell.exe'

fpath=($HOME/.local/repos/zsh-completions/src $fpath)

#Auto Suggest
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/.local/repos/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ "$TMUX" = "" ]; then tmux; fi
nnn_cd()                                                                                                   
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}

trap nnn_cd EXIT
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}
