set number
call plug#begin()

Plug 'w0rp/ale'

Plug 'junegunn/fzf.vim'

" make your life better in general
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" vim doesn't have to be ugly
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/echodoc.vim'

Plug 'cespare/vim-toml'

"Completion

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"call fzf#run({'sink': 'tabedit'})

au VimEnter * EchoDocEnable

let g:airline_theme = 'dark'

syntax on
colorscheme gruvbox
set termguicolors background=dark
set smarttab expandtab tabstop=4 shiftwidth=4
set mouse=a
set ignorecase smartcase
set autoread

let mapleader = ','
map <silent> s <Plug>(easymotion-s2)
map <silent> <leader>/ :nohl<CR>
map <leader>t :lopen<CR>
map <leader>T :lclose<CR>

map <leader>C :call fzf#run({
\   'down': '20%',
\   'sink': 'tabedit' })<CR>

autocmd Filetype c setlocal shiftwidth=2 
autocmd Filetype h setlocal shiftwidth=2 

set cmdheight=2

set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
