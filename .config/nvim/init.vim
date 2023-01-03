"""""""""""""""""""""""""""""""""""""""""""""""""
"                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Get the cursor looking right
set guicursor=

" Get all the Line Numbers working right
set nu
set relativenumber

" Don't highlight searches
" set nohlsearch

" Allows buffers to remain open when not in the foreground
set hidden

" Tab/Indent that kinda generic stuff
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set copyindent
set showfulltag
set smarttab
set nowrap
set incsearch
set termguicolors
syntax enable

" Disable swap & backup files
set noswapfile
set nobackup

" Start scrolling x lines before the horizontal window border
set scrolloff=7

" Don't show what mode we're in
set noshowmode

" Makes text show up at the cursor as you cycle through pop-up menu options
set completeopt=menuone,noinsert,noselect,preview

" Max character width
set colorcolumn=120

" Set the column on the left to number, can also set it to "yes"
" But then I'll always have this gray column which is SOMETIMES not useful
set signcolumn=number

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4s) leads to noticeable delays
set updatetime=50

" Show matching set of pairs [] {} ()
set showmatch

" Copy to clipboard essentially (sometimes useful, sometimes not)
set clipboard=unnamed " changed from unnamedplus to unnamed

" When splitting horizontally, split the new window below
set splitbelow
" When splitting vertically, split the new window to the right
set splitright

" " Don't pass messages to |ins-completion-menu|
" set shortmess+=c

"""""""""""""""""""""""""""""""""""" Sets from Bhaskar """"""""""""""""""""""""""""""""""""
" Show the cursor position
set ruler

" Ignore case of searches unless we're being case sensitive
set ignorecase
set smartcase

set mouse=a
set mousemodel=popup

" Make backspace work properly
set backspace=indent,eol,start


" Show the filename in the window titlebar
set title

" Search options - ignore these files
set wildignore+=*.0,*.obj,*.exe,*.contrib,*.swp,*.swo

" Enhance command-line completion
set wildmenu

set background=dark

" Always show status bar
set laststatus=2

" Show the (partial) command as it's being typed
set showcmd

set matchpairs+=<:>

" Don't reset cursor to start of the line when moving around
set nostartofline

" Time in ms to wait for key/code sequence to complete
set timeout ttimeoutlen=10

" Screen columns to keep to the left/right of cursor
set sidescrolloff=7

set whichwrap+=<,>,[,]

" set so=7

" Don't update screen during macro and script execution
set lazyredraw

" set magic

" Set undo history to 10000
set history=10000

" Re-read files if unmodified
set autoread

" set synmaxcol=10000
" set list
" set pastetoggle=<F1>
" set wildchar=<tab>

" 99 means no folds closed
set foldlevelstart=99

" Fold based on syntax
set foldmethod=syntax

" set path+=**
" set errorformat=%f:%l:%c:%m
" set grepprg=rg\ --vimgrep\ --no-heading
" set grepformat=%f:%l:%c:%m,%f:%l:%m
" set undofile
" set complete+=k

" Plugins (via Vim Plug)
call plug#begin('~/.vim/plugged')
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
" Plug 'dunstontc/vim-vscode-theme'
" Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'glepnir/dashboard-nvim' - BLOAT
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'preservim/vimux'
Plug 'junegunn/vim-peekaboo'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'machakann/vim-highlightedyank' " Don't need this anymore, vim specific

"""""""""" Plugins from Dan """"""""""
" Usability stuff
Plug 'tpope/vim-unimpaired'
" Plug 'itchyny/lightline.vim'
Plug 'milkypostman/vim-togglelist'

" Doxygen Related
" Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'ngemily/vim-vp11'

" LSP Stuff
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings' " Need to investigate what settings this enables/disables
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Experimenting with these Plugs
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'christoomey/vim-tmux-navigator'  - NOT needed atm
" Plug 'nvim-telescope/telescope-fzf-native.nvim' - NOT needed atm

" The Primeagen
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

