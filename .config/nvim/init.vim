
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

Plug 'ap/vim-css-color' " Highlight colors

Plug 'janko-m/vim-test'

Plug 'terryma/vim-multiple-cursors'

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'easymotion/vim-easymotion'

Plug 'svermeulen/vim-subversive'

Plug 'rhysd/git-messenger.vim' " Git tool

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

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
Plug 'sheerun/vim-polyglot' " S Y N T A X
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Styled components

" Autocompletion

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}

Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets' " Replaces emmet and more

" Language servers
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-elixir', {'do': 'yarn install --frozen-lockfile'}
Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-svg', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'khanghoang/coc-jest', {'do': 'yarn install --frozen-lockfile'}

" Tools
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile'}


Plug 'scrooloose/nerdcommenter' " Easy commenting

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Replace me with a python 3 plugin
" Plug 'craigemery/vim-autotag' " Automatic tags update

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale' " Syntax checker

Plug 'tpope/vim-surround' " Surrounding

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons' " Needs to be loaded last

call plug#end()

" Transparent popup menu
set wildoptions=pum
set pumblend=20

" Transparent floating windows
set winblend=10

" Theme
function! s:patch_colors()
  hi Normal ctermbg=none
  highlight NonText ctermbg=none
endfunction
autocmd! ColorScheme gruvbox call s:patch_colors()
silent! colorscheme gruvbox

set termguicolors

hi! Normal ctermbg=NONE guibg=NONE " Fix transparency with termguicolors


let g:vim_jsx_pretty_colorful_config = 1

" Move me to ftdetect
autocmd FileType php setlocal tabstop=4
autocmd FileType php setlocal shiftwidth=0

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

" Open plugin buffers to the right and bottom
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
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Reverse the layout to make the FZF list top-down
" Colors are duplicated in order to get a sane default color scheme and
" overload it
let $FZF_DEFAULT_OPTS='--layout=reverse --color=fg:#ebdbb2,bg:#504945,hl:#ebdbb2 --color=fg+:#555555,bg+:#504945,hl+:#5fd7ff --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

let g:pumblend = 0

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.9)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

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

" Submersive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" Easymotion
nmap es <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

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
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMinimalUI=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
hi NERDTreeClosable ctermfg=green
hi NERDTreeOpenable ctermfg=green
hi NERDTreeDir ctermfg=green
hi NERDTreeFlags ctermfg=white

" Opens NERDTree on entering directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"NERDTree behavior
function! s:updateNerdTreeDir()
  if exists("g:NERDTree") && g:NERDTree.IsOpen() | exec ":NERDTreeFind" | endif
endfunction
autocmd BufWinEnter * call s:updateNerdTreeDir() " Needed for C-p tree update

" Nerdcommenter settings
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

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
nnoremap <C-e> <esc>:ALEFix<CR><esc>:CocCommand eslint.executeAutofix<CR>

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

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Buffers navigation
" nnoremap <expr> <C-h> expand('%') =~ 'NERD_tree' ? '' : ':bp<CR>'
" nnoremap <expr> <C-l> expand('%') =~ 'NERD_tree' ? '' : ':bn<CR>'

" Kill current buffer
nnoremap <C-q> :BD<CR>

" Kill all buffers but active one
nmap <leader>bc :BufOnly<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
