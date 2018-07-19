syntax on
"for root cern
let root_path= $ROOTSYS
"for clang_complete
let g:clang_use_library = 1
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_complete_copen = 1
let g:clang_user_options = '-std=c++11 -I'.root_path.'/include'
"
"c++ folding ?
"augroup vimrc
"    au BufReadPre * setlocal foldmethod=syntax
"    au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END
set expandtab
set shiftwidth=2
set softtabstop=2

"mapping function keys

"for cscope reset the database
map <F2> :!cscope -Rbq<CR>:cs reset<CR><CR>

:"adding astyle shortcut
map <F3> <Esc> :set formatprg=astyle<CR>Ggqgg<CR>

"adding cppcheck shortcut
map <F4> <Esc> :!cppcheck --force --inline-suppr --enable=unusedFunction,missingInclude --inconclusive -I$ROOTSYS/include  % <CR>
"map <F4> <Esc> :!cppcheck --enable=unusedFunction,missingInclude --inconclusive -I/usr/local/root/root_v5.32/include/root -I/home/krzemien/boost_1_49_0/include/ % <CR>
"map <F4> <Esc> :!cppcheck --enable=style --inconclusive --check-config -I/usr/local/root/root_v5.32/include/root -I/home/krzemien/boost_1_49_0/include/ % <CR>
"imap <c-s> <Esc>:w<CR>a

nnoremap <F10> :make!<cr>

"syntastic for cpp it also uses cppcheck
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_include_dirs = ['../j-pet-framework', '../include','include',root_path.'/include/root/',root_path.'/include/']
"let g:syntastic_cpp_include_dirs = ['../include','include','/usr/local/root/root_v5.32/include/root/','$ROOTSYS/include/','/usr/local/include/turtle/']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall' 


"for refactoring
vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>void " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction


"for cscope to search for cscope.out from the curent
"directory up along the whole root tree
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
