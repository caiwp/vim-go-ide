"============================================================================
" Enable Pathogen (Easy plugin manager)
"============================================================================
"execute pathogen#infect()

"============================================================================
" General options
"============================================================================
" Color molokai
colo PaperColor
set background=dark
set t_Co=256

" Syntax highlight on
syntax enable
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
let g:airline_left_sep           = ' '
let g:airline_left_sep           = ' '
let g:airline_right_sep          = ' '
let g:airline_right_sep          = ' '
let g:airline_symbols.crypt      = '🔒 '
let g:airline_symbols.linenr     = '☰'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.maxlinenr  = '㏑'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.spell      = 'Ꞩ'
let g:airline_symbols.notexists  = '∄'
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
au FileType go nmap <Leader>t <Plug>(go-test-func)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Enabling GoMetaLinter on save
let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_metalinter_autosave_enabled = ['errcheck']
let g:go_metalinter_autosave_enabled = []
let g:go_metalinter_deadline = "5s"

"============================================================================
" numbers plugin
"============================================================================
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

"============================================================================
" NERDTree plugin
"============================================================================
" map <F5> :NERDTreeToggle<CR>

" let g:completor_gocode_binary = '/Users/caiwenpi/Data/gopath/bin/gocode'

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

set encoding      =utf-8
set fileencodings =ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang      =cn
set ffs           =unix,dos,mac

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
" inoremap kj <Esc>

map <leader><space> :StripWhitespace<cr>

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

let g:go_fmt_fail_silently                   = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_function_arguments        = 1
let g:go_highlight_types                     = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_variable_declarations     = 1
let g:go_highlight_variable_assignments      = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_def_mapping_enabled                 = 1
let g:go_def_mode                            = 'gopls'

" 括号高亮
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

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
map <leader>f :NERDTreeFind<cr>

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y"

set scrolloff=3

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" https://github.com/junegunn/fzf
set rtp+=/usr/local/opt/fzf
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

" ctrlp
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.php write

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1

source ~/.plugins.vim
