" Statusline {{{
let g:lightline = {
			\ 'colorscheme': 'palenight',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste'  ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified'  ] ],
			\   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
			\              [ 'fileformat', 'fileencoding', 'filetype', ] ]
			\ },
			\ 'component_function': {
			\   'filetype': 'MyFiletype',
			\   'fileformat': 'MyFileformat',
			\   'gitbranch': 'gitbranch#name',
			\   'line_no_indicator': 'LineNoIndicator'
			\ },
			\ }
" }}}

" Plugin: Ale {{{
let g:lightline.component_expand = {
			\  'linter_checking': 'lightline#ale#checking',
			\  'linter_warnings': 'lightline#ale#warnings',
			\  'linter_errors': 'lightline#ale#errors',
			\  'linter_ok': 'lightline#ale#ok',
			\ }

let g:lightline.component_type = {
			\     'linter_checking': 'left',
			\     'linter_warnings': 'warning',
			\     'linter_errors': 'error',
			\     'linter_ok': 'left',
			\ }

let g:lightline#ale#indicator_checking = "🔃"
let g:lightline#ale#indicator_warnings = "⚠"
let g:lightline#ale#indicator_errors = "⊘"
let g:lightline#ale#indicator_ok = "✔"
" }}}

" Plugin: DevIcons {{{
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" }}}

" vim:foldmethod=marker
