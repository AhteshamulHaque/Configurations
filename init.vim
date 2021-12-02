set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set smartindent

set nohlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set relativenumber
set nu
syntax enable
filetype plugin on

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir

set hidden
set noerrorbells
set termguicolors
set scrolloff=8
set noshowmode

" Clipboard support
set clipboard=unnamedplus

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

command Src source ~/.config/nvim/init.vim

inoremap       jk         <Esc>
nnoremap        ;           :
nnoremap    <leader>n     o<Esc>
nnoremap    <leader>N     O<Esc>
vnoremap       jk	      <Esc>

" Shortcut to use blackhole register by default
nnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

" Shortcut to use clipboard with <leader>
nnoremap <leader>d d
vnoremap <leader>d d
nnoremap <leader>D D
vnoremap <leader>D D
nnoremap <leader>c c
vnoremap <leader>c c
nnoremap <leader>C C
vnoremap <leader>C C
nnoremap <leader>x x
vnoremap <leader>x x
nnoremap <leader>X X
vnoremap <leader>X X

call plug#begin()

    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'

    " Color scheme
    Plug 'nxvu699134/vn-night.nvim'

    " Icons
    Plug 'kyazdani42/nvim-web-devicons'

    " Tab line plugin
    Plug 'romgrk/barbar.nvim'

    " Status line plugin
    Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }

    " FzF plugins
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'gfanto/fzf-lsp.nvim'

    " File explorer
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

    call plug#end()

colorscheme vn-night

set cursorline

" Allow cursorline highlighting
hi CursorLine ctermfg=White ctermbg=33 cterm=bold guibg=Grey20

" Number line colors
hi LineNr guifg=#ffffff

" :help gcr for more settings
set guicursor=n:ver50-blinkon50,i:block-blinkon50,v:hor30-blinkon50

" Nvim not restoring block cursor on exit 
autocmd VimLeave * set guicursor=a:block-blinkon0
