let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_stylelint_use_global = 0
let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_linter_aliases = {'javascript': ['css', 'javascript'],'jsx': ['css', 'javascript'],'svelte': ['css', 'javascript'] }

let g:ale_linters = {
\ 'javascript': ['stylelint', 'eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'rust': ['cargo', 'rustfmt']
\}

let g:ale_fixers = {
\ 'javascript': ['stylelint', 'eslint'],
\ 'svelte': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'css': ['stylelint'],
\ 'rust': ['rustfmt']
\}
