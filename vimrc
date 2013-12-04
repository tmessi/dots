set nocompatible

filetype off

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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mileszs/ack.vim'
Bundle 'phleet/vim-mercenary'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'walm/jshint.vim'
Bundle 'aaronbieber/quicktask'
Bundle 'davidhalter/jedi-vim'


" My vim bundle
Bundle 'shadowfax-chc/vim-fax'

filetype plugin indent on

if filereadable(expand(g:vim_home_path . "/bundle/vim-fax/vimrc.vim"))
	execute "source " . g:vim_home_path . "/bundle/vim-fax/vimrc.vim"
endif
