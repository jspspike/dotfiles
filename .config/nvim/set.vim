set number
call plug#begin()

" make your life better in general
let g:EasyMotion_smartcase = 1

" vim doesn't have to be ugly
let g:gruvbox_contrast_dark = 'hard'

"Completion

call plug#end()

set cmdheight=2
let g:echodoc_enable_at_startup = 1

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

set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
