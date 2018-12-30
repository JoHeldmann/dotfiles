" .vimrc
" My Vim initialization file

let mapleader      = ' '
"let maplocalleader = ' '

call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
"Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ###################################################################
" Plugin configurations
" ###################################################################

" --- BufExplorer ---------------------------------------------------
nmap <Leader>b :BufExplorer<CR>

" --- CtrlP ---------------------------------------------------------
nmap <Leader>r :CtrlPMRUFiles<CR>

" --- EasyAlign -----------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- EasyMotion ----------------------------------------------------
let g:EasyMotion_keys = 'asdfghjklqwertzuiopyxcvbnm'
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" --- incSearch -----------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" --- NERDCommenter -------------------------------------------------

" --- NERDTree ------------------------------------------------------
nmap <Leader>t :NERDTreeToggle <CR>
let NERDTreeQuitOnOpen = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

" --- PaperColor ----------------------------------------------------
set background=light
colorscheme PaperColor

" --- vim-airline ---------------------------------------------------
let g:airline#extensions#tabline#enabled = 1

" -------------------------------------------------------------------

" ###################################################################
" My configurations
" ###################################################################

set autochdir
set cursorline
set fileencodings=utf-8,latin1
set ignorecase smartcase
set number relativenumber
set splitbelow splitright
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 shiftround
set textwidth=100

set pastetoggle=<F2>

if has("gui_running")
    set guifont=Hack\ 9
    set columns=100
    set lines=45
endif

" Highlight trailing blanks
highlight ExtraWhiteSpace guibg=lightred
match ExtraWhiteSpace / \+$\|\t\+/
set listchars=tab:>-,trail:.,precedes:<,extends:>,nbsp:~,eol:$
" Toggle list (display unprintable characters).
nnoremap <F3> :set list!<CR>

" alternative for Esc
imap jj <Esc>
" reach : easy on german keyboard
nmap ö :
vmap ö :

" Buffer navigation
nmap <Leader>n :bn!<CR>
nmap <Leader>p :bp!<CR>

" Recent files
nmap <Leader>o :browse oldfiles!<CR>

" Use 'standard' keys for copy/paste
" Paste works only in insert Mode!!! (conflicts with visual block)
nmap <C-c> "+yy
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>  :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Use `CTRL+{h,j,k,l}` to navigate windows from any mode
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle visibility of menu and toolbar
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
endif

" Allow saving of files as sudo when vim wasn't started with sudo
cmap w!! w !sudo tee > /dev/null %

" --- Terminal mode -------------------------------------------------

if exists(':tnoremap')
    " Prefer Neovim terminal insert mode to normal mode.
    autocmd BufEnter term://* startinsert

    " map <Esc> to exit terminal-mode:
    tnoremap <Esc> <C-\><C-n>

    " use `ALT+{h,j,k,l}` to navigate windows from any mode
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
endif

" -------------------------------------------------------------------

" Change highlighting when buffer ist changed
"let &colorcolumn=join(range(101,999),',')
"augroup BgHiglight
    "autocmd!
    "autocmd WinEnter * setlocal cursorline | ownsyntax
    "autocmd WinLeave * setlocal nocursorline | ownsyntax txt
    "autocmd WinEnter * let &colorcolumn=join(range(101,999),',')
    "autocmd WinLeave * let &colorcolumn=join(range(1,999),',')
"augroup END

" -------------------------------------------------------------------

