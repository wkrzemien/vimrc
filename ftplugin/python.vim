"adding pylint shortcut

"set makeprg=pylint\ --rcfile=/home/krzemien/.DIRAC.pylint.rc\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
"autocmd FileType python set errorformat=%f:%l:\ %m
"nnoremap <F9> <Esc>:make<CR>

""remove trailing whitespaces
"autocmd BufWritePre *.py :%s/\s\+$//e


"syntastic for python
"let g:syntastic_python_python_exec = '/usr/bin/python'
"""let g:syntastic_python_checkers = ['flake8', 'pylint' ]
"let g:syntastic_python_checkers = ['pylint' ]
"let g:syntastic_python_pylint_post_args='--rcfile=/home/krzemien/.DIRAC.pylint.rc'

