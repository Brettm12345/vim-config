
" Plugin Settings
"---------------------------------------------------------

if dein#tap('denite.nvim')
	nnoremap <silent><Leader>r :<C-u>Denite -resume -refresh<CR>
	nnoremap <silent><Leader><Leader> :<C-u>Denite file/rec<CR>
	nnoremap <silent><Leader>b :<C-u>Denite buffer file/old -default-action=switch<CR>
	nnoremap <silent><Leader>d :<C-u>Denite directory_rec -default-action=cd<CR>
	nnoremap <silent><Leader>v :<C-u>Denite register -buffer-name=register<CR>
	xnoremap <silent><Leader>v :<C-u>Denite register -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><Leader>l :<C-u>Denite location_list -buffer-name=list<CR>
	nnoremap <silent><Leader>q :<C-u>Denite quickfix -buffer-name=list<CR>
	nnoremap <silent><Leader>n :<C-u>Denite dein<CR>
	nnoremap <silent><Leader>g :<C-u>Denite grep<CR>
	nnoremap <silent><Leader>j :<C-u>Denite jump change file/point<CR>
	nnoremap <silent><Leader>u :<C-u>Denite junkfile:new junkfile<CR>
	nnoremap <silent><Leader>o :<C-u>Denite outline<CR>
	nnoremap <silent><Leader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><Leader>t :<C-u>Denite -buffer-name=tag tag:include<CR>
	nnoremap <silent><Leader>p :<C-u>Denite -mode=normal jump<CR>
	nnoremap <silent><Leader>h :<C-u>Denite help<CR>
	nnoremap <silent><Leader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
	nnoremap <silent><Leader>/ :<C-u>Denite line<CR>
	nnoremap <silent><Leader>* :<C-u>DeniteCursorWord line<CR>
	nnoremap <silent><Leader>z :<C-u>Denite z<CR>
	nnoremap <silent><Leader>; :<C-u>Denite command command_history<CR>

	" chemzqm/denite-git
	nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
	nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
	nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord -buffer-name=tag tag:include<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction "}}}
endif

if dein#tap('vim-denite-z')
	command! -nargs=+ -complete=file Z
		\ call denite#start([{'name': 'z', 'args': [<q-args>], {'immediately': 1}}])
endif

if dein#tap('tagbar')
	nnoremap <silent> <Leader>ot   :<C-u>TagbarOpenAutoClose<CR>

	" Also use h/l to open/close folds
	let g:tagbar_map_closefold = ['h', '-', 'zc']
	let g:tagbar_map_openfold = ['l', '+', 'zo']
endif

if dein#tap('defx.nvim')
	nmap <silent>-
		\ :<C-u>Defx -columns=icons:git:filename:type -buffer-name=tab`tabpagenr()`<CR>
endif

if dein#tap('fzf.vim')
	nnoremap <silent><Leader><Leader> :<C-u>Files<CR>
	nnoremap <silent><Leader>ff       :<C-u>Files<CR>
	nnoremap <silent><Leader>fg       :<C-u>GitFiles<CR>
	nnoremap <silent><Leader>fr       :<C-u>History<CR>
	nnoremap <silent><Leader>ft       :<C-u>Filetypes<CR>
	nnoremap <silent><Leader>b        :<C-u>Buffers<CR>
	nnoremap <silent><Leader>gg       :<C-u>Rg<CR>
	nnoremap <silent><Leader>:        :<C-u>Commands<CR>
	nnoremap <silent><Leader>tt       :<C-u>Tags<CR>
	nnoremap <silent><Leader>tb       :<C-u>BTags<CR>
	nnoremap <silent><Leader>w        :<C-u>Windows<CR>

	" Mapping selecting mappings
	nmap <Leader><tab> <plug>(fzf-maps-n)
	xmap <Leader><tab> <plug>(fzf-maps-x)
	omap <Leader><tab> <plug>(fzf-maps-o)

	" Insert mode completion
	imap <c-x><c-k> <plug>(fzf-complete-word)
	imap <c-x><c-f> <plug>(fzf-complete-path)
	imap <c-x><c-j> <plug>(fzf-complete-file-ag)
	imap <c-x><c-l> <plug>(fzf-complete-line)
endif

if dein#tap('nerdtree')
	let g:NERDTreeMapOpenSplit = 'sv'
	let g:NERDTreeMapOpenVSplit = 'sg'
	let g:NERDTreeMapOpenInTab = 'st'
	let g:NERDTreeMapOpenInTabSilent = 'sT'
	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
	let g:NERDTreeMapOpenRecursively = 't'
	let g:NERDTreeMapCloseChildren = 'T'
	let g:NERDTreeMapToggleHidden = '.'

	nnoremap <silent> <Leader>op :<C-u>let NERDTreeWinPos=0 \| NERDTreeToggle<CR>
	nnoremap <silent> <Leader>oP :<C-u>let NERDTreeWinPos=1 \| NERDTreeToggle<CR>
endif

