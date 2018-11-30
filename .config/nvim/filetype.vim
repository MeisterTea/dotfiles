" autocmd BufRead,BufNewFile .eslintrc set ft=javascript
let b:ale_fixers = {
\ 'javascript': ['prettier_eslint'],
\ 'vue': ['prettier_eslint'],
\}
