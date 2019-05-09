call plug#begin('~/.vim/plugged')

" 对齐
Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 查找
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" 去除空格
Plug 'ntpeters/vim-better-whitespace'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'

call plug#end()
