syntax on
" filetype plugin indent on

" ****** Set Indentations ******
"Information on the following setting can be found with
":help set
set tabstop=4
set expandtab
set autoindent 
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set smarttab
set softtabstop=4
set smartindent
set cindent
set backspace=indent,eol,start

" ****** Easy Reading Code ******
" show lines exceeding 80 characters
set colorcolumn=80
set ruler
set number
set visualbell
set rnu
" set nowrap
set wrap

" let you use all the color themes
set t_Co=256

" to show the underline
set cul
" set cursorline
hi CursorLine term=none cterm=none ctermbg=5
" hi CursorLine term=none cterm=none ctermbg=7 " This line for Mac

" to show match for parenthesis
set showmatch

" to set the background color and font colors, there's many sets of  
" combinations
" colo darkblue
" colo wasabi256
" colo seti
" colo skittles_berry

" ****** auto completion of words ******
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1]!~'\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" ****** Key Mappings ******
" use ; instead of : under escape mode
nnoremap ; :

" use jj instead of <ESC>  
inoremap jj <ESC>
inoremap jJ <ESC>
inoremap Jj <ESC>
inoremap JJ <ESC>

" vsplit, split, to change focus of files
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ****** Others ******

" Uncomment below to make screen not flash on error
set vb t_vb=""

" ****** remember after close file ******
" remember cursor location
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" create a undo file to remeber the steps of undo before closing each file
set undodir=~/vimundo
set undofile


" ****** Search Related ******
" Highlight matches
set hlsearch

" Search as characters are inserted in searching mode
set incsearch

" map space to find the corresponding .h .cpp file
autocmd FileType cpp nnoremap <silent><buffer> <space>          :e %:p:.:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>

autocmd FileType cpp nnoremap <silent><buffer> <localleader>sp  :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
autocmd FileType cpp nnoremap <silent><buffer> <localleader>vsp :vsp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>
