" denite.nvim
" -----------

" INTERFACE
call denite#custom#option('_', {
	\ 'prompt': 'λ:',
	\ 'empty': 0,
	\ 'winheight': 16,
	\ 'source_names': 'short',
	\ 'vertical_preview': 1,
	\ 'auto-accel': 1,
	\ 'auto-resume': 1,
	\ })

call denite#custom#option('list', {})

call denite#custom#option('mpc', {
	\ 'quit': 0,
	\ 'mode': 'normal',
	\ 'winheight': 20,
	\ 'host': 'localhost',
	\ 'port': 660
	\ })

" MATCHERS
" Default is 'matcher_fuzzy'
call denite#custom#source('tag', 'matchers', ['matcher_substring'])
if has('nvim') && &runtimepath =~# '\/cpsm'
	call denite#custom#source(
		\ 'buffer,file/old,file/rec,grep,mpc,line',
		\ 'matchers', ['matcher/cpsm', 'matcher/fuzzy'])
endif

" CONVERTERS
" Default is none
call denite#custom#source(
	\ 'buffer,file/old',
	\ 'converters', ['converter/relative_word'])

call denite#custom#var('file/rec', 'command',
	\ ['fd', '--type', 'f',
	\ '--ignore-file', $HOME.'/.config/git/gitignore',
	\ '--color', 'never',
	\ '--follow', '--hidden', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'default_opts',
	\ ['--vimgrep', '--no-heading'])

" KEY MAPPINGS
let insert_mode_mappings = [
	\  ['jk', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<C-J>', '<denite:move_to_next_line>', 'noremap'],
	\  ['<C-K>', '<denite:move_to_previous_line>', 'noremap'],
	\  ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
	\  ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
	\  ['<Up>', '<denite:assign_previous_text>', 'noremap'],
	\  ['<Down>', '<denite:assign_next_text>', 'noremap'],
	\  ['<C-Y>', '<denite:redraw>', 'noremap'],
	\ ]

let normal_mode_mappings = [
	\   ["'", '<denite:toggle_select_down>', 'noremap'],
	\   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
	\   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
	\   ['gg', '<denite:move_to_first_line>', 'noremap'],
	\   ['st', '<denite:do_action:tabopen>', 'noremap'],
	\   ['sg', '<denite:do_action:vsplit>', 'noremap'],
	\   ['sv', '<denite:do_action:split>', 'noremap'],
	\   ['sc', '<denite:quit>', 'noremap'],
	\   ['r', '<denite:redraw>', 'noremap'],
	\ ]

for m in insert_mode_mappings
	call denite#custom#map('insert', m[0], m[1], m[2])
endfor
for m in normal_mode_mappings
	call denite#custom#map('normal', m[0], m[1], m[2])
endfor

" vim: set ts=2 sw=2 tw=80 noet :
