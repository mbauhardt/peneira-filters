require-module peneira

define-command -docstring "Enter peneira-filters-mode.
peneira-filters-mode contains mnemonic key bindings for every peneira-filters.kak command

Best used with mapping like:
    map global normal '<some key>' ': peneira-mode<ret>'
" \
peneira-filters-mode %{ require-module peneira-filters; evaluate-commands 'enter-user-mode peneira-filters' }

provide-module peneira-filters %§

try %{ declare-user-mode peneira-filters }

§

    #set-option global luar_interpreter luajit
#define-command peneira-grep -params 1 %{
#    peneira -no-rank 'line: ' "rg --hidden --glob='!.git' --column %arg{1}" %{
#        lua %arg{1} %{
#            local file, line, column = arg[1]:match("([^:]+):(%d+):(%d+):")
#            kak.edit(file, line, column)
#        }
#    }#
#}

# TODO introduce var to define projects dir, e.g. ~/src
#define-command peneira-git-projects %{
#    peneira 'git: ' "fd --type d --hidden '^.git$' | sed 's/.git\///'" %{
#        change-directory %arg{1}
#    }##
#}

