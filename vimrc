"""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Colors Huang
" Email: windnameh@gmail.com
" Version: 2013.Feb.16
"
" ~/.vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"" pathogen
""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""
"" misc
""""""""""""""""""""""""""""""
set nocompatible
syntax on
set noic	"noic: case sensitive ic: case insensitive
set ruler
set number
set hlsearch
set history=2000

""""""""""""""""""""""""""""""
"" guifont
""""""""""""""""""""""""""""""
set guifont=DejaVu\ Sans\ Mono\ 11


""""""""""""""""""""""""""""""
"" back to last modified
""""""""""""""""""""""""""""""
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


""""""""""""""""""""""""""""""
"" indent
""""""""""""""""""""""""""""""
if &filetype=="c" || &filetype=="cpp" || &filetype=="h"
	set cindent
else
	set smartindent
endif
set smarttab
set expandtab
set tabstop=8
set shiftwidth=8
set textwidth=80
set colorcolumn=80

""""""""""""""""""""""""""""""
"" foldmethod
""""""""""""""""""""""""""""""
"set foldmethod=syntax
"set foldnestmax=3


""""""""""""""""""""""""""""""
"" 256 colors at terminal
""""""""""""""""""""""""""""""
"if $TERM == "xterm-256color"
	set t_Co=256
"endif


""""""""""""""""""""""""""""""
"" colorscheme settting
""""""""""""""""""""""""""""""
"" molokai, solarized-dark, solarized-light
let s:vim_theme="solarized-dark"
"let g:molokai_original = 1
"colorscheme molokai
"colorscheme kolor
if s:.vim_theme == "molokai"
	let g:molokai_original = 1
	colorscheme molokai
elseif s:.vim_theme == "solarized-dark"
	set background=dark
	if !has('gui_running')
		let g:solarized_termcolors=256
	endif
	colorscheme solarized
elseif s:.vim_theme == "solarized-light"
	set background=light
	if !has('gui_running')
		let g:solarized_termcolors=256
	endif
	colorscheme solarized
else
	let g:molokai_original = 1
	colorscheme molokai
endif

""""""""""""""""""""""""""""""
"" Line highlight
""""""""""""""""""""""""""""""
set cursorline
" color of highlight line
"set cursorcolumn	 
highlight CursorLine cterm=none ctermbg=235 guibg=#262626


""""""""""""""""""""""""""""""
"" guifont
""""""""""""""""""""""""""""""
set guifont=DejaVu\ Sans\ Mono\ 11


""""""""""""""""""""""""""""""
"" disable toolbar at gui mode
""""""""""""""""""""""""""""""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove Taglist scroll bar


""""""""""""""""""""""""""""""
"" file format
""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""""
"" doxygen
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_commentType = "C"
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_authorTag="@author  "
let g:DoxygenToolkit_dateTag="@date "
let g:DoxygenToolkit_versionTag="@version "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
map <F3>a :DoxAuthor
map <F3>f :Dox
map <F3>b :DoxBlock
map <F3>c O/** */<Left><Left>


""""""""""""""""""""""""""""""
"" cflow
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.cflow setf cflow



""""""""""""""""""""""""""""""
"" gtags
""""""""""""""""""""""""""""""
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag

""""""""""""""""""""""""""""""
"" neocomplcache
""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

""""""""""""""""""""""""""""""
" howmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 
" For showmarks plugin
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black 
""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
"nmap <silent> <leader>mk :MarksBrowser<cr>


""""""""""""""""""""""""""""""
"" Taglist
""""""""""""""""""""""""""""""
nmap <F12> :Tlist<CR>
" Split to the right side of the screen
let Tlist_Use_Left_Window = 1
" Set the window width
let Tlist_WinWidth = 40
" Sort by the order
let Tlist_Sort_Type = "order"
" Do not display the help info
let Tlist_Compact_Format = 1
" If you are the last, kill yourself
let Tlist_Exit_OnlyWindow = 1
" Do not close tags for other files
let Tlist_File_Fold_Auto_Close = 1
" Do not show folding tree
let Tlist_Enable_Fold_Column = 0
" Always display one file tags
let Tlist_Show_One_File = 1


""""""""""""""""""""""""""""""
"" NERDTree
""""""""""""""""""""""""""""""
nmap <leader>e  :NERDTreeToggle<CR>
" Set the window width
let NERDTreeWinSize = 23
" Set the window position
let NERDTreeWinPos = "right"
" Auto centre
let NERDTreeAutoCenter = 0
" Not Highlight the cursor line
let NERDTreeHighlightCursorline = 0



""""""""""""""""""""""""""""""
"" misc KET binding
""""""""""""""""""""""""""""""
" fuzzyfinder (l9 lib requred)
nnoremap <F9>ff  :FufFile<CR>
nnoremap <F9>fb  :FufBuffer<CR>
" fullscreen bindingding
" shell.vim
"
