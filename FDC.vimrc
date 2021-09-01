
set encoding=utf-8

" Enter the current millenium
" Stop pretending be vi
set nocompatible
	
" NUMBER LINE:
" Show line number
set number
" Set number line width
set numberwidth=4
" Show Relative number
set relativenumber
" Higlight the current line in every window
set cursorline

" Enable syntax highlighting
syntax enable
"syntax on
filetype plugin on

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" PERSISTENT UNDO:
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature  
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif     

"FINDING FILES:
"Search down into subfolder
set path+=**
" Display all matching files when we tab complete
set wildmenu "Now we can:
		" - Hit tab to :find by partial match
		" - Use * to make it fuzzy

" TAG JUMPUNG:
" Create the 'tags' file ( may need to install ctags)
command! TagMe !ctags -R --exclude=.git --exclude=Deprecated .
" Highlights:
    " ^]  jumps to tag under cursor
    " g^] list ambiguous tags
    " ^t  jump back up the tag stack

"AUTOCOMPLETE:
" documented in |ins-completion|
" Highlights:
    " ^x^n for files
    " ^x^f for filenames
    " ^x^] for tags only
    " ^n for anything specified by the 'comlete' option
    " ^n & ^p moves on list

set backspace=2   " Backspace deletes like most programs in insert mode

" TEXT WRAPPING:
" Set default 80 colums textwidth color & wrap text
set textwidth=80
" Highlight colum number 81
set colorcolumn=81
" Do not wrap lines
set nowrap

" Set indentation config
" tapstop determines how many colums a tab counts for.
" shiftwidth determines how many columns text is indented when using reindent
" operations
" expandtab uses spaces instead of tabs
" NOTE: use :retab to fix existing tabs from a file
:set tabstop=4 shiftwidth=4 expandtab
:set autoindent
:set smartindent

filetype plugin indent on

" TEMP FILES RELOCATION:
" Remove Temporary files from wirking directory & store them in a temp directory
set backupdir=~/.vim/tmp// " the version of myfile.txt before your edited it.
set directory=~/.vim/tmp// " swap file, containing the unsaved changes.
set undodir=~/.vim/tmp// " is an undo file, containing the undo trees of the
                         " file edited.

" vim+8 Package support
" Packages should be instaled in ~/.vim/pack/plugins/start/<packname>
packloadall "Load all packages

"-------> ack.vim & the_sylver_searcher <-------
" https://github.com/mileszs/ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
"highlight the searched term.
let g:ackhighlight = 1

nnoremap <C-a> :Ack!<Space>
"remap <C-f> to select an inner word and search it in the wd tree
nnoremap <C-f> viwy:Ack!<Space><C-r>0<CR>

"-------> ctrlp options <-------
" Custom Ignore definition for folders and file extensions
let g:ctrlp_custom_ignore = '\v[\/](deprecated)|(\.(d|obj|o|ko|ilk|exp|a|la|lo))$'

"-------> vim-cpp-enhanced-highlight Options <-------
" Note: C++ template syntax is notoriously difficult to parse, so don't expect
" this feature to be perfect.

" uncomment to enable 
	" Highlighting of class scope is disabled by default. To enable set
 	"let g:cpp_class_scope_highlight = 1

	" Highlighting of member variables is disabled by default. To enable set
	let g:cpp_member_variable_highlight = 1

	" Highlighting of class names in declarations is disabled by default. To enable set
	"let g:cpp_class_decl_highlight = 1

	" Highlighting of POSIX functions is disabled by default. To enable set
	"let g:cpp_posix_standard = 1

	" There are two ways to highlight template functions. Either
	"let g:cpp_experimental_simple_template_highlight = 1
	" which works in most cases, but can be a little slow on large files.
	" Alternatively set
	"let g:cpp_experimental_template_highlight = 1
	" which is a faster implementation but has some corner cases where it
	" doesn't work.


	" Highlighting of library concepts is enabled by
	" Note: This will highlight the keywords concept and requires as well as
	" all named requirements (like DefaultConstructible) in the standard
	" library.
	let g:cpp_concepts_highlight = 1
	
	" Highlighting of user defined functions can be disabled by
	"let g:cpp_no_function_highlight = 1

"-------> YCM configuration <------- DEPRECATED!
"let g:ycm_global_ycm_extra_conf =
"'~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

"-------> Vim LaTex <------- 
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_dvi='latex -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_FoldedSections = 'part,chapter,section,subsection'
" redef C-j to C-g
imap <C-space> <Plug>IMAP_JumpForward
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward

"-------> Gruvbox Color Scheme configuration <-------
" Set Color Scheme by Default
" https://github.com/morhetz/gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set bg=dark
set termguicolors

"-------> NERDTree plugin configurations <--------
" https://github.com/preservim/nerdtree
" Re map specific key & shortcuts to open NERDTree?
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"change the default arrows
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '~'

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"-------> airline plugin configurations <--------
" https://github.com/vim-airline/vim-airline
let g:airline_theme='gruvbox'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"

":set t_Co=256

"-------> System-Copy PlugIn <--------
" https://github.com/christoomey/vim-system-copy
" 
" The default mapping is cp for copying and cv for pasting, and can be followed
" by any motion or text object. 
" For instance:
    " cpiw => copy word into system clipboard
    " cpi' => copy inside single quotes to system clipboard
    " cvi' => paste inside single quotes from system clipboard
" Configs
    " Declare custom copy command use following example:
	" let g:system_copy#copy_command='xclip -sel clipboard'
    " Declare custom paste command use:
	" let g:system_copy#paste_command='xclip -sel clipboard -o'
    " By default system_copy prints a message each time you execute the copy- or
    " paste-operation. If you want to suppress it use:
    " let g:system_copy_silent = 1

" Open new split panes to right and below, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap to resize vertical screens
nnoremap + :vertical resize +2<CR>
nnoremap - :vertical resize -2<CR>

