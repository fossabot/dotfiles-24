if has('vim_starting')
  set nocompatible
endif

:let g:session_autoload = 'no'
:let g:session_autosave = 'no'

set number relativenumber
set ruler
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let g:not_finish_vimplug = "yes"

	autocmd VimEnter * PlugInstall
endif

let g:vim_bootstrap_langs = "javascript,python,ruby"
let g:vim_bootstrap_editor = "nvim"


let g:make = 'gmake'
if exists('make')
       let g:make = 'make'
endif


call plug#begin(expand('~/.config/nvim/plugged'))
" tools
Plug 'vim-scripts/grep.vim'
    "" code snippets
Plug 'SirVer/ultisnips'
    "" multilingual commenting
Plug 'tpope/vim-commentary'
    "" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
    "" git
Plug 'tpope/vim-fugitive'
    "" ctags
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'

" UI
"""" colorschemes
Plug 'dracula/vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'bronson/vim-trailing-whitespace'
    "" display indentation lines
Plug 'Yggdroot/indentLine'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" command line
Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'ctrlpvim/ctrlp.vim'
    "" Fast vim CtrlP matcher based on python
Plug 'FelikZ/ctrlp-py-matcher'

" syntax sugar
Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
    "" edit surroundings
Plug 'tpope/vim-surround'
    "" auto close surroundings
Plug 'Raimondi/delimitMate'

" LANGUAGES
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh && npm install -g flow-bin',
	\ }

"""" Go
Plug 'neovim/go-client'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

"""" Haskell
Plug 'neovimhaskell/nvim-hs'
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
    "" Vim syntax files for the shakespeare templating languages used by Yesod
Plug 'pbrisbin/vim-syntax-shakespeare'

"""" HTML/CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'

"""" man pages
Plug 'ludwig/split-manage.vim'

"""" Node
Plug 'neovim/node-client'
Plug 'neoclide/neovim'
Plug 'jelera/vim-javascript-syntax'
Plug 'neoclide/coc.vim', {'branch': 'release'}
Plug 'flowtype/vim-flow'

"""" Python
Plug 'neovim/pynvim'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'ambv/black'
    "" syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    "" syntax highlighting for requirements.txt files
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
    "" autocompletion
Plug 'davidhalter/jedi-vim'
" Plug 'ycm-core/YouCompleteMe'

"""" R
Plug 'jalvesaw/Nvim-R'

"""" Ruby
Plug 'neovim/neovim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

"""" Rust
Plug 'daa84/neovim-lib'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"""" Vue
Plug 'posya/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Include user's extra bundle
if filereadable(expand("~/.config/nvimrc.local.bundles"))
  source ~/.config/nvimrc.local.bundles
endif
call plug#end()


let g:requirements#detect_filename_pattern = 'freeze'

" Plug 'avelino/vim-bootstrap-updater'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'honza/vim-snippets'

let mapleader="\<SPACE>"
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>L :vsplit<CR>
nnoremap <leader>J :split<CR>
nnoremap <leader>H :bprevious<CR>
nnoremap <leader>K :bnext<CR>

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <leader>= <C-W>=
nnoremap <leader>u <C-W>+
nnoremap <leader>n <C-W>-
nnoremap <leader>y <C-W><
nnoremap <leader>o <C-W>>

:tnoremap <Esc> <C-\><C-n>


let g:SuperTabDefaultCompletionType	= '<C-n>'
let g:SuperTabCrMapping			= 0
let g:UltiSnipsExpandTrigger		= '<tab>'
let g:UltiSnipsJumpForwardTrigger	= '<tab>'
let g:UltiSnipsJumpBackwardTrigger	= '<s-tab>'
let g:ycm_key_list_select_completion	= ['<C-j>', '<C-n>', '<Down>']


let g:ycm_key_list_previous_completion	= ['<C-k>', '<C-p>', '<Up>']


filetype plugin indent on

let g:SimpylFold_docstring_preview=1


" flow.js setup
""" auto type-check on save
let g:flow#enable = 1


" NerdTree setup
"""" load automatically when vim opens without filename
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""" toggle nerdtree
nnoremap <leader>f :NERDTreeToggle<Enter>
""" ui sugar
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


""" working with json
" prettifier
nnoremap <leader>pj :%!python -m json.tool<CR>


"------- python ------------
"" run black on save
autocmd BufWritePre *.py execute ':Black'


colorscheme challenger_deep
