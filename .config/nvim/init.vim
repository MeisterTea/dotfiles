call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'

Plug 'tmhedberg/matchit' " extends % pairing to html etc...

Plug 'janko-m/vim-test'

Plug 'terryma/vim-multiple-cursors'

Plug 'mbbill/undotree'

Plug 'easymotion/vim-easymotion'

" Focus !
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Git tools
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'lervag/vimtex'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tmhedberg/SimpylFold' " Python folding

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'

" AutoCompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Easy commenting
Plug 'scrooloose/nerdcommenter'

Plug 'majutsushi/tagbar'

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

Plug 'ryanoasis/vim-devicons' " Needs to be loaded last

call plug#end()

" Theme
function! s:patch_colors()
  hi Normal ctermbg=none
  highlight NonText ctermbg=none
endfunction
autocmd! ColorScheme gruvbox call s:patch_colors()
silent! colorscheme gruvbox

nnoremap <SPACE> <Nop>
" bottom right trick
map <space> <leader>
nnoremap <Leader><space> :noh<cr>

set encoding=utf8
set mouse=a
set incsearch
set number
set clipboard=unnamed " Fixes tmux clipboard usage

set tabstop=2
set shiftwidth=2
set expandtab

" Allows moving freely around lines
set whichwrap+=<,>,h,l,[,]

set updatetime=5000 " Background commands refresh rate

" Open new buffers to the right and bottom
set splitright
set splitbelow

" Filetype support
filetype on
filetype plugin on

" No more warnings about unsaved file
set hidden

" Folding
set foldcolumn=2
set foldmethod=syntax " Autofolding
set foldlevelstart=99 " No default folding

au FileType qf wincmd J " Full width quickfix window

" Python path
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

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
let g:ackprg = 'ag --vimgrep --smart-case'

set diffopt=filler,iwhite " Hides whitespaces in Gdiff

" ES6+ support on js files
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1

" Easymotion
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ALE colors
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=237 ctermfg=red
highlight ALEWarningSign ctermbg=237 ctermfg=yellow

" Limelight colors
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

" Nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" use Emmet without needing tentacles fingers
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Open NerdTree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Fugitive git bindings
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

" NerdTree bindings
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR><CR>

" Fix errors or warnings
map <C-e> <esc>:ALEFix<CR>

" Search all files content
map <C-f> <esc>:Ack 

" Search all files names
map <C-p> <esc>:GFiles<CR>

" Misc bindings
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
nnoremap <leader>tb :Tagbar<CR>
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>ll :Limelight!!<CR>
