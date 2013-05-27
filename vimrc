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
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

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
	set guifont=Consolas\ 14
endif


""""""""""""""""""""""""""""""
"" back to last modified
""""""""""""""""""""""""""""""
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


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
"" Spec C syntax highlight
""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.sc set filetype=c


""""""""""""""""""""""""""""""
"" default indent
""""""""""""""""""""""""""""""
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=80
set colorcolumn=80

""""""""""""""""""""""""""""""
"" python mode setting
""""""""""""""""""""""""""""""
" python folding
let g:pymode_folding = 0

""""""""""""""""""""""""""""""
"" foldmethod
""""""""""""""""""""""""""""""
"set foldmethod=syntax
"set foldnestmax=3


""""""""""""""""""""""""""""""
"" 256 colors at terminal
""""""""""""""""""""""""""""""
set t_Co=256


""""""""""""""""""""""""""""""
"" colorscheme settting
"" with Line highlight
""""""""""""""""""""""""""""""
"" molokai, solarized-dark, solarized-light
function! SetColorScheme(vim_theme)
	if !exists('a:vim_theme')
		colorscheme Tomorrow-Night
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "Tomorrow-Night-Eighties"
		colorscheme Tomorrow-Night-Eighties
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "molokai"
		let g:molokai_original = 1
		let g:rehash256 = 1
		colorscheme molokai
		set cursorline
		highlight CursorLine cterm=none ctermbg=235 guibg=#262626
	elseif a:vim_theme == "solarized-dark"
		set background=dark
		if !has('gui_running')
			let g:solarized_termcolors=256
		endif
		colorscheme solarized
		set cursorline
		highlight CursorLine cterm=none ctermbg=235 guibg=#262626
	elseif a:vim_theme == "solarized-light"
		set background=light
		if !has('gui_running')
			let g:solarized_termcolors=256
		endif
		colorscheme solarized
		set cursorline
		highlight CursorLine cterm=none ctermbg=235 guibg=#262626
	endif
endfunction

call SetColorScheme("molokai")
autocmd FileType python call SetColorScheme("solarized-dark")

""""""""""""""""""""""""""""""
"" disable toolbar at gui mode
""""""""""""""""""""""""""""""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove Taglist scroll bar


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
