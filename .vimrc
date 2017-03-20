set nocompatible                                    "We want the latest vim settings

"Load powerline fonts
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

"Load vim plugins
so ~/.vim/plugins.vim

"Basic configuration
syntax enable
set backspace=indent,eol,start                      "Make backspace behave like any other editor
let mapleader=','                                   "The default leader is \, but a comma is much better
set number					    "Let's activate line numbers
set hidden                                          "Allow buffer switching without saving   
set complete=.,w,b, 				    "Set our desired autocomplete
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set cursorline                                      "Highlight current line   
set showmode                                        "Display the current mode
set showmatch                                       "Show matching brakets
set nowrap
set autoindent
set pastetoggle=<F5>
set laststatus=2
set clipboard=unnamedplus

"Disable swap file creation
set noswapfile


"----------------Visuals--------------------"
set t_Co=256					    "Use 256 colors. This is useful for terminal vim
colorscheme jellybeans
set guifont=Roboto\ Mono\ for\ Powerline\ 11
set guioptions-=l                                   "Disable gui scrollbars 
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=e                                   "We dont want gui tabs
set guioptions-=m                                   "remove menu bar
set guioptions-=T                                   "remove toolbar
hi vertsplit guibg=bg                               "Get rid of ugly split borders



"----------------Search---------------------"
set hlsearch
set incsearch




"----------------Split Management-----------"
set splitbelow
set splitright

"Simpler mappers to switch between splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"----------------Mappings-------------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :sp $MYVIMRC<cr>

"Make it easy to edit the plugins file.
nmap <Leader>ep :sp ~/.vim/plugins.vim<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
map <F7> :NERDTreeToggle<CR>
imap <F7> <ESC>:NERDTreeToggle<CR>
map <F12> :TagbarOpenAutoClose<CR>
imap <F12> <ESC>:TagbarOpenAutoClose<CR>

"Cycle throught buffers
nnoremap <silent> <F10> :ToggleBufExplorer<CR>
inoremap <silent> <F10> <ESC>:ToggleBufExplorer<CR>
nnoremap <silent> <F8> :bn<CR>
nnoremap <silent> <F9> :bp<CR>
nnoremap <silent> <F6> :b#<CR>
inoremap <silent> <F6> <ESC>:b#<CR>

"Search methods in file
nmap <Leader>m :CtrlPBufTag<cr>

"Search in most recently used files
nmap <Leader>e :CtrlPMRUFiles<cr>

"Close current buffer
map <C-x> :bd<CR>

"Save all shortcut
nmap <C-s> :wa<CR>
imap <C-s> <ESC>:wa<CR>

"Insert new line in normal mode
nmap <C-o> o<Esc>

"View the registry
nmap <Leader>r :reg<CR>

"Close all buffers
nmap <Leader>x :bufdo bd!<CR>

"Map the copy/paste shortcut to clipboard
nnoremap y "+y
vnoremap y "+y

"Reformat code and center
map <F4> mzgg=G`z

"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeBookmarksDort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoCenter = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeStatusline = 0
let g:NERDTreeIgnore=['.git','.idea']

"/
"/ Greplace.vim
"/
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

"/
"/ Airline
"/
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

"/
"/ Bufexplorer
"/
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1 
let g:bufExplorerSplitBelow=0

"/
"/ Autopairs
"/
let g:AutoPairs={'[':']', '{':'}'} 

"/
"/ Javascript Libraries
"/
let g:used_javascript_libs = 'angularjs,angularui,angularuirouter'



"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>





"---------------Auto-commands---------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!	
	autocmd BufWritePost .vimrc source % 
augroup END

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

