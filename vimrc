"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ paa <fedg0v@proton.me>
" ░▓ code   ▓ Personal vimrc Library for daily usage
" ░▓ mirror ▓ https://github.com/paavaanan/dotfiles
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░

"-------------------------General VIM configs----------------------------------"

syntax on                       "Syntax Colouring
filetype plugin on              "Detect filetypes
set encoding=utf-8              "Default encoding utf-8
set fileencoding=utf-8          "Default encoding utf-8
set nu                          "Auto linenumber
set paste                       "misalignment Paste
set backspace=indent,eol,start  "Backspace deletion
set ruler                       "rows/cols in bar

    "-------------------------------------------------------------
    "set tabstop=4                  "TAB uses 4 spaces
    "Don't use tabstop because this scheme can't able to decoded
    "by other editors use expandtab that is compatible to all
    "set of editors universally
    "-------------------------------------------------------------

set shiftwidth=4                "Indent uses 4 spaces
set softtabstop=4               "Insert mode tab 4 spaces
set expandtab                   "Convert all TAB to spaces
set fillchars+=vert:\           "split bars plain
set hlsearch                    "search pattern highlight
set laststatus=2                "Create TAB
set hlsearch                    "Highlight search keyword
set incsearch                   "Keyword highlight when we type
set modifiable
set history=1000                "Remember more commands and search history
set undolevels=1000             "Use many much levels of undo
""set colorcolumn=81              "line wrap at line 80
set wildmenu                    "autocompleted tab in bottom bar
set noswapfile                  "No .swp file
set splitright                  "vsplit open new files in right
set splitbelow
set t_Co=256                    "For 256 colors support
set relativenumber              "Relative linenumber
set showmode                    "Retain highlighted search
set notitle                     "Dont change title. It affects TMUX
set autoread                    "Outside vim if file is updated reload it
syntax sync minlines=10000     "redraw syntax highlight without hang
set listchars=trail:█,precedes:«,extends:»,eol:↲,tab:▸\
hi NonText ctermfg=red guifg=gray


"----------Install vim plug by default at startup-------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')   "vimplug plugin manager

"-------------------------NerdTree----------------------------------------------

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>pt :NERDTreeToggle<CR>

"-------------------------Custom Shortcuts--------------------------------------
let mapleader = " "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <Leader>ww ggVG<CR>         "Visual block the whole page
map <Leader>wv ggVGgq<CR>       "Format entire page with textwidth=78

"---------------------------Airline---------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'                           "Vim status Bar


"---------------------------CtrlP-----------------------------------------------
"Plug 'kien/ctrlp.vim'

"---------------------------Buftabline------------------------------------------
Plug 'ap/vim-buftabline'
set hidden
map <F11> :bprev<CR>
map <F12> :bnext<CR>

"---------------------------vim colorschemes------------------------------------
Plug 'flazz/vim-colorschemes'

"---------------------------vim rainbow-----------------------------------------
"Plug 'luochen1990/rainbow'
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

"---------------------------vim fzf---------------------------------------------
"https://github.com/junegunn/fzf.vim#commands -- Learn Here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

map         <C-f> <Esc><Esc>:Files!<CR>
map         <C-g> <Esc><Esc>:BCommits!<CR>
inoremap    <C-f> <Esc><Esc>:Blines!<CR>
imap        <C-f> <plug>(fzf-complete-line)

nnoremap <silent> <C-f>         :Files<CR>
nnoremap <silent> <Leader>b     :Buffers<CR>
nnoremap <silent> <Leader>f     :Rg<CR>
nnoremap <silent> <Leader>/     :BLines<CR>
nnoremap <silent> <Leader>'     :Marks<CR>
nnoremap <silent> <Leader>g     :Commits<CR>
nnoremap <silent> <Leader>H     :Helptags<CR>
nnoremap <silent> <Leader>hh    :History<CR>
nnoremap <silent> <Leader>h:    :History:<CR>
nnoremap <silent> <Leader>h/    :History/<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


"-------------------------vim-devicons------------------------------------------
Plug 'ryanoasis/vim-devicons'

"-------------------------vim-floatterm-----------------------------------------
Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_toggle = '<F2>'

"-------------------------vim-sneak---------------------------------------------
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1
"-------------------------YouCompleteMe-----------------------------------------
"Plug 'ycm-core/YouCompleteMe'
"---------------------------Polygot---------------------------------------------
"Plug 'sheerun/vim-polyglot'
"-------------------------Write Documents---------------------------------------
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  set background=dark                                 " Setting dark mode
  colorscheme gruvbox
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()


call plug#end()

"--------------------------Color Correction line--------------------------------

"Enable gruvbox
set background=dark                                 " Setting dark mode
colorscheme gruvbox
highlight ColorColumn guibg=#000000 ctermbg=1
if &diff
    colorscheme gruvbox
endif


"----------My personal Shortcut-------------------------------------------------

"Toggle LineNumber
nmap <C-L><C-L> :set number! relativenumber!<CR>
nmap <C-Q><C-Q> :match ExtraWhitespace /\s\+$/<CR>


"------------------Vim color adjustment----------------------------------------

"highlight Search ctermfg=black
"highlight Search ctermbg=magenta
"hi Visual guifg=DarkGrey guibg=red

set cursorline                                      "Set cursorline
hi clear cursorline                                 "Highlight line-number
highlight CursorLineNr ctermbg=red ctermfg=white
highlight ExtraWhitespace ctermbg=red guibg=red
highlight CursorLineNr ctermbg=red ctermfg=white
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=gray

"------------------------Abbrevation to draw line-------------------------------

"colorscheme 256-grayvim
"colorscheme 256-jungle
"let g:airline_theme = 'gruvbox'
"colorscheme  solarized8_dark_flat
"highlight ColorColumn ctermbg=166
"highlight Visual guifg=Yellow guibg=Yellow
"set wildmode=longest,list,full
"set wildmode=full
"highlight ColorColumn ctermbg=0 guibg=red
"hi Search cterm=NONE ctermfg=grey ctermbg=blue         "for syntax highlight"
"let &colorcolumn="80,".join(range(80,999),",")
"set list
"set tags=tags,./tags

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
if (&background == 'dark')
  "hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#4a4244
else
  hi Visual cterm=NONE ctermfg=NONE ctermbg=223 guibg=#ffd7af
endif

hi NonText ctermfg=red guifg=gray
hi SpecialKey ctermfg=114
