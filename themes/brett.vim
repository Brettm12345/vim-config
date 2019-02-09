scriptencoding utf-8

" brett - palenight custom
" =========================

" UI elements {{{
" ---------------------------------------------------------
set showbreak=↪
set fillchars=vert:,fold:-
set listchars=tab:\▏\ ,nbsp:␣,trail:∙,extends:»,precedes:«
" }}}

" Highlights: General GUI {{{
" ---------------------------------------------------------
highlight! Normal ctermbg=none
highlight! LineNr ctermbg=none
highlight! SignColumn ctermbg=none
" }}}

" Plugin: Defx icons and highlights {{{
" ---------------------------------------------------------
let g:defx_git#indicators = {
	\ 'Modified'  : 'M',
	\ 'Staged'    : 'm',
	\ 'Untracked' : '?',
	\ 'Renamed'   : '≫',
	\ 'Unmerged'  : 'u',
	\ 'Ignored'   : 'i',
	\ 'Deleted'   : '✖',
	\ 'Unknown'   : '⁇'
	\ }

hi Defx_git_Untracked ctermfg=12
hi Defx_git_Ignored   ctermfg=8
hi Defx_git_Unknown   ctermfg=3
hi Defx_git_Renamed   ctermfg=3
hi Defx_git_Modified  ctermfg=9
hi Defx_git_Unmerged  ctermfg=14
hi Defx_git_Deleted   ctermfg=13
hi Defx_git_Staged    ctermfg=10
"}}}
" Plugin: ALE {{{
" ---------------------------------------------------------
let g:ale_sign_error = '⊘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = '!'

highlight! ALEError ctermbg=01
highlight! ALEWarning ctermbg=09
highlight! ALEInfo ctermbg=04
highlight! ALEErrorSign ctermfg=01 ctermbg=none
highlight! ALEWarningSign ctermfg=09 ctermbg=none
highlight! ALEInfoSign ctermfg=04 ctermbg=none
" }}}

" Plugin: Line no indicator {{{
" ---------------------------------------------------------
let g:line_no_indicator_chars = [
\  ' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
\  ]
" }}}

" Plugin: Quick Scope {{{
" ---------------------------------------------------------
highlight! QuickScopePrimary ctermfg=1 cterm=underline
highlight! QuickScopeSecondary ctermfg=6 cterm=underline
" }}}

" Plugin: NERDTree icons and highlights {{{
" ---------------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
	\ 'Modified':  '·',
	\ 'Staged':    '‧',
	\ 'Untracked': '?',
	\ 'Renamed':   '≫',
	\ 'Unmerged':  '≠',
	\ 'Deleted':   '✃',
	\ 'Dirty':     '⁖',
	\ 'Clean':     '✓',
	\ 'Unknown':   '⁇'
	\ }

let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'

highlight! def link NERDTreeClosable NERDTreeOpenable

highlight! clear NERDTreeFlags

highlight! def link NERDTreeGitStatusRenamed Title
highlight! def link NERDTreeGitStatusUnmerged Label
highlight! def link NERDTreeGitStatusDirDirty Constant
highlight! def link NERDTreeGitStatusDirClean DiffAdd
highlight! def link NERDTreeGitStatusUnknown Comment

function! s:NERDTreeHighlight()
	for l:name in keys(g:NERDTreeIndicatorMapCustom)
		let l:icon = g:NERDTreeIndicatorMapCustom[l:name]
		if empty(l:icon)
			continue
		endif
		let l:prefix = index(['Dirty', 'Clean'], l:name) > -1 ? 'Dir' : ''
		let l:hiname = escape('NERDTreeGitStatus'.l:prefix.l:name, '~')
		execute 'syntax match '.l:hiname.' #'.l:icon.'# containedin=NERDTreeFlags'
	endfor

	syntax match hideBracketsInNerdTree "\]" contained conceal containedin=NERDTreeFlags
	syntax match hideBracketsInNerdTree "\[" contained conceal containedin=NERDTreeFlags
	" setlocal conceallevel=3
	" setlocal concealcursor=nvic
endfunction

augroup nerdtree-highlights
	autocmd!
	autocmd FileType nerdtree call s:NERDTreeHighlight()
augroup END
"}}}

" Plugin: Tagbar icons {{{
" ---------------------------------------------------------
let g:tagbar_iconchars = ['+', '-']
" }}}

" Plugin: Neomake icons {{{
" ---------------------------------------------------------
let g:neomake_error_sign = {'text': '⚠', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '⌁', 'texthl': 'WarningSyntax'}
let g:neomake_message_sign = {'text': '⌂', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '⊹', 'texthl': 'NeomakeInfoSign'}
"}}}

" Plugin: Operator flashy {{{
" ---------------------------------------------------------
highlight! link Flashy DiffText
" }}}

" Plugin: Signify {{{
" ---------------------------------------------------------
let g:signify_sign_add = '▎'
let g:signify_sign_delete = '▏'
let g:signify_sign_delete_first_line = '▔'
let g:signify_sign_change = '▎'
let g:signify_sign_changedelete = '▋'

highlight! SignifySignAdd ctermfg=2 ctermbg=none
highlight! SignifySignChange ctermfg=4 ctermbg=none
highlight! SignifySignDelete ctermfg=1 ctermbg=none
highlight! link SignifySignDeleteFirstLine SignifySignDelete
highlight! link SignifyLineAdd SignifySignAdd
highlight! link SignifyLineChange SignifySignChange
highlight! link SignifyLineDelete SignifySignDelete
highlight! link SignifyLineChangeDelete SignifySignDelete
highlight! link SignifyLineDeleteFirstLine SignifySignDelete
" }}}

" Plugin: vim-bookmarks {{{
" ---------------------------------------------------------
let g:bookmark_sign = '⚐'
highlight! BookmarkSign            ctermfg=12
highlight! BookmarkAnnotationSign  ctermfg=11
" }}}

" vim:foldmethod=marker:ts=2:sw=0:tw=80:noet
