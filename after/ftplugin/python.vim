"map <F3> <Esc>:0,$!yapf<CR>
"autocmd BufWritePre *.py :%s/\s\+$//e

let g:autopep8_indent_size=2

nnoremap <buffer> <F3> :call Autopep8()<CR>

""execute current file
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

"turn on jedi
let g:jedi#auto_initialization = 1

"basic formating
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

let g:syntastic_python_python_exec = '/usr/bin/python'
""let g:syntastic_python_checkers = ['flake8', 'pylint' ]
let g:syntastic_python_checkers = ['pylint' ]
let g:syntastic_python_pylint_post_args='--rcfile=/home/krzemien/.DIRAC.pylint.rc'

