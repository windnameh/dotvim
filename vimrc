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
"let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'vim-XXX')
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
nnoremap <F2>n :set nonumber!<CR>:set foldcolumn=0<CR>


""""""""""""""""""""""""""""""
"" shortcuts
""""""""""""""""""""""""""""""
" goto next buffer
map <C-Down> :bn<CR>
" goto previous buffer
map <C-Up> :bp<CR>


""""""""""""""""""""""""""""""
"" guifont
""""""""""""""""""""""""""""""
if has('gui_running')
	set guifont=Consolas\ 14
endif


""""""""""""""""""""""""""""""
"" back to last modified
""""""""""""""""""""""""""""""
" make vim save and load the folding of the document each time it loads
" also places the cursor in the last place that it was left.
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview


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
set wrap
set textwidth=80
set colorcolumn=80
autocmd FileType,BufNewFile,BufRead c,cpp,objc,*.mm call GoogleCodingStyle()


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
"" terminal settings
""""""""""""""""""""""""""""""
" 256 colors at terminal
set t_Co=256
" remove background color
set t_ut=


""""""""""""""""""""""""""""""
"" 80 Column highlight
""""""""""""""""""""""""""""""
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength cterm=none ctermbg=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
	if !exists('w:longlinehl')
		let w:longlinehl = matchadd('ErrorMsg', '.\%>81v', 0)
		echo "Long lines highlighted"
	else
		call matchdelete(w:longlinehl)
		unl w:longlinehl
		echo "Long lines unhighlighted"
	endif
endfunction


""""""""""""""""""""""""""""""
"" colorscheme settting
"" with Line highlight
""""""""""""""""""""""""""""""
"" molokai, solarized-dark, solarized-light
function! SetColorScheme(vim_theme)
	if !exists('a:vim_theme') || a:vim_theme == "jellybeans"
		colorscheme jellybeans
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "ir_black"
		colorscheme ir_black
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "Tomorrow-Night-Eighties"
		colorscheme Tomorrow-Night-Eighties
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "Dev_Delight"
		colorscheme Dev_Delight
		set cursorline
		highlight CursorLine cterm=none ctermbg=183 guibg=#dfafff
	elseif a:vim_theme == "molokai"
		let g:molokai_original = 1
		let g:rehash256 = 1
		colorscheme molokai
		set cursorline
		highlight CursorLine cterm=none ctermbg=233 guibg=#1c1c1c
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

if !has('gui_running')
	call SetColorScheme("jellybeans")
else
	"call SetColorScheme("ir_black")
	call SetColorScheme("jellybeans")
endif
autocmd FileType python call SetColorScheme("solarized-dark")
autocmd FileType sh call SetColorScheme("solarized-dark")


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
"" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0


""""""""""""""""""""""""""""""
"" syntastic
""""""""""""""""""""""""""""""
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'


""""""""""""""""""""""""""""""
"" YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0

" disable preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0


""""""""""""""""""""""""""""""
"" Tagbar
""""""""""""""""""""""""""""""
nmap <F12> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_sort = 0


""""""""""""""""""""""""""""""
"" NERDTree
""""""""""""""""""""""""""""""
nmap <leader>t :NERDTreeToggle<CR>
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


""""""""""""""""""""""""""""""
"" clang-format
""""""""""""""""""""""""""""""
map <C-K> :pyf ~/.vim/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/.vim/clang-format.py<CR>i
