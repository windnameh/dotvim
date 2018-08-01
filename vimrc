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
set history=1000

" Toggle line numbers and fold column for easy copying:
nnoremap <F2>n :set nonumber!<CR>:set foldcolumn=0<CR>


"""""""""""""""""""""""""""""
"" true color
"""""""""""""""""""""""""""""
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


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
"" default indent
""""""""""""""""""""""""""""""
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set wrap
set textwidth=80
set colorcolumn=80


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
function! s:LongLineHLToggle()
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
		let g:jellybeans_background_color_256 = 233
		colorscheme jellybeans
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
        let g:airline_theme='jellybeans'
		let g:lightline = { 'colorscheme': 'jellybeans' }
	elseif a:vim_theme == "ir_black"
		colorscheme ir_black
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "Tomorrow-Night-Eighties"
		colorscheme Tomorrow-Night-Eighties
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
	elseif a:vim_theme == "tender"
		colorscheme tender
		set cursorline
		highlight CursorLine cterm=none ctermbg=234 guibg=#1c1c1c
		let g:airline_theme = 'tender'
		let g:lightline = { 'colorscheme': 'tender' }
	elseif a:vim_theme == "molokai"
		let g:molokai_original = 1
		let g:rehash256 = 1
		colorscheme molokai
		set cursorline
		highlight CursorLine cterm=none ctermbg=233 guibg=#1c1c1c
	elseif a:vim_theme == "vimbrant"
		colorscheme vimbrant
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
	"call SetColorScheme("tender")
	call SetColorScheme("jellybeans")
else
	"call SetColorScheme("tender")
	call SetColorScheme("jellybeans")
endif

"autocmd FileType python call SetColorScheme("solarized-dark")
"autocmd FileType sh call SetColorScheme("solarized-dark")


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
autocmd BufNewFile,BufRead *.cflow setf cflow


""""""""""""""""""""""""""""""
"" gtags
""""""""""""""""""""""""""""""
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag
set cscopeprg='gtags-cscope'


""""""""""""""""""""""""""""""
"" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0


""""""""""""""""""""""""""""""
"" YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

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
function! SetVimClangFormat()
	map <C-K> :pyf ~/.vim/clang-format.py<CR>
	imap <C-K> <ESC>:pyf ~/.vim/clang-format.py<CR>i
endfunction
autocmd FileType,BufNewFile,BufRead c,cpp,h,hh,hpp call SetVimClangFormat()


""""""""""""""""""""""""""""""
"" python yapf
""""""""""""""""""""""""""""""
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>


""""""""""""""""""""""""""""""
"" makrdown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
