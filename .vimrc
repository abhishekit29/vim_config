set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/')
"
" "let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'leafgarland/typescript-vim'
"plugin 'https://github.com/leafgarland/typescript-vim.git'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "

set nocompatible
set et
set ai
set sw=4
set ts=8
set ruler
set si
set nu
set is
set ic
set sm
set sta
syn on
set backspace=indent,eol,start
set hlsearch
set nobackup
set nowritebackup
set wildmenu
set incsearch
set runtimepath^=~/.vim/bundle/ctrlp.vim
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/



hi LineTooLong cterm=bold ctermbg=red guibg=LightYellow


au FileType make set noet

set pastetoggle=<F3>

let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTreeToggle' argv()[0] | wincmd p | ene | endif

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" Disable valadoc syntax highlight
" "let vala_ignore_valadoc = 1
"
" " Enable comment strings
let vala_comment_strings = 1
"
" " Highlight space errors
let vala_space_errors = 1
" " Disable trailing space errors
" "let vala_no_trail_space_error = 1
" " Disable space-tab-space errors
" let vala_no_tab_space_error = 1
"
" " Minimum lines used for comment syncing (default 50)
" "let vala_minlines = 120

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

set encoding=utf8 "utf8 as standard

"hybrid number mode
set relativenumber
set number
autocmd InsertEnter * :set nu nornu
autocmd InsertLeave * :set rnu nu

" Tabs
set smarttab
set tabstop=4 "width of tab character
set softtabstop=4 "finetunes amount of white spaces to be inserted/deleted
set shiftwidth=4 "amount of white space to be inserted/deleted on normal mode
set expandtab "space instead of tab

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set showmatch "show matching brackets
set hlsearch "highlight matches
set cursorline "highlight current line
"set colorcolumn=80
"set ignorecase "ignore case on search
set incsearch

syntax enable "syntax highlighting


filetype on
filetype plugin on
"autoload CloseTag for xml/html files
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

let mapleader = "\<space>"
nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec

" Spell check
nmap <silent> <leader>s :set spell!<CR>

" Show invisible characters
set listchars=tab:▸\ ,eol:¬
set list
nmap <leader>l :set list! nonu! nornu!<CR>

set hidden "manage hidden buffers

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

" EasyMotion keybinding and shading
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" airline
let g:airline_powerline_fonts=1
let g:airline_theme="murmur"
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1

" FileType based settings
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
let g:syntastic_php_checkers=[]
" KeyMaps
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
" STOP using arrow keys!
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" Buffers - next/previous: F12, Shift-F12.
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <F11> :bp<CR>
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Functions
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Save read-only files
cnoremap sudow w !sudo tee % >/dev/null
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:ctrlp_custom_ignore = 'node_modules'
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
    if getline('.') =~ "^\\s*" . comment_leader . " "
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else
        if getline('.') =~ "^\\s*" . comment_leader
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
        end
    end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader><Space> :call ToggleComment()<cr>

vnoremap <leader><Space> :call ToggleComment()<cr>

