" deoplete for nvim
" ---

" let g:deoplete#enable_profile = 1
" call deoplete#enable_logging('DEBUG', 'deoplete.log')<CR>
" call deoplete#custom#source('tern', 'debug_enabled', 1)<CR>

" General settings " {{{
" ---
call deoplete#custom#option({
	\ 'auto_complete_delay': 50,
	\ 'smart_case': v:true,
	\ })

call deoplete#custom#source('file', 'enable_buffer_path',  v:true)
call deoplete#custom#source('_', 'min_pattern_length', 2)

" Jedi
call deoplete#custom#source('jedi', 'statement_length', 30)
call deoplete#custom#source('jedi', 'show_docstring', v:true)
call deoplete#custom#source('jedi', 'short_types', v:true)

" Ternjs
call deoplete#custom#source('ternjs', 'filetypes', [ 'jsx', 'javascript.jsx', 'vue', 'javascript' ])
call deoplete#custom#source('ternjs', 'timeout', 3)
call deoplete#custom#source('ternjs', 'types', v:true)
call deoplete#custom#source('ternjs', 'docs', v:true)

" }}}
" Limit Sources " {{{
" ---
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" }}}
" Omni functions and patterns " {{{
" ---
call deoplete#custom#source('omni', 'functions', {
	\ 'css': 'csscomplete#CompleteCSS',
	\ 'html': 'htmlcomplete#CompleteTags',
	\ 'markdown': 'htmlcomplete#CompleteTags',
	\ })

call deoplete#custom#option('omni_patterns', {
	\ 'html': '<[^>]*',
	\ })

call deoplete#custom#var('omni', 'input_patterns', {
	\ 'xml': '<[^>]*',
	\ 'md': '<[^>]*',
	\ 'css': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
	\ 'scss': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
	\ 'sass': '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
	\ 'python': '',
	\ 'javascript': '',
	\ })
" }}}
" Ranking and Marks " {{{
" Default rank is 100, higher is better.
call deoplete#custom#source('padawan',       'rank', 660)
call deoplete#custom#source('go',            'rank', 650)
call deoplete#custom#source('vim',           'rank', 640)
call deoplete#custom#source('flow',          'rank', 630)
call deoplete#custom#source('TernJS',        'rank', 620)
call deoplete#custom#source('jedi',          'rank', 610)
call deoplete#custom#source('omni',          'rank', 600)
call deoplete#custom#source('neosnippet',    'rank', 510)
call deoplete#custom#source('member',        'rank', 500)
call deoplete#custom#source('file_include',  'rank', 420)
call deoplete#custom#source('file',          'rank', 410)
call deoplete#custom#source('tag',           'rank', 400)
call deoplete#custom#source('around',        'rank', 330)
call deoplete#custom#source('buffer',        'rank', 320)
call deoplete#custom#source('dictionary',    'rank', 310)
call deoplete#custom#source('tmux-complete', 'rank', 300)
call deoplete#custom#source('syntax',        'rank', 200)

" }}}
" Matchers and Converters " {{{
" ---

" Default sorters: ['sorter_rank']
" Default matchers: ['matcher_length', 'matcher_fuzzy']

call deoplete#custom#source('_', 'converters', [
	\ 'converter_remove_paren',
	\ 'converter_remove_overlap',
	\ 'converter_truncate_abbr',
	\ 'converter_truncate_menu',
	\ 'converter_auto_delimiter',
	\ ])

" }}}
" Key-mappings and Events " {{{
" ---

autocmd MyAutoCmd CompleteDone * silent! pclose!

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Undo completion
" inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-g> deoplete#refresh()
inoremap <expr><C-l> deoplete#complete_common_string()

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
