require-module peneira

define-command penerira-buffers %{
    peneira 'buffers: ' %{ printf '%s\n' $kak_quoted_buflist } %{
        buffer %arg{1}
    }
}

#set-option global luar_interpreter luajit
define-command peneira-grep -params 1 %{
    peneira -no-rank 'line: ' "rg --hidden --glob='!.git' --column %arg{1}" %{
        lua %arg{1} %{
            local file, line, column = arg[1]:match("([^:]+):(%d+):(%d+):")
            kak.edit(file, line, column)
        }
    }
}

