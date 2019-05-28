"""""""""""""""""""""""""""""""""""""""""
" ReadMe   : README.md
" Version  : 1.0 - Jan. 16,2014
" Contents : -> 基础配置设置
"            -> 自定义快捷键
"            -> 主题颜色显示
"            -> 其它杂项配置
"            -> 插件管理配置
"            -> 自定义的函数
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" 基础配置设置
"""""""""""""""""""""""""""""""""""""""""
filetype on                      "检测文件类型
filetype indent on               "针对不同的文件类型采用不同的缩进格式
filetype plugin on               "允许插件
filetype plugin indent on        "启动自动补全

set nobackup                     "不自动保存
set relativenumber number        "相对行号，可用Ctrl+n在相对/绝对行号间切换
set history=2000                 "history存储长度
set nocompatible                 "非兼容vi模式,避免以前版本的一些bug和局限
set autoread                     "文件修改之后自动载入
set shortmess=atI                "启动的时候不显示那个援助索马里儿童的提示
"set t_ti= t_te=                  "退出vim后，内容显示在终端屏幕
set title                        "change the terminal's title
set novisualbell                 "don't beep
set noerrorbells                 "don't beep
set showmatch                    "括号配对情况
set hidden                       "A buffer becomes hidden when it is abandoned
set wildmode=list:longest
set ttyfast
set wildignore=*.swp,*.,*.pyc,*.class
set scrolloff=7                  "至少有7行在光标所在行上下
"set mouse=a                      "为所有模式启用鼠标
set selection=old
set selectmode=mouse,key
set viminfo^=%                   "Remember info about open buffers on close
set magic                        "正则表达式匹配形式
set backspace=eol,start,indent   "Configure backspace so it acts as it should act
"set whichwrap+=<,>,h,l
set completeopt-=preview

" 搜索
"""""""""""""""""""""""""""""""""""""""""
set hlsearch                     "高亮search命中的文本。
set ignorecase                   "搜索时忽略大小写
set incsearch                    "随着键入即时搜索
set smartcase                    "有一个或以上大写字母时仍大小写敏感

" 折叠
"""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=indent
set foldlevel=99

" 缩进
"""""""""""""""""""""""""""""""""""""""""
set smartindent                  "智能缩进
set autoindent                   "总是自动缩进
set tabstop=4                    "设置Tab键的宽度(等同的空格个数)
set shiftwidth=4                 "自动对齐的空格数
set softtabstop=4                "按退格键时可以一次删掉4个空格
set smarttab                     "insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab                    "将Tab自动转化成空格(需要输入真正的Tab键时,使用Ctrl+V+Tab)
set shiftround                   "Use multiple of shiftwidth when indenting with '<' and '>'
set list listchars=tab:>-,trail:-
set cc=120

" 编码
"""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,chinese,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set helplang=cn
set termencoding=utf-8           "这句只影响普通模式 (非图形界面) 下的Vim
set ffs=unix,dos,mac             "Use Unix as the standard file type
set formatoptions+=m             "如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=B             "合并两行中文时，不在中间加空格：

" 语法
"""""""""""""""""""""""""""""""""""""""""
syntax enable                    "打开语法高亮
syntax on

" 撤销
"""""""""""""""""""""""""""""""""""""""""
set undolevels=1000              "How many undos
set undoreload=10000             "number of lines to save for undo
if v:version >= 730
    set undofile                 "keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

" 状态栏
"""""""""""""""""""""""""""""""""""""""""
set ruler                        "显示当前的行号列号
set showcmd                      "在状态栏显示正在输入的命令
set showmode
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2                 "命令行（在状态行下）的高度，默认为1，这里是2

" 相对绝对行号
"""""""""""""""""""""""""""""""""""""""""
"autocmd FocusLost * :set norelativenumber number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

set cursorline                  "突出显示当前行，可用Ctrl+k切换是否显示
set cursorcolumn                "突出显示当前列，可用Ctrl+k切换是否显示

"""""""""""""""""""""""""""""""""""""""""
" 自定义快捷键
"""""""""""""""""""""""""""""""""""""""""
" 前导符号
"""""""""""""""""""""""""""""""""""""""""
let mapleader = ']'
let g:mapleader = ']'
let g:netrw_silent = 1

" 常用快捷键
"""""""""""""""""""""""""""""""""""""""""
" 到光标所在行第一个非空字符
noremap ( ^
noremap ) $
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <ESC><space>a
inoremap <C-b> <ESC>i
nnoremap <C-a> ^
nnoremap <C-e> $

