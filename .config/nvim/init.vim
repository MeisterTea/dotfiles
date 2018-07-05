" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'

" Git commit browser
Plug 'junegunn/gv.vim'

" Hyperfocus
Plug 'junegunn/limelight.vim'

" Goyo
Plug 'junegunn/goyo.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Easy motion
Plug 'easymotion/vim-easymotion'

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

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Automatic tags update
Plug 'craigemery/vim-autotag'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'scrooloose/syntastic'

" Browser support
Plug 'tyru/open-browser.vim'

" Aligning
Plug 'godlygeek/tabular'

" Surrounding
Plug 'tpope/vim-surround'

" File search engine
Plug 'ctrlpvim/ctrlp.vim'

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

" Ctrl C to copy
vnoremap <C-c> "*y

" Ctrl a to select all
map <C-a> <esc>ggVG<CR>

" Echap to unhighlight
augroup no_highlight
    autocmd TermResponse * nnoremap <esc> :noh<return><esc>
augroup END

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

" Set tabs size to 4
set tabstop=4
set shiftwidth=4
set expandtab

" Open new buffers to the right
set splitright

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Contrast indents
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Open NerdTree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" YouCompleteMe configuration
let g:UltiSnipsExpandTrigger="<alt>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_autoclose_preview_window_after_completion=1
