" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'

" Multi cursor
Plug 'terryma/vim-multiple-cursors'

" Git commit browser
Plug 'junegunn/gv.vim'

" Hyperfocus
Plug 'junegunn/limelight.vim'

" Goyo
Plug 'junegunn/goyo.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Latex editing
Plug 'lervag/vimtex'

" Easy motion
" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

" NerdTree stuff
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Python folding
Plug 'tmhedberg/SimpylFold'

" Javascript support
Plug 'pangloss/vim-javascript'

" JSX support
Plug 'mxw/vim-jsx'

" Typescript support
Plug 'leafgarland/typescript-vim'

" Vue support
Plug 'posva/vim-vue'

" AutoCompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" JS completion
Plug 'ncm2/ncm2-tern'

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Automatic tags update
Plug 'craigemery/vim-autotag'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'w0rp/ale'
"
" Surrounding
Plug 'tpope/vim-surround'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ack search
Plug 'mileszs/ack.vim'

" Color highlight
Plug 'ap/vim-css-color'

" Emmet support
Plug 'mattn/emmet-vim'

" UltiSnips engine
Plug 'SirVer/ultisnips'

" UltiSnips snippets
Plug 'honza/vim-snippets'

" Shows off indents
Plug 'nathanaelkane/vim-indent-guides'

" Needs to be loaded last
Plug 'ryanoasis/vim-devicons'

call plug#end()

nnoremap <SPACE> <Nop>
" bottom right trick
map <space> <leader>
nnoremap <Leader><space> :noh<cr>

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

set incsearch

" Color scheme
silent! colorscheme gruvbox
set background=dark
set t_Co=256

" Allows warping
set whichwrap+=<,>,h,l,[,]

" Displays lines numbers
set number

" Folding
set foldcolumn=2
set foldmethod=syntax " Autofolding
set foldlevelstart=99 " No default folding

" Mouse support
set mouse=a

" Characters support
set encoding=utf8

" Airline
let g:airline_powerline_fonts = 1

" Python path
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" Fixes for transparent background
hi Normal ctermbg=none
highlight NonText ctermbg=none

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

cnoreabbrev fix ALEFix

map <C-f> <esc>:Ack 

" inoremap <C-f> call fzf#vim#tags(expand('<cword>'))

map <C-p> <esc>:GFiles<CR>

" Linting
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=237 ctermfg=red
highlight ALEWarningSign ctermbg=237 ctermfg=yellow

map <C-e> <esc>:ALEFix<CR>
"
" Reduce update time
set updatetime=100

" Filetype support
filetype on
filetype plugin on

" Nerdcommenter settings
" Spaces after delimiters
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" ES6+ support on js files
let g:jsx_ext_required = 0
"
" use Emmet without having tentacles fingers
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Indent
set tabstop=2
set shiftwidth=2
set expandtab

" Open new buffers to the right
set splitright

" Contrast indents
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Open NerdTree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Fixes tmux clipboard usage
set clipboard=unnamed


" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"
" autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif
