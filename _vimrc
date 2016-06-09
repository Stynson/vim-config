"--------------------------------------------"
"                                            "
"              Kiss Balint                   "
"                 2015                       "
"              vimrc file                    "
"               In progress                  "
"                                            "
"                                            "
"--------------------------------------------"

"==========================================="
"                Mappings                   "
"==========================================="

nmap <leader>ev :tabedit $MYVIMRC<cr>
imap <S-Space> <Esc>
map<C-n> :NERDTreeToggle<CR>
nmap <leader>w :w!<CR>
"give it a shot
imap jj <esc>
map 0 ^

"Bubble lines ----------------------------
nnoremap <C-k> V:move '<-2<CR><Esc>
nnoremap <C-j> V:move '>+1<CR><Esc>
vnoremap <C-k> :move '<-2<CR>gv
vnoremap <C-j> :move '>+1<CR>gv

"Tab navigation-------------------------
noremap <C-Tab> gt
inoremap <C-Tab> <Esc>gt
noremap <C-S-Tab> :tabp<CR> 
inoremap <C-S-Tab> <Esc>:tabp<CR>

" CTRL-A is Select all---------------
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

vnoremap <C-C> "+y

map j gj
map k gk
"Disable highlight
map <silent> <leader><cr> :noh<cr>
map <silent> <space> :noh<cr>
"==========================================="
"                General                    "
"==========================================="


set history=50		" keep 50 lines of command line history
set	ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmatch " Show matching brackets when text indicator is over them
set guicursor=a:blinkon0 "No annoying cursor blink
set nocompatible
set number
syntax on
filetype plugin indent on
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin
" Set to auto read when a file is changed from the outside
set autoread
" Always show the status line
set laststatus=2

"Backup--------------------
"set backupdir=C:\\Users\\Bubu\\vimtmp

" No annoying sound on errors
set noerrorbells visualbell t_vb=  "for console
autocmd GUIEnter * set visualbell t_vb= "for gui


" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Paste from clipboard
map <C-Q>	"+gP
cmap <C-Q>	<C-R>+

"Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"Tabulators
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set smartindent
set autoindent

"GVim and Console vim differences ------------------------
if has('gui_running')
	"Style
	colorscheme corporation
	set guioptions-=T  " no toolbar
	hi Todo guifg=#40ffff guibg=#606060
	set lines=50 columns=96 linespace=0
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar

else
  " something for console Vim
endif
" --------------------------------------------------------

"==========================================="
"                Plugins                    "
"==========================================="

execute pathogen#infect()
let NERDTreeShowHidden=1


"Default Diff function
"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
