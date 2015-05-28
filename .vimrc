set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " " alternatively, pass a path where Vundle should install plugins
    " "call vundle#begin('~/some/path/here')
    "
    " " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    Plugin 'fatih/vim-go'
    Plugin 'elzr/vim-json'
    Plugin 'scrooloose/syntastic'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'

    "
    " " The following are examples of different formats supported.
    " " Keep Plugin commands between vundle#begin/end.
    " " plugin on GitHub repo
    " Plugin 'tpope/vim-fugitive'
    " " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    " " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'
    " " git repos on your local machine (i.e. when working on your own plugin)
    " Plugin 'file:///home/gmarik/path/to/plugin'
    " " The sparkup vim script is in a subdirectory of this repo called vim.
    " " Pass the path to set the runtimepath properly.
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " " Avoid a name conflict with L9
    " Plugin 'user/L9', {'name': 'newL9'}
    "
    " " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " " To ignore plugin indent changes, instead use:
    " "filetype plugin on
    " "
    " " Brief help
    " " :PluginList       - lists configured plugins
    " " :PluginInstall    - installs plugins; append `!` to update or just
    " :PluginUpdate
    " " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " " :PluginClean      - confirms removal of unused plugins; append `!` to
    " auto-approve removal
    " "
    " " see :h vundle for more details or wiki for FAQ
    " " Put your non-Plugin stuff after this line
    "

set cindent
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch
set ic
set number
nnoremap <F2> :set nonumber!<CR>
nnoremap <F3> :set paste!<CR>
set ruler
syntax on

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
nmap <c-q> :q<CR>
imap <c-q> <Esc>:q<CR>

" Format JSON
com! FormatJSON %!python -m json.tool
map <leader>j :%!python -m json.tool<CR>
set conceallevel=0

" Systastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <c-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Solarized
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" NERDTree
nmap <leader>nt :NERDTree<CR>

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
