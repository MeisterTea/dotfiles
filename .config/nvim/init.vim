" Plugins
call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'lervag/vimtex'

" Easy motion
" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Python folding
Plug 'tmhedberg/SimpylFold'

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

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
" Plug 'ncm2/ncm2-tern'

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

" Split rightward so as not to displace a left NERDTree
let g:ack_mappings = {
      \ "h": "<C-W><CR>:exe 'wincmd ' (&splitbelow ? 'J' : 'K')<CR><C-W>p<C-W>J<C-W>p",
      \ "H": "<C-W><CR>:exe 'wincmd ' (&splitbelow ? 'J' : 'K')<CR><C-W>p<C-W>J",
      \ "v": "<C-W><CR>:exe 'wincmd ' (&splitright ? 'L' : 'H')<CR><C-W>p<C-W>J<C-W>p",
      \ "gv": "<C-W><CR>:exe 'wincmd ' (&splitright ? 'L' : 'H')<CR><C-W>p<C-W>J" }

set incsearch

set diffopt=filler,iwhite " Hides whitespaces in Gdiff

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

" No more warnings about unsaved file
set hidden

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

" Open new buffers to the right and bottom
set splitright
set splitbelow

" Contrast indents
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Open NerdTree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Fixes tmux clipboard usage
set clipboard=unnamed

nnoremap <leader>nf :NERDTreeFind<CR><CR>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

au FileType qf wincmd J

nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
