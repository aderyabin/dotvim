"*****************************************************************************"
"
"     ______        _____
"   ||      |     ||     |
"    \\     /     \\     |
"     ||   |       /    /
"     ||   |      /    /
"     ||   |     /    /
"      ||   |   /    /
"      ||   | _/   _/
"      ||   |/    |_|
"      ||        / ___ __              ___    ___
"       ||     _/ \\ | \\ \−-_−-_    ||  _/ // _|
"   _   ||    /   || | || /\ /\ |    || |  || |_
"  |_|   ||__/    ||_| ||_||_||_|_   ||_|   \\__|
"
"
"                                         by Aleksandr Koss (http://nocorp.ru)
"                                         forked by Vladimir Rybas
"
"*****************************************************************************"

"                                                                           "
"*****************************************************************************"
"
" Base settings
"
"*****************************************************************************"
 "                                                                           "

set nocompatible " Turn off vi compatible
syntax on        " Turn on syntax highlight
set mouse=a      " Mouse everywhere

set backup       " Enable creation of backup file.
set backupdir=~/.vim/backups  " Where backups will go.
set directory=~/.vim/tmp      " Where temporary files will go.

set history=1000 " Store lots of :cmdline history

set backspace=indent,eol,start " Allow to navigate from start of line to end of previous line

set wildmode=list:longest " Make cmdline tab completion similar to bash
set autoread
"set autochdir

 "                                                                           "
"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"
 "                                                                           "

""" Line options

set nu   " Turn on line numbers
"set cul  " Highligth current line

"" Highligth in red more then 80 columns

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

""" Tabulation

" Tab size

set ts=2
set shiftwidth=2  " Make indent equal 2 spaces
set ai            " Auto indent to current level
set si            " Smart indent
set stal=2
set expandtab     " No tabs, no war!

filetype on
filetype plugin on
filetype indent on
set statusline=%<%f%h%m%r%h%w%y\ %{&ff}\ %{strftime('%a\ %b\ %e\ %I:%M\ %p')}%=\ lin:%l\,%L\ col:%c%V\ %P
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)


" Do not wrap text

set nowrap
set noswapfile
"set visualbell

" Show 3 line after and before cursor when scrolling
set scrolloff=3

""" Buffers

set hidden " Allow dirty unsaved buffers

""" Appearance

colorscheme evening    " Color theme
"colorscheme railscasts    " Color theme

""" Search

set ignorecase " Ignore case when searching
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

set incsearch  " Find the next match as we type the search
set hlsearch   " Hilight searches by default

" Page Up & Page Down behaviour

set nostartofline " Don't jump to fisrt line

 "                                                                           "
"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"
 "                                                                           "

if has("gui_running")
  set tb=icons      " Only icons in toolbar
  set tbis=tiny     " Set icon size to tiny
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set showtabline=2  "tabs bar
  set laststatus=2   "file status
  colorscheme glowchalk "ir_black vrdual --  Colorscheme
  set gfn=Terminus\ 12 " Monospace\ 9 --  GUI Font
endif

 "                                                                           "
"*****************************************************************************"
"
" Key maps
"
"*****************************************************************************"
 "                                                                           "

"" Toggle between normal and insert mode

nnoremap <D-x> i
imap <D-x> <Esc>

"" Previous - Next buffer

map <M-a> :bprev<CR>
map <M-s> :bnext<CR>
map <C-Tab> :BufExplorer<CR>
map <M-d> :BufExplorer<CR>

imap <F4> <C-w>c
nmap <F4> <C-w>c

""

"" Tabs

nmap <M-t> :sp<cr><C-w>T " Open current buffer in new tab
nmap <M-w> :tabclose<cr>
map <C-Left> <esc>:tabprevious<cr>
map <C-Right> <esc>:tabnext<cr>

" Open tab by number
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt

"" Ctrl+C & Ctrl+V to system buffer

nmap <C-v> "+gp
imap <C-v> <ESC><C-v>i
vmap <C-c> "+y

"imap <C-o> <ESC>O
"imap <C-o> <ESC>o

"" Ctrl+L to clear highlight

" TODO: map turn off highlightig on any mode
"map <C-i> :nohls<CR><C-L>
"map <C-i> <C-O>:nohls<CR>
map <C-n> :noh<CR>
"map <Leader>ri :Rinitializer<Space>

" F2 - Save File
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

"" Folding

"set foldmethod=syntax
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
"vnoremap <Space> zf
"nmap z<Space> zO

"" Move visually selected blocks of text
vmap <C-h> <gv
vmap <C-l> >gv
vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z


"" Windows

" Navigate between windows

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" Window resize

nmap + <C-w>+
nmap _ <C-w>-


""""""""" Toggle maximize/unmaximize
"nnoremap <C-W>O :call MaximizeToggle ()<CR>
"nnoremap <C-W>o :call MaximizeToggle ()<CR>
"nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>
"
"function! MaximizeToggle()
"  if exists("s:maximize_session")
"    exec "source " . s:maximize_session
"    call delete(s:maximize_session)
"    unlet s:maximize_session
"    let &hidden=s:maximize_hidden_save
"    unlet s:maximize_hidden_save
"  else
"    let s:maximize_hidden_save = &hidden
"    let s:maximize_session = tempname()
"    set hidden
"    exec "mksession! " . s:maximize_session
"    only
"  endif
"endfunction

