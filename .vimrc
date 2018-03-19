
syntax on
filetype plugin indent on

"Information on the following setting can be found with
":help set
set tabstop=4
set expandtab
set autoindent 
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set ruler
set number
set backspace=indent,eol,start
set visualbell
set rnu
"set nowrap
set wrap

" show lines exceeding 80 characters
:set colorcolumn=80

" let you use all the color themes
set t_Co=256

" to show the underline
set cul
" set cursorline
hi CursorLine term=none cterm=none ctermbg=5

" to show match for parenthesis
set showmatch

" to set the background color and font colors, there's many sets of  
" combinations
" colo darkblue
"colo wasabi256
"colo seti
colo skittles_berry

" auto completion of words
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1]!~'\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" use ; instead of : under escape mode
nnoremap ; :

" use jj instead of <ESC>  
inoremap jj <ESC>
inoremap jJ <ESC>
inoremap Jj <ESC>
inoremap JJ <ESC>

" Uncomment below to make screen not flash on error
set vb t_vb=""

" remember cursor location
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" create a undo file to remeber the steps of undo before closing each file
set undodir=~/vimundo
set undofile

" vsplit, split, to change focus of files
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Highlight matches
set hlsearch

" Search as characters are inserted in searching mode
set incsearch

" map space to find the corresponding .h .cpp file
autocmd FileType cpp nnoremap <silent><buffer> <space>          :e %:p:.:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>

" a line will not be broken into many if the screen is not wide enough
" set nowrap
"
"
autocmd FileType cpp nnoremap <silent><buffer> <localleader>sp  :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <silent><buffer> <localleader>vsp :vsp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
