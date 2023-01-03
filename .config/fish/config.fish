if status is-interactive
    # Commands to run in interactive sessions can go here
end

# To fix general Terminal weirdness with certain keys (such as backspace/delete)
# For whatever reason, the below doesn't work too well on OSX
# stty sane

# Suppress the fish greeting
# set -U fish_greeting ""
set fish_greeting

# fish_vi_key_bindings

# Abbreviations
abbr l ll
abbr c clear
abbr cl clear
abbr cls clear
abbr x exit
abbr v vim
abbr nv nvim
abbr h htop
abbr ta 'tmux a'
abbr s src
abbr f frc

# Aliases
alias celar=clear
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias .7="cd ../../../../../../.."
alias .8="cd ../../../../../../../.."
alias .9="cd ../../../../../../../../.."
alias nvi=nvim
# alias freeram='echo 3 | sudo tee /proc/sys/vm/drop_caches' # Use only for Linux based OS (NOT OSX)
alias vrc='vim ~/.vimrc'
alias frc='nvim ~/.config/fish/config.fish'
alias trc='nvim ~/.config/tmux/.tmux.conf'
alias src='source ~/.config/fish/config.fish'
alias nvrc='nvim ~/.config/nvim/init.vim'
alias unrpyc='python ~/Desktop/Programming/Game\ Dev/RenPy/unrpyc/unrpyc.py'

# Exa alias for ll
if type -q exa
  alias ll "exa -al -g --icons"
end

# PATHS
# Add things to the $PATH variable, for ex:
# set PATH $PATH ~/.fzf/bin

# Exports
export EDITOR=nvim
export TERM=xterm-256color

# Functions
