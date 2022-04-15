set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Syntax/filetype detection
Plug 'saltstack/salt-vim'

" Helpful plugins
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'phleet/vim-mercenary'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'sjl/gundo.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-git'
Plug 'walm/jshint.vim'
Plug 'aaronbieber/quicktask'
Plug 'xolox/vim-misc'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'michaeljsmith/vim-indent-object'
Plug 'majutsushi/tagbar'
Plug 'b4b4r07/vim-hcl'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vaultproject'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/vim-hclfmt'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'rjohnsondev/vim-compiler-go'
Plug 'robbles/logstash.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'wellle/visual-split.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chr4/nginx.vim'
Plug 'direnv/direnv.vim', executable('direnv') ? {} : { 'on': [] }
Plug 'markonm/traces.vim'
Plug 'zackhsi/fzf-tags'
Plug 'yegappan/taglist'

" Theme
Plug 'morhetz/gruvbox'

" My vim plugin contains the vimrc and filetype configs.
Plug 'tmessi/messi-vim'

call plug#end()

" Load everything else from messi-vim/vimrc.vim
if filereadable(expand("~/.vim/plugged/messi-vim/vimrc.vim"))
	execute "source ~/.vim/plugged/messi-vim/vimrc.vim"
endif

