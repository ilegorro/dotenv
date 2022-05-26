" Vim configuration file "

" enable mouse support "
set mouse=a

" enable syntax "
syntax on

" enable line numbers "
set number

" highlight current line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

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
set tabstop	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent

" show the matching part of pairs [] {} and () "
set showmatch

" enable true colors support "
set termguicolors

" Vim colorscheme "
colorscheme desert

" Spell checking "
" set spell "

set hidden
set undofile
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


"""""""""""""""""""""""
"     KEY MAPPING     "
"""""""""""""""""""""""
" Jump to definition by pressing F12 "
nnoremap <F12> :call CocActionAsync('jumpDefinition', 'tabe')<CR>

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

" Format by Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument


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

