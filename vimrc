" personal vimrc


"filetype off


function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

" PLUGINS
" 
call plug#begin('~/.vim/plugged')

    " integrate vimtex
    Plug 'lervag/vimtex'

    " integrate undotree
    Plug 'mbbill/undotree'

    " integrate julia support
    Plug 'JuliaEditorSupport/julia-vim'

    " integrate autocompletion
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    
    " integrate supertab
    Plug 'ervandew/supertab'

    " integrate snippets
    Plug 'SirVer/ultisnips'

    " color scheme
    Plug 'sonph/onehalf' ,{ 'rtp': 'vim' }

    " vim-airline
    Plug 'vim-airline/vim-airline'

    " nerd commenter
    Plug 'scrooloose/nerdcommenter'

call plug#end()



" COLORS
"
" enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors  
else
  " 8 bit colors else
  set t_Co=256      
endif

"color scheme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"light color scheme for .tex files
autocmd BufEnter *.tex colorscheme onehalflight 

"let fortran_free_source=1
syntax enable 		    " enable syntax processing

set colorcolumn=80      " highlight column at 80th character


" SPACE & TABS
"
"set smarttab
set tabstop=2		    " number of visual spaces per <TAB>
set shiftwidth=2        " indenting with 2 spaces
"set softtabstop=4	    " number of spaces in <TAB> when editing
set expandtab		    " tabs are spaces
set smartindent
"set autoindent


" UI CONFIG
"
set number		        " show line numbers
set showcmd		        " show command in bottom bar
"set cursorline		    " highlight current line
filetype indent on	    " load filetype-specific indent files
"filetype plugin indent on
set wildmenu		    " visual autocomple for command menu
set lazyredraw		    " redraw only when needed
set showmatch		    " highlight [{()}]


" SEARCHING
"
set incsearch		    " search as characters are entered
set hlsearch		    " highlight matches

" turn of search higlighting
nnoremap <leader><space> :nohlsearch<CR>


" FOLDING
"
set foldenable		    " enable folding
set foldmethod=indent	" fold based on indent level | also possible: marker, manual, expr, syntax, diff
set foldlevelstart=10	" open most folds by default
set foldnestmax=10	    " 10 nested fold max

" space open/closes folds
nnoremap <space> za	


" MOVEMENT
"
" move verically by isuallines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


" SWITCH MODES
"
inoremap <C-x> <C-o>
nnoremap <C-y> i
inoremap <C-y> <esc>


" Marking in Insert Mode
"
inoremap <C-Left> <C-o>vb
inoremap <C-Right> <C-o>ve
inoremap <C-Up> <C-o>Vk
inoremap <C-Down> <C-o>Vj


" highlight last inserted line
nnoremap gV `[v`]

" selectmode add mouse selection
set mouse=a
" set selectmode+=mouse

" LEADER SHORTCUT
"
let mapleader=","	" leader is comma | defau \

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>


" BACKUPS
"
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" PLUGINS
"
" vimtex
"let g:vimtex_enabled = 1
"let g:tex_flavor='latex'
"let g:vimtex_compiler_method = 'latexmk'
"let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

" utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsListSnippets="<C-l>"
xmap <silent> <S-tab> :call UltiSnips#SaveLastVisualSelection()<CR><esc>gi
autocmd VimEnter * xnoremap <silent> <tab> :call UltiSnips#SaveLastVisualSelection()<cr>gvs<esc>gi



"let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDiectories=["UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

" julia
let g:latex_to_unicode_auto = 1
let g:default_julia_version = "0.6"

" undotree
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" syntax highlighting
"
" fortran
"au BufRead,BufNewFile *.for let b:fortran_fixed_source=1
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1


" auto suggestion colors
"
highlight Pmenu ctermfg=15 ctermbg=8 guifg=#EEEEEC guibg=#6C7686
highlight PmenuSel guifg=#FFFFFF

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_completion_confirm_key = '<Left>'
let g:SuperTabDefaultCompletionType = '<C-n>'

" close preview after completion
let g:ycm_autoclose_preview_window_after_completion=1


" nerdcommenter settings
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" remap comment toggle key
vmap <silent><C-c> <Plug>NERDCommenterToggle
