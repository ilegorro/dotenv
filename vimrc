  set noswapfile " don't use swap files                                                                                                                                      
  set number " show line numbers                                                                                                                                             
  set nowrap " prevent wrap lines visually                                                                                                                                   
  set mouse=a " mouse support for all modes                                                                                                                                  
  set mousemodel=popup " right click opens popup menu                                                                                                                        
  set hlsearch " highlight search pattern                                                                                                                                    
  set ignorecase " ignore case in search                                                                                                                                     
  set smartcase " Override the 'ignorecase' option if the search pattern contains upper case charact                                                                         
  set tabstop=4 " number of whitespace in a tab                                                                                                                              
  set shiftwidth=4 " Use spaces when tabbing                                                                                                                                 
  set expandtab " use whitespaces instead of tab                                                                                                                             
  set autoindent " copy indent from current line when starting a new line                                                                                                    
  set textwidth=0 " don't break lines automatically                                                                                                                          
  set showmatch " show the matching part of pairs [] {} ()                                                                                                                   
  set encoding=utf-8                                                                                                                                                         
  set fileencoding=utf-8                                                                                                                                                     
  set fileencodings=utf-8                                                                                                                                                    
  set laststatus=2 " status line in each window                                                                                                                              
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
                                                                                                                                                                             
  " To fix inncorect behavior in termguicolors mode                                                                                                                          
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"                                                                                                                                     
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"                                                                                                                                     
                                                                                                                                                                             
  colorscheme desert                                                                                                                                                         
                                                                                                                                                                             
  highlight Cursorline term=none cterm=none ctermbg=240 guibg=Grey35

 " debug options "                                                                                                                                                         
  let g:vdebug_options = {}                                                                                                                                                  
  let g:vdebug_options['debug_file_level'] = 2                                                                                                                               
  let g:vdebug_options['debug_file'] = '~/vdebug.log'                                                                                                                        
  let g:vdebug_options['server'] = 'egorychev-docker'                                                                                                                        
  let g:vdebug_options['port'] = 9003                                                                                                                                        
  let g:vdebug_options['path_maps'] = {'/var': getcwd()}                                                                                                                     
  let g:vdebug_options['break_on_open'] = 0                                                                                                                                  
  let g:vdebug_options['watch_window_style'] = 'compact'                                                                                                                     
  let g:vdebug_features = {}                                                                                                                                                 
  let g:vdebug_features['max_children'] = 128                                                                                                                                
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
   let g:airline#extensions#tabline#show_splits = 0 " hide buffers tab                                                                                                       
   let g:airline_theme = 'simple'                                                                                                                                            
   let g:bufferline_echo = 0                                                                                                                                                 
                                                                                                                                                                             
   function! s:update_highlights()                                                                                                                                           
     " Example: hi CursorLine ctermbg=none guibg=NONE "                                                                                                                      
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
  nmap <silent> gA :call CocActionAsync('codeAction')<CR>"                                                                                                                   
                                                                                                                                                                             
  " Use tab for trigger completion with characters ahead and navigate.                                                                                                       
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by                                                                                                
  " other plugin before putting this into your config.                                                                                                                       
  " function! CheckBackspace() abort                                                                                                                                         
  "   let col = col('.') - 1                                                                                                                                                 
  "       return !col || getline('.')[col - 1]  =~# '\s'                                                                                                                     
  " endfunction                                                                                                                                                              
  "·                                                                                                                                                                         
  " inoremap <silent><expr> <TAB>                                                                                                                                            
  "    \ pumvisible() ? "\<C-n>" :                                                                                                                                           
  "    \ CheckBackspace() ? "\<TAB>" :                                                                                                                                       
  "    \ coc#refresh()                                                                                                                                                       
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"                                                                                                                  
  inoremap <expr><CR> pumvisible() ? "\<C-Y>" : "\<CR>"                                                                                                                      
                                                                                                                                                                             
  " Use <c-space> to trigger completion. "                                                                                                                                   
  inoremap <silent><expr> <c-@> coc#refresh() 

  " Format by Prettier                                                                                                                                                       
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument                                                                                                        
                                                                                                                                                                             
  " highlight coc selection                                                                                                                                                  
  " highlight Conseal ctermfg=254 guifg=#e4e4e4 ctermbg=241 guifg=#626262                                                                                                    
  " highlight PmenuSel ctermfg=254 guifg=#e4e4e4 ctermbg=241 guifg=#626262                                                                                                   
                                                                                                                                                                             
  " highlight Coc errors                                                                                                                                                     
  highlight CocErrorSign ctermfg=225 guifg=#ffd7ff                                                                                                                           
  highlight CocErrorFloat ctermfg=225 guifg=#ffd7ff