if dein#tap('ale.vim')
	nmap ]e :<C-u>ALENext<CR>
	xmap ]e :<C-u>ALENext<CR>
	omap ]e :<C-u>ALENext<CR>
	nmap [e :<C-u>ALEPrevious<CR>
	xmap [e :<C-u>ALEPrevious<CR>
	omap [e :<C-u>ALEPrevious<CR>
endif

if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
endif

if dein#tap('emmet-vim')
	autocmd MyAutoCmd FileType html,css,jsx,javascript,javascript.jsx
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-operator-surround')
	map <silent>ys <Plug>(operator-surround-append)
	map <silent>ds <Plug>(operator-surround-delete)
	map <silent>rs <Plug>(operator-surround-replace)
	nmap <silent>yss <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
	nmap <silent>dss <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
	nmap <silent>rss <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
	xmap <silent>dS <Plug>(operator-surround-delete)
	xmap <silent>S <Plug>(operator-surround-append)
	xmap <silent>rS <Plug>(operator-surround-append)
endif

if dein#tap('vim-operator-replace')
	nmap go <Plug>(operator-replace)
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-operator-flashy')
	map y <Plug>(operator-flashy)
	nmap Y <Plug>(operator-flashy)$
endif

if dein#tap('vim-niceblock')
	xmap I  <Plug>(niceblock-I)
	xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent>j <Plug>(accelerated_jk_gj)
	nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-sidemenu')
	nmap <Localleader>l <Plug>(sidemenu)
	xmap <Localleader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

if dein#tap('vim-peekaboo')
	nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
	xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
	nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
	inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
endif

if dein#tap('jedi-vim')
	let g:jedi#completions_command = ''
	let g:jedi#documentation_command = 'K'
	let g:jedi#goto_command = '<C-]>'
	let g:jedi#goto_assignments_command = '<Leader>g'
	let g:jedi#rename_command = '<Leader>r'
	let g:jedi#usages_command = '<Leader>n'
endif

if dein#tap('tern_for_vim')
	autocmd MyAutoCmd FileType javascript,jsx,javascript.jsx
		\  nnoremap <silent><buffer> K          :<C-u>TernDoc<CR>
		\| nnoremap <silent><buffer> <C-]>      :<C-u>TernDef<CR>
		\| nnoremap <silent><buffer> <Leader>g  :<C-u>TernType<CR>
		\| nnoremap <silent><buffer> <Leader>n  :<C-u>TernRefs<CR>
		\| nnoremap <silent><buffer> <Leader>r  :<C-u>TernRename<CR>
endif

if dein#tap('vim-signify')
	nmap <Leader>]g <Plug>(signify-next-hunk)
	nmap <Leader>[g <Plug>(signify-prev-hunk)
end

if dein#tap('vimagit')
	nnoremap <silent> mg :Magit<CR>
endif

if dein#tap('vim-easygit')
	nnoremap <silent> <Leader>gd :Gdiff<CR>
	nnoremap <silent> <Leader>gD :Gdiffoff<CR>
	nnoremap <silent> <Leader>gc :Gcommit<CR>
	nnoremap <silent> <Leader>gb :Gblame<CR>
	nnoremap <silent> <Leader>gB :Gbrowse<CR>
	nnoremap <silent> <Leader>gS :Gstatus<CR>
	nnoremap <silent> <Leader>gp :Gpush<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> m" :SidewaysJumpLeft<CR>
	nnoremap <silent> m' :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap gJ :SplitjoinJoin<CR>
	nmap gS :SplitjoinSplit<CR>
endif

if dein#tap('vim-vinegar')
	nmap - <Plug>VinegarUp
endif

if dein#tap('linediff.vim')
	vnoremap ,df :Linediff<CR>
	vnoremap ,da :LinediffAdd<CR>
	nnoremap ,ds :<C-u>LinediffShow<CR>
	nnoremap ,dr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('vim-commentary')
	xmap <Leader>v  <Plug>Commentary
	nmap <Leader>v  <Plug>CommentaryLine
	xmap gc  <Plug>Commentary
	nmap gc  <Plug>Commentary
	omap gc  <Plug>Commentary
	nmap gcc <Plug>CommentaryLine
	nmap cgc <Plug>ChangeCommentary
	nmap gcu <Plug>Commentary<Plug>Commentary
endif

if dein#tap('vim-easymotion')
	nmap gss <Plug>(easymotion-s2)
	nmap gsd <Plug>(easymotion-s)
	nmap gsf <Plug>(easymotion-overwin-f)
	map  gsh <Plug>(easymotion-linebackward)
	map  gsl <Plug>(easymotion-lineforward)
	map  gsj <Plug>(easymotion-j)
	map  gsk <Plug>(easymotion-k)
	map  gs/ <Plug>(easymotion-sn)
	omap gs/ <Plug>(easymotion-tn)
	map  gsn <Plug>(easymotion-next)
	map  gsp <Plug>(easymotion-prev)
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

" vim: set ts=2 sw=2 tw=80 noet :
