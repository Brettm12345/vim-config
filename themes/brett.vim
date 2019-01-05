scriptencoding utf-8

" brett - agila custom
" =========================

" UI elements {{{
" ---------------------------------------------------------
set showbreak=↪
set fillchars=vert:\│,fold:-
set listchars=tab:│\ ,nbsp:␣,trail:∙,extends:,precedes:
" }}}

" Statusline {{{
" ---------------------------------------------------------
" let g:currentmode={
"     \ 'n'  : 'NORMAL ',
"     \ 'no' : 'N·Operator Pending ',
"     \ 'v'  : 'VISUAL ',
"     \ 'V'  : 'V·Line ',
"     \ '' : 'V·Block',
"     \ 's'  : 'Select ',
"     \ 'S'  : 'S·Line ',
"     \ '' : 'S·Block',
"     \ 'i'  : 'INSERT ',
"     \ 'R'  : 'REPLACE ',
"     \ 'Rv' : 'V·Replace ',
"     \ 'c'  : 'Command ',
"     \ 'cv' : 'Vim Ex ',
"     \ 'ce' : 'Ex ',
"     \ 'r'  : 'Prompt ',
"     \ 'rm' : 'MORE ',
"     \ 'r?' : 'CONFIRM ',
"     \ '!'  : 'SHELL ',
"     \ 't'  : 'TERMINAL '}

" let s:stl  = '%2* %{g:currentmode[mode()]}%*'  " Current mode
" let s:stl .= '%1*%( %{badge#filename()} %)%*'  " Filename
" let s:stl .= "%5*%{badge#mode(' ', 'Z')}"     " Read-only symbol
" let s:stl .= "%5*%{badge#modified('+ ')}%0*"   " Write symbol
" let s:stl .= '%3*%(  %{badge#branch()} %)%*'  " Git branch name
" let s:stl .= '%='                              " Align to right
" let s:stl .= '%4* %{&ft}'                      " File type
" let s:stl .= ' %2* %{LineNoIndicator()} '      " Line and column
" Non-active Statusline {{{
" let s:stl_nc = '%1*%( %{badge#filename()} %)%*'  " Filename
" let s:stl_nc .= "%5*%{badge#mode(' ', 'Z')}"    " Read-only symbol
" let s:stl_nc .= "%5*%{badge#modified('+ ')}%0*"  " Write symbol
" let s:stl_nc .= '%3*%(  %{badge#branch()} %)%*' " Git branch name
" let s:stl_nc .= '%='                             " Align to right
" let s:stl_nc .= '%4* %{&ft} '                    " File type
" }}}

" Highlights: Statusline {{{
" highlight StatusLine   ctermfg=07 ctermbg=00
" highlight StatusLineNC ctermfg=07 ctermbg=00

" " Filepath color
" highlight User1 ctermfg=12 ctermbg=08
" " Line and column information
" highlight User2 ctermfg=00 ctermbg=01
" " Git branch color
" highlight User3 ctermfg=07 ctermbg=08
" " File format
" highlight User4 ctermfg=00 ctermbg=09
" " Write and Readonly symbol
" highlight User5 ctermfg=01 ctermbg=08
" }}}

" let s:disable_statusline =
" 	\ 'fzf\|denite\|unite\|vimfiler\|tagbar\|nerdtree\|undotree\|gundo\|diff\|peekaboo\|sidemenu'

" Toggle Statusline {{{
" augroup statusline
" 	autocmd!
" 	autocmd FileType,WinEnter,BufWinEnter,BufReadPost *
" 		\ if &filetype !~? s:disable_statusline
" 		\ | let &l:statusline = s:stl
" 		\ | endif
" 	autocmd WinLeave *
" 		\ if &filetype !~? s:disable_statusline
" 		\ | let &l:statusline = s:stl_nc
" 		\ | endif
" augroup END
" }}}
" }}}

" Highlights: General GUI {{{
" ---------------------------------------------------------
highlight! Normal ctermbg=none
highlight! LineNr ctermbg=none
highlight! SignColumn ctermbg=none
" }}}

" Plugin: ALE {{{
" ---------------------------------------------------------
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'
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

" Plugin: Tagbar icons {{{
" ---------------------------------------------------------
let g:tagbar_iconchars = ['+', '-']
" }}}

" Plugin: Operator flashy {{{
" ---------------------------------------------------------
highlight! link Flashy DiffText
" }}}

" Plugin: Signify {{{
" ---------------------------------------------------------
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

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

" vim:foldmethod=marker:ts=2:sw=0:tw=80:noet
