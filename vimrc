"============================================================================
" Enable Pathogen (Easy plugin manager)
"============================================================================
execute pathogen#infect()

"============================================================================
" General options
"============================================================================
" Color molokai
colo PaperColor
set background=dark
set t_Co=256

" Syntax highlight on
syntax on

" Filetype identification on
filetype plugin indent on

" Line numbers on by default
set number

" Set cursorline
set cursorline

"============================================================================
" Set up persistent undo (with all undo files in one directory)
"============================================================================
if has('persistent_undo')
   set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000


"============================================================================
" When completing, show all options, insert common prefix, then iterate
"============================================================================
set wildmode=list:longest,full

"============================================================================
" Enabling some cool search options
"============================================================================
"Incremental search
set incsearch
"Highlight search
set hlsearch
"Remap search key to allow Perl like regular expression search with \v directly
nnoremap / /\v
"Setting ignore case and smart case
set ignorecase smartcase
" Make delete key in Normal mode remove the persistently highlighted matches
nmap <silent>  <BS>  :nohlsearch<CR>

"============================================================================
" Status bar
"============================================================================
" Show the status bar all the time
set laststatus=2

"Enable tabs on airline status
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='molokai'
let g:airline_theme='papercolor'


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

 " unicode symbols
let g:airline_left_sep = ' '
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.crypt = '🔒 '
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"============================================================================
" Useful plugins
"============================================================================

" Map Tagbar to F9
" nnoremap <silent> <F9> :TagbarToggle<CR>

"## For Ctrl-P extension
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"============================================================================
" Options for vim-go and Golang programming in general
"============================================================================
" Line numbers on by default for Go files
"autocmd BufNewFile,BufRead *.go set number

" Set tabs in go to equivalent of 4 spaces (instead of 8)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" GoImports will run on Save
let g:go_fmt_command="goimports"

" Common Go commands
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>e <Plug>(go-rename)
" au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>s <Plug>(go-implements)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Enabling GoMetaLinter on save
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "5s"

"============================================================================
" Enable neosnippet
"============================================================================
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"============================================================================
" numbers plugin
"============================================================================
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

"============================================================================
" NERDTree plugin
"============================================================================
" map <F5> :NERDTreeToggle<CR>

let g:completor_gocode_binary = '/Users/caiwenpi/Data/gopath/bin/gocode'

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI"

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

" 取消换行
set nowrap

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" 粘贴多行缩进
set pastetoggle=<F2>

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set ffs=unix,dos,mac

noremap <F1> <Esc>

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 搜索相关
map <space> /

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" kj 替换 Esc
inoremap kj <Esc>

" 打开当前文件目录
"nn <leader>b :exec("NERDTree ".expand('%:h'))<CR>")

map <leader><space> :FixWhitespace<cr>

" map <leader>n :NERDTreeToggle<CR>
" let NERDTreeHighlightCursorline=1
" let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" nerdtreetabs
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 关闭同步
" let g:nerdtree_tabs_synchronize_view=0
" let g:nerdtree_tabs_synchronize_focus=0
" 是否自动开启nerdtree
" thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165

let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_def_mapping_enabled = 1
let g:go_def_mode = 'godef'

" 括号高亮
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nmap <Leader>m :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_show_visibility = 1

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :exec("NERDTree ".expand('%:h'))<CR>")"

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y"
