if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
set -gx EDITOR nvim

fzf --fish | source

abbr -a rm 'trash'          
abbr -a rrm 'rm'          
abbr -a f 'firefox'         
abbr -a orp 'orpie'
abbr -a --position anywhere -- sc ~/sync 
abbr -a cpt 'pwd | wl-copy'

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/gwegus/.opam/opam-init/init.fish' && source '/home/gwegus/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

set -Ux SUDO_EDITOR nvim
set -Ux VISUAL nvim
set -Ux EDITOR nvim
