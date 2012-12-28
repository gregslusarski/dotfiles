" ==============================================================================
" = general settings                                                           =
" ==============================================================================

" Disable vi compatibilty restrictions.
set nocompatible
" Initialize plugin manager.
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
" Enable unicode characters. This is needed for 'listchars'.
set encoding=utf-8
" Enable syntax highlighting.
syntax on
" Filetype detection:ON, plugin:ON, indent:ON.
filetype plugin indent on
" When creating a new line, set indentation same as previous line.
set autoindent
" Emulate typical editor navigation.
set nostartofline
" Don't insert extra space(after .?!).
set nojoinspaces
" <C-a>, <C-x> fixup.
set nrformats=
" Use spaces for indentation.
set expandtab
set shiftwidth=2
set softtabstop=2
" Folding stuff.
set foldmethod=indent
" Do not fold anything by default.
set foldlevel=99
" Buffer becomes hidden when it is abandoned.
set hidden
" Create new split window below the current one.
set splitbelow
" Create vertical split window right of the current one.
set splitright
" For regular expressions turn magic on.
set magic
" Enable menu for command-line completion.
set wildmenu
" When using wildmenu, first press of tab completes the common part of the
" string.  The rest of the tabs begin cycling through options.
set wildmode=longest:full,full
set wildignore=*.pdf,*.fo,*.xml
set completeopt=menuone,longest,preview
" Display special characters for certain whitespace situations.
set list
set listchars=tab:>·,extends:…,precedes:…,nbsp:&
" Search stuff.
set incsearch
" Highlight search results.
set hlsearch
" When sourcing this file, do not immediately turn on highlighting.
nohlsearch
set ignorecase
set smartcase
set nomodeline
" Lang for spell checker.
set spelllang=en,pl
" Number of suggested words for spell checker popup.
set spellsuggest=9
" Terminal title.
set title
" Always show cursor position in statusline.
set ruler
" Print line numbers on the left.
set number
" This shows what you are typing as a command.
set showcmd
set cmdheight=2
" Show matching brackets.
set showmatch
" Always show status line.
set laststatus=2
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Enable wordwrap.
set textwidth=80 wrap linebreak
" Backspace.
set backspace=indent,eol,start
set backspace=2
" Timeout for keycodes (such as arrow keys and function keys) is only 10ms.
" Timeout for Vim keymaps is a second.
set timeout timeoutlen=1000 ttimeoutlen=10
" Limit Vim's "hit-enter" messages.
set shortmess=atI
" Enable persistent undo.
set undofile
set undodir=~/tmp/vim/undo
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
" Disable swapfile and backup.
set nobackup
set noswapfile

" ==============================================================================
" = autocmd                                                                    =
" ==============================================================================

" Remove any trailing whitespace that is in the file.
au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Jumps to the last known position in a file just after opening it.
au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif
" When leaving insert mode, set nopaste.
au InsertLeave * set nopaste
" Turns off error bells.
set noerrorbells visualbell t_vb=
au GUIEnter * set vb t_vb=

" ==============================================================================
" = mappings                                                                   =
" ==============================================================================

" ------------------------------------------------------------------------------
" - general (mappings)                                                         -
" ------------------------------------------------------------------------------
" Remap leader.
nnoremap <Space> <Nop>
let mapleader = ' '
" Map semicolon to colon.
noremap ; :
noremap : ;
noremap! ; :
noremap! : ;
" Window navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c
" Move cursor in insert mode.
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" Toggle spell checking.
nnoremap <silent> <Leader>s :setlocal spell!<CR>
" Switch fast between buffers.
nnoremap <Leader>l :ls<CR>:b<Space>
"nnoremap <Leader>l :ParaBuffers<CR>
" Open vimrc.
nnoremap <Leader>v :e $MYVIMRC<CR>
" cd to the directory containing the file in the buffer.
nnoremap <Leader>cd :lcd %:h<CR>
nnoremap <Leader>e :e **/
" Write current buffer.
nnoremap <C-s> :update!<CR>
inoremap <C-s> <C-o>:update!<CR>
vnoremap <C-s> <C-c>:update!<CR>
" Write read-only file.
cnoremap W! w !sudo tee %
" Write all buffers and quit Vim.
nnoremap <Leader>wq :wa!<CR>:q<CR>
" Utl script.
nnoremap <Leader>g :Utl<CR>
" Select all text in current buffer.
nnoremap <Leader>a ggVG
" Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv
" Make Y behave like other capitals.
nnoremap Y y$
" Improve up/down movement on wrapped lines.
nnoremap j gj
nnoremap k gk
" Clear search highlights.
nnoremap <Leader>/ :nohls<CR>
" Toggle paste / nopaste
set pastetoggle=<F4>
" '+' = Linux clipboard register.
noremap <F3> "+
" Disable <f1>'s default help functionality.
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
" Esc.
inoremap jk <Esc>
inoremap kj <Esc>
" Close all folds.
nnoremap zm zM
" Open all folds.
nnoremap zr zR
" Center screen on next / prev found.
nnoremap N Nzz
nnoremap n nzz
" Make <C-u> and <C-w> undoable.
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
" Find and change inner.
nnoremap <Leader>9 f(ci(
nnoremap <Leader>0 F)ci)
nnoremap <Leader>[ f[ci[
nnoremap <Leader>] F]ci]
nnoremap <Leader>{ f{ci{
nnoremap <Leader>} F}ci}

