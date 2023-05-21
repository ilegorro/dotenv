" Vim configuration file "

" enable mouse support "
set mouse=a

" enable syntax "
syntax on

" enable line numbers "
set number

" disable beep
set visualbell
set t_vb=

" enable highlight search pattern "
set hlsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=119 " comment this line to prevent linebreak "
set expandtab
set autoindent

" show the matching part of pairs [] {} and () "
set showmatch

" enable true colors support "
set termguicolors

" for WSL support "
set term=xterm-256color

" To fix wrong display true colors "
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Vim colorscheme "
colorscheme desert

" Spell checking "
" set spell "

set hidden
" set undofile
set title
set nowrap
set list
set nojoinspaces
set splitright
set updatetime=300
set redrawtime=10000

" Show visible symbols instead of tabs and whitespaces "
set listchars=tab:▻\ ,trail:◦

" Star scrolling before achieving edges "
set scrolloff=8
set sidescrolloff=8

" Always show left column where error symbols are shown. To avoid shifting "
set signcolumn=yes

" set floating menu color "
highlight Pmenu guibg=#870000 ctermbg=88 guifg=#ffd7ff ctermfg=225

" highlight current line "
set cursorline
highlight Cursorline cterm=bold ctermbg=240 guibg=Grey35 
" term=underline cterm=underline ""

" debug options "
let g:vdebug_options = {}
let g:vdebug_options['debug_file_level'] = 2
let g:vdebug_options['debug_file'] = '~/vdebug.log'
let g:vdebug_options['server'] = 'server-name'
let g:vdebug_options['port'] = 9003
let g:vdebug_options['path_maps'] = {'/var': getcwd()}
let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['watch_window_style'] = 'compact'
let g:vdebug_features = {}
let g:vdebug_features['max_children'] = 128
" remap keys in case of a conflict with other plugins "
let g:vdebug_keymap = {}
let g:vdebug_keymap['run'] = '<F5>'
let g:vdebug_keymap['run_to_cursor'] = '<F9>'
let g:vdebug_keymap['step_over'] = '<F2>'
let g:vdebug_keymap['step_into'] = '<F3>'
let g:vdebug_keymap['step_out'] = '<F4>'
let g:vdebug_keymap['close'] = '<F6>'
let g:vdebug_keymap['detach'] = '<F7>'
let g:vdebug_keymap['set_breakpoint'] = '<F10>'
let g:vdebug_keymap['get_context'] = '<F11>'
let g:vdebug_keymap['eval_under_cursor'] = '<Leader><F12>'
let g:vdebug_keymap['eval_visual'] = '<Leader>e'

""""""""""""""""""""""""
"        netrw         "
""""""""""""""""""""""""
" hide netrw top message "
let g:netrw_banner=0

" tree listing by default "
" 0: Thin, one file per line "
" 1: Long, one file per line with file size and time stamp "
" 2: Wide, which is files in columns "
" 3: Tree style "
let g:netrw_liststyle=3


"""""""""""""""""""""""
"     vim-airline     "
"""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'simple'
let g:bufferline_echo = 0

function! s:update_highlights()
  " Example: hi CursorLine ctermbg=none guibg=NONE
  " set tabs color "
  highlight airline_tab ctermfg=40 ctermbg=234 guifg=#00d700 guibg=#1c1c1c
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()



"""""""""""""""""""""""
"     coc.nvim        "
"""""""""""""""""""""""
" Jump to definition by pressing F12 "
nnoremap <F12> :call CocActionAsync('jumpDefinition', 'tabe')<CR>

" Handle ga to open code actions menu "
nmap <silent> ga :call CocActionAsync('codeAction', 'line')<CR>
xmap <silent> ga :call CocActionAsync('codeAction', 'selected')<CR>
nmap <silent> gA :call CocActionAsync('codeAction')<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion. "
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion. "                                                                                         
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
  
" Format by Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" highlight coc selection 
" highlight Conseal ctermfg=254 guifg=#e4e4e4 ctermbg=241 guifg=#626262
" highlight PmenuSel ctermfg=254 guifg=#e4e4e4 ctermbg=241 guifg=#626262

" highlight Coc errors
highlight CocErrorSign ctermfg=225 guifg=#ffd7ff
highlight CocErrorFloat ctermfg=225 guifg=#ffd7ff



""""""""""""""""""""""""
"        Extra         "
""""""""""""""""""""""""
" Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

" Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

" Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"
