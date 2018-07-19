"non compatibility with vi
set nocompatible

filetype plugin on
syntax on

let mapleader = ","

"call pathogen#infect()
"call pathogen#helptags()

":PlugInstall
":PlugUpdate
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tell-k/vim-autopep8'
Plug 'vim-airline/vim-airline'
Plug 'parnmatt/vim-root'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-scripts/tlib'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'Rip-Rip/clang_complete'
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lyuts/vim-rtags'

"I have some problem with the newest version from github
"So i keep this one
Plug '~/.vim/pluggedManually/syntastic'
call plug#end()



set expandtab
set shiftwidth=2
set softtabstop=2
"to keep always 3 lines above/below if you scroll the page up/down
set scrolloff=3
"the status line will be always visible
set laststatus=2
"fileenconding - means what will the vim try while opening a file:
set fileencodings=ucs-bom,utf8,latin1,latin2
"background to dark
set background=dark


"incremental search
set incsearch
"highlighting the results
set hlsearch
"remove highliting by leader and space
nnoremap <leader><space> :noh<cr>
"ignorecase while searching
set ignorecase
"unless there are capital letters
set smartcase
"default global substitution -g to only oneline
set gdefault

"default is relative number
set relativenumber
highlight LineNr ctermfg=green

"folding setting
set foldmethod=syntax
set foldenable
set foldlevel=100
"comments will not be folded
let c_no_comment_fold = 1

"open fixed window after make only in case of compilation errors
autocmd QuickFixCmdPost * :cwindow

"********** Custom remapping: **********
"jumping around brackets with tab instead of %
nnoremap <tab> %
vnoremap <tab> %

"strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>

"open new vertical split and move to it
nnoremap <leader>w <C-w>v<C-w>l

"mapping ctrl+s as exit
:nmap <c-s> :w<CR>

"<F3> style formater
"<F4> cppcheck or pylint
map <F5> <Esc>:setlocal spell spelllang=es<CR>
map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>
" turns on/off Graphic undo view
nnoremap <F8> :GundoToggle<CR>
"<F9> execute or compile the program

"ctags
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

noremap <F11> :CommandTFlush<CR>
map <F12> :TagbarToggle<CR>

"to set/unset relative numbering of lines
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
    highlight LineNr ctermfg=yellow
  else
    set relativenumber
    highlight LineNr ctermfg=green
  endif
endfunc
nnoremap <c-\> :call NumberToggle()<cr>


" when I mark a part of the text with the mouse I will not mark line number
" when I want to copy it I must press shift
set mouse=a

"to turn off the touchpad while entering the vim
"I use 13 cause it is the current setting
"change xinput list for that number
"augroup disablingTouchPad
"  autocmd!
"  autocmd VimEnter * execute "!xinput -disable 12" | redraw!
"  autocmd VimLeave * execute "!xinput -enable 12" | redraw!
"augroup END

"remapping CapsLock to Escape, xmodmap must be available
augroup RemappingCapsLockToEsc
  autocmd!
  au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
  au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
augroup END


"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"powerline settings
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
"
"navigating between splitted windows
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

"navigating between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"for training only
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


"map <C-I> :pyf /home/krzemien/programs/clang-format/clang-format.py<cr>
"imap <C-I> <c-o>:pyf /home/krzemien/programs/clang-format/clang-format.py<cr>
