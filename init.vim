  syntax on " enable syntax                                                                                                         
  set noswapfile " don't use swap files    
  set number " show line numbers    
  set clipboard+=unnamedplus " use clipboard register '+'. See :h clipboard-unnamedplus    
  set nowrap " prevent wrap lines visually    
  set mouse=a " mouse support for all modes    
  set mousemodel=popup " right click opens popup menu    
  set hlsearch " highlight search pattern    
  set ignorecase " ignore case in search    
  set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters    
  set tabstop=4 " number of whitespace in a tab    
  set shiftwidth=4 " Use spaces when tabbing    
  set softtabstop=4    
  set expandtab " use whitespaces instead of tab    
  set autoindent " copy indent from current line when starting a new line    
  set textwidth=0 " don't break lines automatically    
  set showmatch " show the matching part of pairs [] {} ()    
  set encoding=utf-8    
  set fileencoding=utf-8    
  set fileencodings=utf-8    
  set laststatus=3 " status line in last window    
  " set wildmode=longest,list,full " completion mode    
  set termguicolors " true colors support    
  set guicursor=r-i-ci:hor5 " the cursor appearance in different modes    
  set conceallevel=1 " the way to show concealed text    
  set ttimeout ttimeoutlen=50    
  set list " turn on hidden chars visibility    
  set listchars=tab:▻\ ,trail:·,nbsp:· " show visible symbols instead    
  set title " set window title by file name    
  set splitright " vsplit puts new window to the right    
  set scrolloff=8 " start scrolling before achieving edges    
  set sidescrolloff=8 " start scrolling before achieving edges    
  set signcolumn=yes " always show left sign column    
  set cursorline " highlight current line    
  set updatetime=300 " delay before write to disk    
      
  colorscheme desert    
      
  let g:netrw_banner=0 " hide netrw top message    
  let g:netrw_liststyle=3 " netrw tree style    
      
  let no_buffers_menu=1 " desible buffers menu    
  let mapleader=' ' " map Leader to    
      
  """""""""""""""""""""""""""""""""""""""""""""    
  "                coc.nvim                   "    
  """""""""""""""""""""""""""""""""""""""""""""    
  " Jump to definition by pressing F12 "    
  nnoremap <F12> :call CocActionAsync('jumpDefinition', 'tabe')<CR>    

  " Handle ga to open code actions menu "    
  nmap <silent> ga :call CocActionAsync('codeAction', 'line')<CR>    
  xmap <silent> ga :call CocActionAsync('codeAction', 'selected')<CR>    
  nmap <silent> gA :call CocActionAsync('codeAction')<CR>    
      
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"    
  " Use <c-space> to trigger completion
  inoremap <silent><expr> <c-space> coc#refresh()
  
  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
