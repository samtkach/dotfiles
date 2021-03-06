" ---------------------------------------------------------------------------
" .vimrc
"
" A simple vim configuration that takes what I like from various others
" (cited inline)
"
" Maintained by Sam Tkach
" https://github.com/samtkach/dotfiles
" ---------------------------------------------------------------------------




" ***************************************************************************
" BASIC SETTINGS
" Most of these were generated at: http://vimconfig.com/
" ***************************************************************************

set number      " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
"set textwidth=80   " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)
 
set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally
 
set autoindent  " Auto-indent new lines
set expandtab   " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
set tabstop=4 
set wrap        " enable wrapping lines
set ruler       " Show row and column ruler information
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

set history=500 " Number of lines of history to remember

set mouse=a " Activate mouse functionality





" ***************************************************************************
" MISC. USEFUL STUFF
" Most of this was cannibalized from this wonderful configuration:
" http://amix.dk/vim/vimrc.txt (version 5.0)
" ***************************************************************************

" Syntax highlighting
syntax enable

" Enable filetype plugins
filetype plugin indent on
filetype plugin on
filetype indent on

" Set autoread when a file is modified from the outside
set autoread

" set :W to sudo-save the file 
command W w !sudo tee % > /dev/null

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


" Delete trailing white space on save for python and coffeescript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Custom settings for some filetypes
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" ***************************************************************************
" VIM-PLUG CORE & PACKAGES
" Taken from a .vimrc generated by http://vim-bootstrap.com
" ***************************************************************************

" Vim-Plug Core
if has('vim_starting')
  set nocompatible  " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,html,javascript,python"
let g:vim_bootstrap_editor = "vim"	

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Install Plug packages
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
Plug 'jelera/vim-javascript-syntax'

" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

