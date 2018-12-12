
" File Types
"-------------------------------------------------

" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost '.$VIMPATH.'/config/*,vimrc nested'
	\ .' source $MYVIMRC | redraw | silent doautocmd ColorScheme'
" }}}

augroup MyAutoCmd " {{{

	" Reset the cursor when leaving vim
	autocmd VimLeave * set guicursor=a:ver100-iCursor

	" Highlight current line only on focused window
	autocmd VimEnter,WinEnter,BufWinEnter,BufEnter,InsertLeave * set cursorline
	autocmd WinLeave,InsertEnter * set nocursorline

	" Check if file changed when its window is focus, more eager than 'autoread'
	autocmd WinEnter,FocusGained * checktime

	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif

	" Reload Vim script automatically if setlocal autoread
	autocmd BufWritePost,FileWritePost *.vim nested
		\ if &l:autoread > 0 | source <afile> |
		\   echo 'source '.bufname('%') |
		\ endif

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	autocmd BufReadPost *
		\ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
		\|   execute 'normal! g`"zvzz'
		\| endif

	" Disable paste and/or update diff when leaving insert mode
	autocmd InsertLeave *
		\ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
	\ if &l:diff | diffupdate | endif

	autocmd TabLeave * let g:lasttab = tabpagenr()

	autocmd FileType crontab setlocal nobackup nowritebackup

	autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

	autocmd FileType docker-compose setlocal expandtab

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType html,css,javascript,jsx,javascript.jsx setlocal backupcopy=yes

	autocmd FileType zsh setlocal foldenable foldmethod=marker

	autocmd FileType fzf setlocal laststatus=0 noshowmode noruler

	autocmd FileType html
		\ setlocal path+=./;/
		\ | setlocal equalprg=tidy\ -i\ -q

	autocmd FileType json setlocal equalprg=python\ -c\ json.tool

	autocmd FileType markdown
		\ set expandtab
		\ | setlocal spell autoindent formatoptions=tcroqn2 comments=n:>

	autocmd FileType apache setlocal path+=./;/

	autocmd FileType cam setlocal nonumber synmaxcol=10000

	autocmd FileType go highlight default link goErr WarningMsg |
		\ match goErr /\<err\>/

	autocmd FileType xml
		\ setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

augroup END " }}}

" Internal Plugin Settings  {{{
" ------------------------

" Python {{{
let g:python_highlight_all = 1

" }}}
" Vim {{{
let g:vimsyntax_noerror = 1
let g:vim_indent_cont = &shiftwidth

" }}}
" Bash {{{
let g:is_bash = 1

" }}}
" JavaScript {{{
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" }}}
" Markdown {{{
let g:markdown_fenced_languages = [
	\  'css',
	\  'javascript',
	\  'js=javascript',
	\  'json=javascript',
	\  'python',
	\  'py=python',
	\  'sh',
	\  'sass',
	\  'xml',
	\  'vim'
	\]

" }}}
" Folding {{{
" augroup: a
" function: f
let g:tex_fold_enabled = 1
let g:ft_man_folding_enable = 1
let g:xml_syntax_folding = 1
" }}}
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