" 从光标处复制到行尾，不包括行尾结束符
noremap Y y$

" 选中状态下 Ctrl+c 复制
vnoremap cc "+y

" 保存
noremap <leader>w :w!<cr>

" 保存并退出当前窗口
noremap <leader>q :wq!<CR>


" 相对/绝对行号转换
noremap <leader>rt :call NumberToggle()<cr>
cnoremap <leader>rt :call NumberToggle()<cr>:

" 按;直接进入命令行模式
nnoremap ; :

" 去掉查找后的高亮显示
noremap <silent><leader>/ :nohls<CR>


" 多窗口标签快捷键
"""""""""""""""""""""""""""""""""""""""""
" 在多个窗口间切换
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""
" 主题颜色显示
"""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 修改主题和颜色展示
set background=dark
colorscheme solarized
set t_Co=256

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange


"""""""""""""""""""""""""""""""""""""""""
" 插件管理配置开始
"""""""""""""""""""""""""""""""""""""""""
" package dependent:  ctags
" python dependent:  pep8, pyflake

filetype off

call plug#begin('~/.vim/bundle')

" 插件：目录导航等
"""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
nnoremap<leader>n :exe'NERDTreeToggle'<CR>
let NERDTreeHighlightCursorline=1
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" 默认方向键左右可以切换buffer
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>bd :MBEbd<CR>

" 插件：标签导航等
"""""""""""""""""""""""""""""""""""""""""
Plug 'majutsushi/tagbar'
nnoremap<leader>t :exe'TagbarToggle'<CR>
let g:tagbar_left = 1
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

" 插件：文件搜索
"""""""""""""""""""""""""""""""""""""""""
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0

" 插件：状态栏美观
"""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 2

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <tab> <Plug>AirlineSelectPrevTab
nmap <s-tab> <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'

" 插件：括号显示增强
"""""""""""""""""""""""""""""""""""""""""
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
" settings for kien/rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" 插件：将每行无效的空格标红（,空格按键去掉末尾空格）
"""""""""""""""""""""""""""""""""""""""""
Plug 'bronson/vim-trailing-whitespace'
noremap <leader><space> :FixWhitespace<cr>

" 插件：快速移动
"""""""""""""""""""""""""""""""""""""""""
" 更高效的移动 ,, + w/fx
Plug 'Lokaltog/vim-easymotion'

" 插件:search
"""""""""""""""""""""""""""""""""""""""""
Plug 'dkprice/vim-easygrep'
let EasyGrepRecursive = 1
let EasyGrepWindow = 1

" 插件：快速加/减注释(选中后,按,cc加上注释,按,cu解开注释)
"""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'

" 插件：自动补全单引号，双引号等
"""""""""""""""""""""""""""""""""""""""""
Plug 'Raimondi/delimitMate'
" for python docstring " ,优化输入
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

" 插件：代码格式化
"""""""""""""""""""""""""""""""""""""""""
Plug 'godlygeek/tabular'
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>

Plug 'nvie/vim-flake8'
noremap <leader>ch :call Flake8()<CR>

" 插件：具体语言语法高亮
"""""""""""""""""""""""""""""""""""""""""
" for python.vim syntax highlight
Plug 'hdima/python-syntax'
let python_highlight_all = 1

" for markdown
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'mzlogin/vim-markdown-toc'
let g:vmt_dont_insert_fence = 1

Plug 'terryma/vim-multiple-cursors'

Plug 'tbastos/vim-lua'

Plug 'vim-scripts/a.vim'

"""""""""""""""""""""" vim-go """"""""""""""""""""""""""""
Plug 'fatih/vim-go'

au FileType go nmap <Leader>d <Plug>(go-doc-vertical)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

let g:go_code_completion_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_mod_fmt_autosave = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <leader>gg <Plug>(coc-definition)
nmap <leader>gf <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

call plug#end()
" end turn on
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""
" 插件管理配置结束
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" 自定义的函数
"""""""""""""""""""""""""""""""""""""""""
" 相对绝对行号转换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
