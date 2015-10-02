# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
# set fish_theme robbyrussell
set fish_theme ocean

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish
#
# alias
function gvim 
/Applications/MacVim.app/Contents/MacOS/mvim
end

function __thefuck_repl -d 'Replace operators into fish-compatible'
    set -l tmp (echo $argv | sed 's/ && / ; and /g')
    echo $tmp | sed 's/ || / ; or /g'
end

function fuck -d 'Correct your previous console command'
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    thefuck $history[1] > $eval_script
    eval (__thefuck_repl (cat $eval_script))
    rm $eval_script
end

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
