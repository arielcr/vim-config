set nocompatible                                    "We want the latest vim settings

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                      "Make backspace behave like any other editor
let mapleader=','                                   "The default leader is \, but a comma is much better
set number					    "Let's activate line numbers
"set autowriteall                                   "Automatically write the files when switching buffers
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
set pastetoggle=<F12>

"set laststatus=2
"set statusline=%<%f\                     
"set statusline+=%w%h%m%r                 
"set statusline+=\ [%{&ff}/%Y]            
"set statusline+=\ [%{getcwd()}]          
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  
                
"----------------Visuals--------------------"
set t_Co=256					    "Use 256 colors. This is useful for terminal vim
colorscheme atom-dark-256
set linespace=15				    "Macvim-specific line-heigth

set guioptions-=l                                   "Disable gui scrollbars 
set guioptions-=L
set guioptions-=r
set guioptions-=R




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
nmap <Leader>ev :e $MYVIMRC<cr>

"Make it easy to edit the plugins file.
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"Add simple highlight removal
nmap <Leader> :nohlsearch<cr>

"Make NERDTree easier to toggle.
map <C-n> :NERDTreeToggle<CR>

"Cycle throught buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

"Search methods in file
nmap <Leader>r :CtrlPBufTag<cr>

"Search in most recently used files
nmap <Leader>e :CtrlPMRUFiles<cr>



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

"/
"/ Greplace.vim
"/
set grepprg=ack
let g:grep_cmd_opts = '--noheading'




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