"""""""""""""""""""""""""""""""""""" Sets from Dan """"""""""""""""""""""""""""""""""""
" Optimize for fast terminal connections
set ttyfast

" Highlight current line
set cursorline " As opposed to - set nocursorline

" Highlight searches
set hlsearch

" More search options
set wildignore+=*/tmp/*,*.so,*.zip,*.o,*/.git/*

" set textwidth=120
" set colorcolumn=+1

" Don't show the intro message when starting Vim
" set shortmess+=atI

" Use rg over grep
if executable('rg')
    " set grepprg=rg\ --vimgrep
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"""""""""""""""""""""""""""""""""""" General Purpose Settings """"""""""""""""""""""""""""""""""""
" Describe how spacing works in source files
autocmd FileType c,cpp setlocal comments=s:/*,mb:\ ,ex-2:*/,://

colorscheme gruvbox
" colorscheme nightfly
highlight Normal guibg=none

" Highlighted Yank in Neovim
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=230}

" Trim white space upon save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup WHITE_SPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"""""""""""""""""""""""""""""""""""" Maps & Settings """"""""""""""""""""""""""""""""""""
let mapleader = " "

" Saving myself some strokes
nnoremap ; :
" nnoremap . ;
vnoremap ; :

" When in normal mode, don't save the deleted character in a register
nnoremap x "_x
nnoremap s "_s

" Split windows vertically and horizontally
nnoremap <leader>ss <C-w>v
nnoremap <leader>sv <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <silent><leader>sx :close<CR>

" Navigating panes and split windows
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
" nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" Resize Window/Panes (splits basically)
nnoremap <C-a> <NOP>
" nnoremap <C-a><left> <C-w><
" nnoremap <C-a><right> <C-w>>
" nnoremap <C-a><up> <C-w>+
" nnoremap <C-a><down> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>
nnoremap <C-k> <C-w>+
nnoremap <C-j> <C-w>-

" Tab movements
nnoremap <silent><leader>tt :tabnew<CR>
nnoremap <silent><leader>tn :tabn<CR>
nnoremap <silent><leader>tp :tabp<CR>

" J and K can do half page down and half page up instead
noremap J <C-d>
noremap K <C-u>

" Shift-u does redo
noremap U <C-r>

" Use tab to jump forward and jump backwards
noremap <tab> <C-o>
noremap <S-tab> <C-i>

" Copy/Paste/Delete to system clipboard using <leader>
nmap <leader>y "+y
nmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>y "+y
vmap <leader>d "+d
vmap <leader>p "+p
vmap <leader>P "+P

" Maps to write/save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>

" Shortcut to commenting things in/out
nmap <C-/> gcc
vmap <C-/> gc
" Same shortcut but MacOS/tmux compatibility
nmap <C-_> gcc
vmap <C-_> gc

" Move to beginning/end of the line
" nnoremap <leader>b 0
" nnoremap <leader>e $
nnoremap <leader>l 0
nnoremap <leader>a $

" Source current nvim file (usually for init.vim)
nnoremap <silent><C-r> :so %<CR>

" Icrement/Decrement
" nmap + <C-a>
" nmap - <C-x>

" Select all
" nunmap <C-a>
" nmap <C-a> gg<S-v>G

" Command typos
cabbrev W  w
cabbrev Wq wq
cabbrev W! w!
cabbrev Q  q
cabbrev Q! cq

" Plugin Settings

" vim-lsp settings
" let g:lsp_signs_enabled = 1                     " enable signs
" let g:lsp_diagnostics_echo_cursor = 1           " enable echo under cursor when in normal mode
" let g:lsp_textprop_enabled = 1                  " enable echo under cursor when in normal mode
" let g:lsp_highlights_enabled = 1                " enable echo under cursor when in normal mode

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '--background-index=true', '-j=8', '--pch-storage=disk']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

" Other vim-lsp settings
" g:lsp_settings_servers_dir

" NERDTree Maps
nnoremap <silent><leader>fe :NERDTreeToggle<CR>

" Telescope Maps
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
