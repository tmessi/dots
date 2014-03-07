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
Bundle 'kchmck/vim-coffee-script'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'airblade/vim-gitgutter'
Bundle 'nathanaelkane/vim-indent-guides'


" My vim bundle
Bundle 'shadowfax-chc/vim-fax'

filetype plugin indent on

if filereadable(expand(g:vim_home_path . "/bundle/vim-fax/vimrc.vim"))
	execute "source " . g:vim_home_path . "/bundle/vim-fax/vimrc.vim"
endif

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
