let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_stylelint_use_global = 1
" let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'vue': ['stylelint', 'eslint'],
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'vue': ['stylelint', 'eslint'],
\}

