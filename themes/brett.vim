set notermguicolors
" UI elements {{{
" ---------------------------------------------------------
set showbreak=↪
set fillchars=vert:\│,fold:-
set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:,precedes:
" }}}

" Statusline {{{
" ---------------------------------------------------------
let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '' : 'S·Block',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'REPLACE ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'MORE ',
    \ 'r?' : 'CONFIRM ',
    \ '!'  : 'SHELL ',
    \ 't'  : 'TERMINAL '}

let s:stl  = '%2* %{g:currentmode[mode()]}%*'  " Current mode
let s:stl .= '%1*%( %{badge#filename()} %)%*'  " Filename
let s:stl .= "%5*%{badge#mode(' ', 'Z')}"     " Read-only symbol
let s:stl .= "%5*%{badge#modified('+ ')}%0*"    " Write symbol
let s:stl .= '%3*%(  %{badge#branch()} %)%*'  " Git branch name
let s:stl .= '%='                              " Align to right
let s:stl .= '%4* %{badge#format()}'           " File format
let s:stl .= ' %2* %{LineNoIndicator()} '      " Line and column
" Non-active Statusline {{{
let s:stl_nc = '%1*%( %{badge#filename()} %)%*'  " Filename
let s:stl_nc .= "%5*%{badge#mode(' ', 'Z')}"     " Read-only symbol
let s:stl_nc .= "%5*%{badge#modified('+ ')}%0*"    " Write symbol
let s:stl_nc .= '%3*%(  %{badge#branch()} %)%*'  " Git branch name
let s:stl_nc .= '%='                              " Align to right
let s:stl_nc .= '%4* %{badge#format()} '           " File format
" }}}

" Highlights: Statusline {{{
highlight StatusLine   ctermfg=07 ctermbg=00
highlight StatusLineNC ctermfg=07 ctermbg=00

" Filepath color
highlight User1 ctermfg=12 ctermbg=10
" Line and column information
highlight User2 ctermfg=00 ctermbg=01
" Git branch color
highlight User3 ctermfg=07 ctermbg=08
" File format
highlight User4 ctermfg=00 ctermbg=9
" Write and Readonly symbol
highlight User5 ctermfg=01 ctermbg=10
" }}}

let s:disable_statusline =
	\ 'denite\|unite\|vimfiler\|tagbar\|nerdtree\|undotree\|gundo\|diff\|peekaboo\|sidemenu'

" Toggle Statusline {{{
augroup statusline
	autocmd!
	autocmd FileType,WinEnter,BufWinEnter,BufReadPost *
		\ if &filetype !~? s:disable_statusline
		\ | let &l:statusline = s:stl
		\ | endif
	autocmd WinLeave *
		\ if &filetype !~? s:disable_statusline
		\ | let &l:statusline = s:stl_nc
		\ | endif
augroup END "}}}

" }}}

" Highlights: Completion {{{
highlight Pmenu ctermfg=07 ctermbg=10
highlight PmenuSel ctermfg=13 ctermbg=11
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

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

highlight! NERDTreeOpenable ctermfg=05
highlight! def link NERDTreeClosable NERDTreeOpenable

highlight! NERDTreeFile ctermfg=04
highlight! NERDTreeExecFile ctermfg=03

highlight! clear NERDTreeFlags
highlight! NERDTreeFlags ctermfg=02
highlight! NERDTreeCWD ctermfg=06

highlight! NERDTreeGitStatusModified ctermfg=1
highlight! NERDTreeGitStatusStaged ctermfg=2
highlight! NERDTreeGitStatusUntracked ctermfg=04
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
endfunction

augroup nerdtree-highlights
	autocmd!
	autocmd FileType nerdtree call s:NERDTreeHighlight()
augroup END
" }}}

" Plugin: Tagbar icons {{{
" ---------------------------------------------------------
let g:tagbar_iconchars = ['+', '-']
" }}}

" Plugin: denite {{{
" ---------------------------------------------------------
highlight! clear WildMenu
highlight! link WildMenu CursorLine
highlight! link deniteSelectedLine Type
highlight! link deniteMatchedChar Function
highlight! link deniteMatchedRange Underlined
highlight! link deniteMode Comment
highlight! link deniteSource_QuickfixPosition qfLineNr
" }}}

" Plugin: vim-operator-flashy {{{
" ---------------------------------------------------------
highlight! link Flashy DiffText
" }}}

" Plugin: line-no-indicator {{{
" ---------------------------------------------------------
let g:line_no_indicator_chars = [
  \  ' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ]
"  }}}

" vim: set foldmethod=marker ts=2 sw=0 tw=80 noet :
