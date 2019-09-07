set number
call plug#begin()

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'

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

call plug#end()

"let g:deoplete#enable_at_startup = 1

set completeopt-=preview
set cmdheight=2
au VimEnter * EchoDocEnable

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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
"map k gj
"map j gk
map <silent> <leader>/ :nohl<CR>
map <leader>t :lopen<CR>
map <leader>T :lclose<CR>

autocmd Filetype c setlocal shiftwidth=2 
autocmd Filetype h setlocal shiftwidth=2 
