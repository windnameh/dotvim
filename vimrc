"""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author: Colors Huang
" Email: windnameh@gmail.com
"
" ~/.vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"" pathogen
"""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""
"" misc
"""""""""""""""""""""""""""""
set nocompatible
syntax on
set noic	"noic: case sensitive ic: case insensitive
set ruler
set number
set hlsearch
set history=2000

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


""""""""""""""""""""""""""""""
"" guifont
""""""""""""""""""""""""""""""
if has('gui_running')
        set guifont=inconsolata\ 14
endif


""""""""""""""""""""""""""""""
"" back to last modified
""""""""""""""""""""""""""""""
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


""""""""""""""""""""""""""""""
"" Spec C syntax highlight
""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.sc set filetype=c

""""""""""""""""""""""""""""""
"" indent
""""""""""""""""""""""""""""""
if &filetype=="c" || &filetype=="sc" || &filetype=="h"
else
	"" disable linux coding style
	let g:loaded_linuxsty = 1

	set smartindent
	set noexpandtab
	set tabstop=8
	set shiftwidth=8
	set textwidth=80
	set colorcolumn=80
endif


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
"" with Line highlight
""""""""""""""""""""""""""""""
"" molokai, solarized-dark, solarized-light
"let s:vim_theme="Tomorrow-Night-Eighties"
let s:vim_theme="molokai"
if !exists('s:vim_theme')
	colorscheme Tomorrow-Night
	set cursorline
	highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
elseif s:.vim_theme == "Tomorrow-Night-Eighties"
	colorscheme Tomorrow-Night-Eighties
	set cursorline
	highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
elseif s:.vim_theme == "molokai"
	let g:molokai_original = 1
	let g:rehash256 = 1
	colorscheme molokai
	set cursorline
	highlight CursorLine cterm=none ctermbg=235 guibg=#262626
elseif s:.vim_theme == "solarized-dark"
	set background=dark
	if !has('gui_running')
		let g:solarized_termcolors=256
	endif
	colorscheme solarized
	set cursorline
	highlight CursorLine cterm=none ctermbg=235 guibg=#262626
elseif s:.vim_theme == "solarized-light"
	set background=light
	if !has('gui_running')
		let g:solarized_termcolors=256
	endif
	colorscheme solarized
	set cursorline
	highlight CursorLine cterm=none ctermbg=235 guibg=#262626
endif

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
"" ignored file
""""""""""""""""""""""""""""""
set wildignore=*.o


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
"" Tagbar
""""""""""""""""""""""""""""""
nmap <F12> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_sort = 0

""""""""""""""""""""""""""""""
"" NERDTree
""""""""""""""""""""""""""""""
nmap <leader>n :NERDTreeToggle<CR>
" Set the window width
let NERDTreeWinSize = 40
" Set the window position
let NERDTreeWinPos = "right"
" Auto centre
let NERDTreeAutoCenter = 0
" Not Highlight the cursor line
let NERDTreeHighlightCursorline = 0

""""""""""""""""""""""""""""""
"" gundo tree
""""""""""""""""""""""""""""""
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
nnoremap <F5> :GundoToggle<CR>
