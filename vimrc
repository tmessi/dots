set guioptions=
set bg=dark
set nobackup
set nocompatible
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmode
set nowrap
set expandtab
set smarttab
set nosmartindent
set mouse=a
set hlsearch
set incsearch
set showmatch
set numberwidth=3
set t_Co=256
set cursorline
set relativenumber
set colorcolumn=80

filetype plugin indent on
let mapleader="'"

" SuperTab configuration
set foldmethod=syntax
let g:SuperTabDefaultCompletionType = "context"

" Some Eclim stuff
let g:EclimProjectTreeAutoOpen = 1
let g:EclimProjectTreeSharedInstance = 1
let g:EclimBrowser = 'xombrero'
let g:EclimOpenUrlInVimPatterns =
  \ [
    \ '\.\(dtd\|xml\|xsd\)$',
    \ '\.txt$',
  \ ]
command -range -nargs=* Google call eclim#web#SearchEngine(
  \ 'http://www.google.com/search?q=<query>', <q-args>, <line1>, <line2>)
command -nargs=? Dictionary call eclim#web#WordLookup(
  \ 'http://dictionary.reference.com/search?q=<query>', '<args>')
let mapleader="'"
noremap <silent> <buffer> <leader>i :JavaImport<cr>
noremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
noremap <silent> <buffer> <cr> :JavaSearchContext<cr>
noremap <silent> <buffer> <leader>o :JavaImportOrganize<cr>

" NerdTree settings
let g:nerdtree_tabs_open_on_console_startup = 1

" Gundo settings
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_width = 30
let g:gundo_preview_height = 20

" Colors
highlight CursorLine cterm=underline
highlight Normal guifg=Green guibg=Black
highlight Folded ctermfg=59 ctermbg=NONE
highlight Pmenu guifg=green guibg=darkgray gui=NONE ctermfg=green ctermbg=darkgray cterm=NONE
highlight PmenuSel guifg=green guibg=black gui=NONE ctermfg=green ctermbg=black cterm=NONE
highlight DiffAdd term=reverse cterm=bold ctermbg=darkgreen ctermfg=black
highlight DiffChange term=reverse cterm=bold ctermbg=darkblue ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=darkred ctermfg=black
highlight LineNr term=bold cterm=NONE ctermfg=gray ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" auto save and restore views for files
autocmd BufWinLeave *.sh mkview
autocmd BufWinEnter *.sh silent loadview
autocmd BufWinLeave *.c mkview
autocmd BufWinEnter *.c silent loadview
autocmd BufWinLeave *.h mkview
autocmd BufWinEnter *.h silent loadview
autocmd BufWinLeave *.h mkview
autocmd BufWinEnter *.h silent loadview
autocmd BufWinLeave *.py mkview
autocmd BufWinEnter *.py silent loadview
autocmd BufWinLeave *.java mkview
autocmd BufWinEnter *.java silent loadview

" White space and 80 char mark
highlight OverLength ctermbg=red
highlight ColorColumn ctermbg=darkgray
match OverLength /\%80v.\+/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Treat jade as javascript
autocmd! BufNewFile,BufRead *.jade setf javascript

" Fun with numbers
autocmd FocusLost * :set number
autocmd FocusGained * : set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" Short cuts
map <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <F2> :call NumberToggle()<cr>
map <F3> :set wrap! wrap?<CR>
map <F4> :set hlsearch! hlsearch?<CR>
map <F5> :edit <CR>
map <F6> :edit! <CR>
nmap <F12> :NERDTreeTabsToggle <CR>
nmap <F7> :ProjectTreeToggle <CR>
map <F8> :set expandtab! expandtab?<CR>
map <F9> :set paste! paste?<CR>
map <F10> :set cursorline! cursorline?<CR>

" vundle configuration
if has("win32")
    let g:vim_home_path = "~/vimfiles"
else
    let g:vim_home_path = "~/.vim"
endif

execute "set rtp+=" . g:vim_home_path . "/bundle/vundle/"
let g:vundle_default_git_proto = 'https'
call vundle#rc(g:vim_home_path. "/bundle")

" Bundles to install
Bundle 'gmarik/vundle'
" Syntax/filetype detection
Bundle 'saltstack/salt-vim'

" Helpful plugins
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
