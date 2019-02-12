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
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'phleet/vim-mercenary'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'
Plugin 'sjl/gundo.vim'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-git'
Plugin 'walm/jshint.vim'
Plugin 'aaronbieber/quicktask'
Plugin 'davidhalter/jedi-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'maralla/completor.vim'
Plugin 'majutsushi/tagbar'
Plugin 'b4b4r07/vim-hcl'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-vaultproject'
Plugin 'fatih/vim-go'
Plugin 'fatih/vim-hclfmt'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/vim-journal'
Plugin 'honza/vim-snippets'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'robbles/logstash.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'wellle/visual-split.vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'shmup/vim-sql-syntax'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chr4/nginx.vim'
Plugin 'direnv/direnv.vim'

Plugin 'shadowfax-chc/vim-tomorrow-theme'


" My vim bundle
Plugin 'shadowfax-chc/vim-fax'

call vundle#end()

filetype plugin indent on

" Load everything else from vim-fax/vimrc.vim
if filereadable(expand("~/.vim/bundle/vim-fax/vimrc.vim"))
	execute "source ~/.vim/bundle/vim-fax/vimrc.vim"
endif
