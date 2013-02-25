" GENERAL"{{{
" --------------------
" Disable vi compatibilty restrictions
set nocompatible
" Initialize plugin manager
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" Enable unicode characters
set encoding=utf-8
" Enable syntax highlighting
syntax on
" Filetype detection:ON, plugin:ON, indent:ON
filetype plugin indent on
" Emulate typical editor navigation
set nostartofline
" Don't insert extra space(after .?!)
set nojoinspaces
" <C-a>, <C-x> fixup
set nrformats-=octal
" When creating a new line, set indentation same as previous line
set autoindent
set smarttab
set shiftround
" Folding stuff
set foldmethod=marker
" Use custom fold text
set foldtext=CustomFoldText()
" Buffer becomes hidden when it is abandoned
set hidden
" Create new split window below the current one
set splitbelow
" Create vertical split window right of the current one
set splitright
set scrolloff=1
set sidescrolloff=5
set display+=lastline
" For regular expressions turn magic on
set magic
" Enable menu for command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignore=*.fo,*.xml,.svn,.git,.hg,*.pyc,*.o,*.a,*.class,*.obj,*.swp
set completeopt=menuone,preview
" Display special characters for certain whitespace situations
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif
" Search stuff
set incsearch
" Highlight search results
set hlsearch
" When sourcing this file, do not immediately turn on highlighting
nohlsearch
set ignorecase
set smartcase
set nomodeline
" Lang for spell checker
set spelllang=en,pl
" Number of suggested words for spell checker popup
set spellsuggest=9
" Terminal title
set title
" Always show cursor position in statusline
set ruler
" Print line numbers on the left
set number
" This shows what you are typing as a command
set showcmd
set cmdheight=2
" Show matching brackets
set showmatch
" Always show status line
set laststatus=2
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Enable wordwrap
set textwidth=79 wrap linebreak
" Backspace
set backspace=indent,eol,start
set complete-=i
" Timeout for keycodes (such as arrow keys and function keys) is only 10ms
" Timeout for Vim keymaps is a second
set timeout timeoutlen=1000 ttimeoutlen=10
" Mouse support
set mouse=a
" Limit Vim's "hit-enter" messages
set shortmess=atI
set fileformats+=mac
set viminfo^=!
" Look for file changes
set autoread
set autowrite
" Command-line history
if &history < 1000
  set history=1000
endif
" Disable swapfile and backup
set nobackup
set noswapfile
" Enable persistent undo
set undofile
set undodir=~/tmp/vim/undo
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
" Netrw stuff
if !exists('g:netrw_list_hide')
  let g:netrw_list_hide = '^\.,\~$,^tags$'
endif"}}}
" MAPPINGS"{{{
" ------------
" Remap leader
nnoremap <Space> <Nop>
let mapleader = ' '
let maplocalleader = '\\'
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c
" Write current buffer
nnoremap <C-s> :update!<CR>
inoremap <C-s> <C-o>:update!<CR>
vnoremap <C-s> <C-c>:update!<CR>
" Write read-only files
cnoremap W! w !sudo tee %
" Switch fast between tab settings
cnoremap t2e setlocal sw=2 sts=2 ts=2 et
cnoremap t2n setlocal sw=2 sts=2 ts=2 noet
cnoremap t4e setlocal sw=4 sts=4 ts=4 et
cnoremap t4n setlocal sw=4 sts=4 ts=4 noet
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" Make Y behave like other capitals
nnoremap Y y$
" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
" Toggle paste / nopaste
set pastetoggle=<F4>
" '+' = Linux clipboard register
noremap <F3> "+
" Disable <f1>'s default help functionality
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
" Esc
inoremap jk <Esc>
inoremap kj <Esc>
" Center screen on next / prev found
nnoremap N Nzz
nnoremap n nzz
" Make <C-u> and <C-w> undoable
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
" Toggle spell checking
nnoremap <silent> <Leader>s :setlocal spell!<CR>
" Switch fast between buffers
" nnoremap <Leader>l :ls<CR>:b<Space>
" Open vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
" cd to the directory containing the file in the buffer
nnoremap <Leader>cd :lcd %:h<CR>
nnoremap <Leader>e :e **/
" Write all buffers and quit Vim
nnoremap <Leader>wq :wa!<CR>:q<CR>
" Select all text in current buffer
nnoremap <Leader>a ggVG
" Echo current tab settings
nnoremap <Leader>i :echo 'et'&et 'sw'&sw 'sts'&sts 'ts'&ts 'sta'&sta<CR>
" Clear search highlights
nnoremap <silent> <Leader>/ :nohls<CR>
" Leader
nnoremap <Leader>- yypVr-
nnoremap <Leader>= yypVr=
nnoremap <Leader>` yypVr~"}}}
" AUTOCOMMANDS"{{{
" -----------
augroup General
  au!
  " Remove any trailing whitespace that is in the file
  au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
  " Jumps to the last known position in a file just after opening it
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
    \ endif
  " When leaving insert mode, set nopaste
  au InsertLeave * set nopaste
  " Turns off error bells
  set noerrorbells visualbell t_vb=
  au GUIEnter * set vb t_vb=
augroup END

augroup Plugins
  au!
  autocmd BufWritePost *.py call Flake8()
augroup END

augroup FTCheck"
  " filetype.vim
  au!
  au BufNewFile,BufRead *.rss,*.atom set ft=xml
  au BufNewFile,BufRead *.txt,README,HELP,INSTALL,NEWS,TODO if &ft == ""
    \ | set ft=text|endif
augroup END

augroup FTOptions"
  " ftplugin
  au!
  " au FileType markdown setlocal sw=4 sts=4
  " au FileType python setlocal fdm=expr
  au FileType c,cpp,cs,java setlocal fdm=syntax cin
  au FileType git,gitcommit setlocal fdm=syntax
  au FileType gitcommit setlocal spell
augroup END"}}}
" FUNCTIONS{{{
" ------------
fun! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction"}}}
" PLUGINS SETTINGS"{{{
" --------------------
" Flake8
" E111 = indentation is not a multiple of four
let g:flake8_ignore="E111"

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Supertab
au FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

" Powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'filename'
call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-s-l>'

" Gundo
nnoremap <F2> :GundoToggle<CR>

" Commentary
" autocmd FileType python set commentstring=#\ %s
xmap \ <Plug>Commentary
nmap \ <Plug>Commentary
nmap \\ <Plug>CommentaryLine
nmap \u <Plug>CommentaryUndo

" CtrlP
"let g:ctrlp_map = '<Leader>p'
"let g:ctrlp_max_files = 1000
"let g:ctrlp_working_path_mode = 'c'

" Pyflakes
" Error highlight color
"highlight SpellBad term=reverse ctermfg=0 ctermbg=3

" Taglist
"map <Leader>t :TlistToggle<CR>
"let Tlist_Inc_Winwidth=0
"let Tlist_Compact_Format=1

" Rope-vim
"map <Leader>j :RopeGotoDefinition<CR>
"map <Leader>r :RopeRename<CR>"}}}
" FIXUPS"{{{
" ----------
" Fix arrow key navigation in insert mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi"}}}
" GUI & COLOR SCHEME"{{{
" ----------------
if has('gui_running')
  if has('unix')
    set guifont=Droid\ Sans\ Mono\ 10.0
  elseif has('gui_win32') || has('gui_win64')
    let g:skip_loading_mswin=1
    set guifont=Droid_Sans_Mono:h10.0
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

" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" Get rid of the underline in fold text
hi Folded term=bold cterm=bold"}}}