" ------------------------------------------------------------------------------
" - cmdline-window (mappings)                                                  -
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - quickfix list (mappings)                                                   -
" ------------------------------------------------------------------------------
" Move to next quickfix item.
"nnoremap <A-right> :cnext<CR>
" Move to previous quickfix item.
"nnoremap <A-left> :cprevious<CR>
" Display current quickfix item.
"nnoremap <A-down> :cc<CR>
" Open the quickfix window.
"nnoremap <A-up> :cwindow<CR>

" ------------------------------------------------------------------------------
" - diff (mappings)                                                            -
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - insert-mode completion (mappings)                                          -
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - comments (mappings)                                                        -
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - plugins and functions (mappings)                                           -
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - custom text objects (mappings)                                             -
" -----------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" - git (mappings)                                                             -
" ------------------------------------------------------------------------------

" ==============================================================================
" = plugin settings                                                            =
" ==============================================================================

" ------------------------------------------------------------------------------
" - powerline (plugins)                                                        -
" ------------------------------------------------------------------------------
"let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'filename'
call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" ------------------------------------------------------------------------------
" - ultisnips (plugins)                                                        -
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-s-l>'

" ------------------------------------------------------------------------------
" - commentary (plugins)                                                       -
" ------------------------------------------------------------------------------
xmap \ <Plug>Commentary
nmap \ <Plug>Commentary
nmap \\ <Plug>CommentaryLine
nmap \u <Plug>CommentaryUndo

" ------------------------------------------------------------------------------
" - lustyjuggler (plugins)                                                     -
" ------------------------------------------------------------------------------
"let g:LustyJugglerDefaultMappings=0
"nnoremap <Leader>l :LustyJuggler<CR>

" ------------------------------------------------------------------------------
" - skybison (plugins)                                                         -
" ------------------------------------------------------------------------------
"nnoremap <Leader>b 2:<c-u>call SkyBison("b ")<CR>
"nnoremap <Leader>t 2:<c-u>call SkyBison("tag ")<CR>
"nnoremap <Leader>h 2:<c-u>call SkyBison("h ")<CR>
"nnoremap <Leader>e :<c-u>call SkyBison("e ")<CR>

" ------------------------------------------------------------------------------
" - paramenu (plugins)                                                         -
" ------------------------------------------------------------------------------
"let g:ParaMenuFilterRegex = 1
"let g:ParaMenuFilterFuzz = 1

" CtrlP
"let g:ctrlp_map = '<Leader>p'
"let g:ctrlp_max_files = 1000
"let g:ctrlp_working_path_mode = 'c'

" Buffalo

" FuzzyFinder
"nnoremap <Leader>b :FufBuffer<CR>
"nnoremap <Leader>d :FufDir<CR>
"nnoremap <Leader>f :FufCoverageFile<CR>
"nnoremap <Leader>t :FufTag<CR>
"nnoremap <Leader>q :FufQuickfix<CR>
"nnoremap <Leader>m :FufMruFile<CR>

" Pyflakes
" Error highlight color
"highlight SpellBad term=reverse ctermfg=0 ctermbg=3

" FuzzyFinder
"let g:fuf_modesDisable = []
"let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'

" Taglist
"map <Leader>t :TlistToggle<CR>
"let Tlist_Inc_Winwidth=0
"let Tlist_Compact_Format=1

"" Nerdtree
"let NERDTreeMinimalUI=1
"let NERDTreeWinSize=26
"let NERDTreeShowBookmarks=1
"let NERDTreeShowHidden=0
"map <Leader>n :NERDTreeToggle<CR>
"
"" Rope-vim
"map <Leader>j :RopeGotoDefinition<CR>
"map <Leader>r :RopeRename<CR>

" ==============================================================================
" = gui settings                                                               =
" ==============================================================================

if has('gui_running')
  if has('unix')
    set guifont=Droid\ Sans\ Mono\ 10.2
  elseif has('gui_win32') || has('gui_win64')
    " mswin.vim breaks visual mode and changes the
    " behavior of a large number of keys.
    let g:skip_loading_mswin=1
    set guifont=Droid_Sans_Mono:h10.2
    cd c:\
  endif
  set lines=44 columns=84
  set guioptions-=T
  set guioptions-=m
  set guioptions+=lrb
  set guioptions-=lrb
  set guioptions+=LRB
  set guioptions-=LRB
else
  " Terminal
  set t_Co=256 t_md=
endif

set background=dark
colorscheme solarized
