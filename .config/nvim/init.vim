
"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

call plug#begin('~/.local/share/nvim/plugged')

Plug 'MeisterTea/gruvbox' " Theme

Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/bufkill.vim'

Plug 'tmhedberg/matchit' " Extends % pairing to html etc...

Plug 'arecarn/vim-crunch' " I won't have to leave vim ever again !
Plug 'arecarn/vim-selection' " Dependency

Plug 'janko-m/vim-test'

Plug 'terryma/vim-multiple-cursors'

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'easymotion/vim-easymotion'

" Focus !
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'ludovicchabant/vim-gutentags' " Automatic ctags generation for versionned files

" Git tools
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

Plug 'lervag/vimtex'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle','NERDTreeFind'] }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tmhedberg/SimpylFold' " Python folding

" Syntastic coloration
Plug 'jparise/vim-graphql' " GraphQL
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pangloss/vim-javascript' " Javascript
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Styled components
Plug 'mxw/vim-jsx' " JSX
Plug 'posva/vim-vue' " Vue
Plug 'evanleck/vim-svelte' " Svelte
Plug 'ap/vim-css-color' " CSS
Plug 'lumiliet/vim-twig' " Twig
Plug 'chr4/nginx.vim' " Nginx

" Autocompletion

" Include Phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

Plug 'ncm2/ncm2' " Autocompletion plugin
Plug 'roxma/nvim-yarp' " Dependency of ncm2
Plug 'phpactor/ncm2-phpactor'

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword' " Keywords
Plug 'ncm2/ncm2-path' " Filepath

" Ultisnips support
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

Plug 'scrooloose/nerdcommenter' " Easy commenting

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'craigemery/vim-autotag' " Automatic tags update

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale' " Syntax checker

Plug 'tpope/vim-surround' " Surrounding

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim' " Emmet support

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

" Disables help menu
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Don't delete whitespace below !
set fcs=eob:\ 
set encoding=utf8
set mouse=a
set incsearch
set number
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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

au FileType qf wincmd J " Full width quickfix window

" highlight current line number
set cursorline
hi cursorline ctermbg=none
hi cursorlinenr ctermfg=yellow ctermbg=None

" Python path
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" Fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Content search
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Any files names search
command! -bang -nargs=? -complete=dir AllFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({
  \'source': 'fd -t f -H --no-ignore ',
  \}), <bang>0)

" Hidden files names search
command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({
  \'source': 'fd -t f -H ',
  \}), <bang>0)

" Files names search
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({
  \'source': 'fd -t f ',
  \}), <bang>0)

set diffopt=vertical,filler,iwhite " vertical split + hides whitespaces in Gdiff

" ES6+ support on js files
let g:jsx_ext_required = 0

highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " Only displays filenames
let g:airline#extensions#whitespace#checks = []
let g:airline_skip_empty_sections = 1

" Easymotion
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Ncm2 settings
let ncm2#popup_delay = 200
let g:ncm2#matcher = 'substrfuzzy'

" signify colors
highlight SignifySignAdd    cterm=bold ctermbg=None  ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=None  ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=None  ctermfg=yellow

" ALE colors
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=None ctermfg=red
highlight ALEWarningSign ctermbg=None ctermfg=yellow

" Limelight colors
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

" NERDTree config
let NERDTreeMinimalUI=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
hi NERDTreeClosable ctermfg=green
hi NERDTreeOpenable ctermfg=green
hi NERDTreeDir ctermfg=green
hi NERDTreeFlags ctermfg=white

"NERDTree behavior
function! s:updateNerdTreeDir()
  if exists("g:NERDTree") && g:NERDTree.IsOpen() | exec ":NERDTreeFind" | endif
endfunction
autocmd BufWinEnter * call s:updateNerdTreeDir() " Needed for C-p tree update

" Nerdcommenter settings
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:user_emmet_expandabbr_key='<S-tab>' " use Emmet without needing tentacles fingers

set statusline+=%{gutentags#statusline()} " Writing tags status display

" Fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>

" Leaves Gdiff open for commit hash
nnoremap <leader>gdc :Gdiff 
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

"" NerdTree bindings
" Double tap b when on tmux
map <C-b> <esc>:NERDTreeToggle<CR>

" Fix errors or warnings
map <C-e> <esc>:ALEFix<CR>

" Dodges NERDTree and search all files content
nnoremap <silent> <expr> <C-f> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg "

" Dodges NERDTree and search all files names
nnoremap <silent> <expr> <leader>a (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":AllFiles\<cr>"

" Dodges NERDTree and search hidden files names
nnoremap <silent> <expr> <leader>h (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":HFiles\<cr>"

" Dodges NERDTree and search hidden files names
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" Tabs bindings
nnoremap t% :tabedit %<CR>
nnoremap td :tabclose<CR>
nnoremap tn :tabnew<CR>
nnoremap tj  :tabfirst<CR>
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tk  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>

" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

" Misc bindings
nnoremap <leader>gy :Goyo<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>ll :Limelight!!<CR>

" Buffers navigation
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>

" Kill current buffer
nnoremap <C-q> :BD<CR>

" Kill all buffers but active one
nmap <leader>bc :BufOnly<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
