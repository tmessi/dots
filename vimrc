set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto = 'https'
call vundle#begin()

" Plugins to install
Plugin 'VundleVim/Vundle.vim'

" Syntax/filetype detection
Plugin 'saltstack/salt-vim'

" Helpful plugins
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'phleet/vim-mercenary'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'walm/jshint.vim'
Plugin 'aaronbieber/quicktask'
Plugin 'davidhalter/jedi-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Valloric/YouCompleteMe'

Plugin 'shadowfax-chc/vim-tomorrow-theme'


" My vim bundle
Plugin 'shadowfax-chc/vim-fax'

call vundle#end()

filetype plugin indent on

" Load everything else from vim-fax/vimrc.vim
if filereadable(expand("~/.vim/bundle/vim-fax/vimrc.vim"))
	execute "source ~/.vim/bundle/vim-fax/vimrc.vim"
endif

let g:jedi#completions_enabled = 0