"" Surround text

"vnoremap " :call Surround('"', '"')<CR>
"vnoremap ' :call Surround("'", "'")<CR>

"""

let i=1
while i<=9
  execute "nmap <D-".i."> ".i."gt"
  execute "vmap <D-".i."> ".i."gt"
  execute "imap <D-".i."> <ESC>".i."gt"
  let i+=1
endwhile


"" Autocomplete

imap <C-Space> <C-x><C-o><C-p>

"" Other stuff

" Sudo promt with :w!!

cmap w!! %!sudo tee > /dev/null %

 "                                                                           "
"*****************************************************************************"
"
" Plugin configurations
"
"*****************************************************************************"
 "                                                                           "

""" CommandT for files browsing

" Ctrl+F map to start search

"imap <F3> :FuzzyFinderTextMate<CR>
"nmap <F3> :FuzzyFinderTextMate<CR>
"nmap <M-f> :FuzzyFinderTextMate<CR>
nmap <M-f> :CommandT<CR>
"imap <F2> :CommandT<CR>
"nmap <F2> :CommandT<CR>

""" NERDTree

" F1 to toggle NERDTree

nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> :NERDTreeToggle<CR>
"nmap <silent> <M-d> :NERDTreeToggle<CR>
"imap <silent> <M-d> :NERDTreeToggle<CR>

nmap <silent> <C-F1> :g/def /<CR>
imap <silent> <C-F1> :g/def /<CR>

""" Vim-Ruby

" Autocomplete setup

let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

""" Ack

" Use instead grep

set grepprg=ack\ -a

" Ctrl+A to start Ack search

"nmap <C-A> :Ack<Space>
"imap <C-A> :Ack<Space>

""" NERDCommenter

"imap <C-/> <ESC>,cc
"nmap <C-/> ,cc

""" RSense

"let g:rsenseHome = "$RSENSE_HOME"

 "                                                                           "
"*****************************************************************************"
"
" Functions
"
"*****************************************************************************"
 "                                                                           "

" Color switchers
"

com Lfdark :call DarkScheme()<CR>
com Lflight :call LightScheme()<CR>
com Lfdark12 :call DarkScheme12()<CR>
com Lfdarkmonaco :call DarkSchemeMonaco()<CR>

fun! DarkScheme()
  colorscheme glowchalk
  set gfn=Terminus\ 10
endf

fun! DarkScheme12()
  colorscheme glowchalk
  set gfn=Terminus\ 12
endf

fun! DarkSchemeMonaco()
  colorscheme glowchalk
  set gfn=Monaco\ 10
endf

fun! LightScheme()
  colorscheme vrdual
  set gfn=Monospace\ 10
endf


" ConqueTerm
"

com Zsh :call ZshStart()<CR>

fun! ZshStart()
  ConqueTerm zsh
endf

let g:ConqueTerm_Color = 0


""" Remove all spaces from end in each line

fun! RemoveSpaces()
  if &bin | return | endif
  if search('\s\+$', 'n')
    let line = line('.')
    let col = col('.')
    sil %s/\s\+$//ge
    call cursor(line, col)
  endif
endf

""" Surround text

fun! Surround(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  " exchange marks
  if lineA > lineB || lineA <= lineB && columnA > columnB
    " save b in c
    normal mc
    " store a in b
    normal `amb
    " set a to old b
    normal `cma
  endif
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>"
endfun

""""" IRB surrounds

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

"""" Toggle show trailing characters

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "

"" Remove all spaces from end of each line

"autocmd BufWritePre * call RemoveSpaces()

"" Auto create ctags

"autocmd BufWritePost * !ctags -R > /dev/null

"" Restore last cursor position in file

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
