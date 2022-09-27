let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require'colorizer'.setup()
