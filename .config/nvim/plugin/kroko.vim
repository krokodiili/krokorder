if exists('g:loaded_kroko') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

hi def link Header      Number
hi def link SubHeader   Identifier

" command to run our plugin
command! Kroko lua require 'kroko'.kroko()
let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_kroko= 1

function! ReloadAlpha()
lua << EOF
    for k in pairs(package.loaded) do
        if k:match("^kroko") then
            package.loaded[k] = nil
        end
    end
EOF
endfunction
" Reload the plugin
nnoremap <Leader>pra :call ReloadAlpha()<CR>
" Test the plugin
nnoremap <Leader>ptt :lua require("kroko").kroko()<CR>
