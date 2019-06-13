"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Copyright (C) Justin Mo All rights reserverd.
"
"   Aut:    Justin [mojing1999@gmail.com] 
"   Mod:    2019/05/10
"   Des:    Vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Tool
" 1. install ctags.     ubuntu : sudo apt-get install exuberant-ctags
" 2. install cscope.    ubuntu : sudo apt-get install cscope
" 3. curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"----------------------------------------------------------------------
" system detection
"----------------------------------------------------------------------
if has('win32') || has('win64') || has('win95') || has('win16')
	let g:asc_uname = 'windows'
elseif has('win32unix')
	let g:asc_uname = 'cygwin'
elseif has('unix') && (has('mac') || has('macunix'))
	let g:asc_uname = 'darwin'
elseif has('unix')
	let s:uname = substitute(system("uname"), '\s*\n$', '', 'g')
	if v:shell_error == 0 && match(s:uname, 'Linux') >= 0
		let g:asc_uname = 'linux'
	elseif v:shell_error == 0 && match(s:uname, 'FreeBSD') >= 0
		let g:asc_uname = 'freebsd'
	elseif v:shell_error == 0 && match(s:uname, 'Darwin') >= 0
		let g:asc_uname = 'darwin'
	else
		let g:asc_uname = 'posix'
	endif
else
	let g:asc_uname = 'posix'
endif


let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:tool_name = (g:asc_uname == 'windows')? 'win32': g:asc_uname
let g:vimmake_path = expand(s:home . '/tools/' . s:tool_name)

"echo s:home
"echo s:tool_name
"echo g:vimmake_path



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM 基本设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <Leader>
let mapleader=";"
let g:mapleader=";"
" History
set history=10000

" enable filetype plugin
filetype on
filetype plugin on
filetype indent on

"代码补全 
set completeopt=preview,menu

" 配色方案
set t_Co=256
syntax enable
set background=dark
"color solarized
"colorscheme desert
"colorscheme molokai


" set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
	set guioptions-=m
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" set utf8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,cp936,gb2312,gb18030,chinese
set langmenu=zh_CN.UTF-8
"set helplang=cn

" auto read when a file is changed from the outside
set autoread
set autowrite

" set 5 lines to the cursor - when moving vertically using j/k
set so=5

" cursor
set gcr=a:block-blinkon0

set viminfo^=%


" turn on the wild menu
set wildmenu

set wildignore=*.o,*~,*.pyc

" 设置魔术
set magic
" 启动时不显示援助乌干达儿童提示
set shortmess=atI
" 去掉讨厌的有关vi一致性模式
set nocompatible

set nu                      " 显示行号
set ruler                   " 显示标尺
set go= 

set showmode    
set showcmd 

set cmdheight=2 
set laststatus=2            " 显示状态栏

set cursorcolumn            " 竖行高亮
set cursorline              " 当前横行高亮
" highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

set foldenable              " 开始折叠
"set foldmethod=indent      " 设置折叠
set foldmethod=syntax       " 设置折叠
"set foldlevelstart=100
set foldlevel=3

set foldcolumn=1            " 设置折叠栏宽度
let g:SimpylFold_docstring_preview=1



set relativenumber          " 设置相对行号
set autoindent              " 自动缩进
set cindent 
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"高亮c代码的方法名
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions gui=NONE cterm=bold  ctermfg=blue


set clipboard+=unnamed      " 与windows共享剪贴板 
set gdefault                " 行内替换


set tabstop=4   
set softtabstop=4   
set shiftwidth=4    

setlocal noswapfile         " 不要生成swap文件，当buffer被丢弃的时候隐藏它 
set noswapfile
set bufhidden=hide 

set nobackup                " 覆盖文件不备份
set autochdir               " 自动切换当前目录
set nowb

set iskeyword+=_,$,@,%,#,-  " 如下符号的单词不要换行
set linespace=0             " 字符间插入的像素行数目

" When searching try to be smart about cases
set smartcase
set ignorecase smartcase    " 搜索时忽略大小写，但有一个或多个大写时，保持大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃替代呼叫
set t_vb=
set tm=500
set noeb
set nocp

set matchtime=1             " 匹配括号高亮的时间（单位是十分之一秒）

set smartindent             " 开启新行时使用智能自动缩进

set confirm                 " 在处理未保存或只读文件的时候，弹出确认

" commands, show any line changed
set report=0

" markdown 配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

set backspace=indent,eol,start
"set backspace=2 

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

set smarttab
set noexpandtab         " 不要用空格代替制表符
set showmatch
set matchtime=2
set hid
set lazyredraw
set expandtab
set lbr
set tw=500
set nocp
" set tags dir
set tags=tags

set confirm
set title



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   自定义操作习惯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goto line begin or line end
nmap LB 0
nmap LE $

" 切换到十六进制编辑方式
map <Leader>b :%!xxd<CR>
" 切换到正常编辑方式
map <Leader>B :%!xxd -r<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwords search)
map <space> /
map <c-space> ?
nnoremap <Leader><space> :noh<cr>

"
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>qa :qa<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :qa!<CR>

" 折叠和打开
nmap <Leader>a za

" 窗口移动
nnoremap nw <c-w><c-w>
nmap <Leader>j <c-w>j
nmap <Leader>k <c-w>k
nmap <Leader>h <c-w>h
nmap <Leader>l <c-w>l
nmap <Leader>M %

"分割窗口
":sp                "水平分割
":sp filename
":split
":new
":vsplit            "垂直分割
":vnew
nmap <Leader>vp :vsp<CR>
nmap <Leader>sp :sp<CR>

" Buffers / Tab switch
nnoremap <s-h> :bprevious<CR>
nnoremap <s-l> :bnext<CR>
nnoremap <s-j> :tabnext<CR>
nnoremap <s-k> :tabpre<CR>

map <Leader>bd :Bclose<CR>
map <Leader>ba :1,1000 bd!<CR>

" TAB
map <Leader>tn :tabnew<CR>
map <Leader>to :tabo<CR>
map <Leader>tc :tabc<CR>
map <Leader>ts :tabs<CR>
map <Leader>tf :tabfirst<CR>
map <Leader>tl :tablast<CR>
map <Leader>th :tab help<CR>
map <Leader>tt :tabn<Space>
map <Leader>te :tabe <c-r>=expand("%:p:h")<CR>/
nmap <Leader>tg :Te<Space><CR>

" switch cmd to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" 方便行数跳转
nmap + :+
nmap - :-

"nmap <Leader>ch :A<CR>                  " *.cpp 和 *.h 间切换
"nmap <Leader>sch :AS<CR>                " 子窗口中显示 *.cpp 或 *.h

" 比较文件
nmap <Leader>d :vert diffsplit






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   F2 添加文件信息
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F2> :call TitleDet()<cr>
function! AddTitle()
    call append(0,"/*****************************************************************************")
    call append(1," *  Copyright (C) 2003 - 2019, Justin. All rights reserverd.")
    call append(2," *  ")
    call append(3," *  Name:\t".expand("%:t"))
    call append(4," *  Auth:\tJustin Mo[mojing1999@gmail.com]")
    call append(5," *  Date:\t".strftime("%Y-%m-%d %H:%M"))
    call append(6," *  Desc:\t")
    call append(7," *****************************************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

"更新最近修改时间和文件名
function! UpdateTitle()
    normal m'
    execute '/ *  Date:\t/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function! TitleDet()
    let n=1
    "默认为添加
    while n < 8
        let line = getline(n)
        if line =~ '^\s*\*\s*\s*\S*Date:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

















"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nmap nt :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1		" 显示书签
let NERDTreeDirArrows=1			" 目录箭头 1 显示箭头  0 传统 + - |
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDChristmasTree=1         "显示增强  
let NERDTreeAutoCenter=1        "自动调整焦点  
let NERDTreeShowFiles=1         "显示文件  
let NERDTreeShowLineNumbers=1   "显示行号  
let NERDTreeHightCursorline=1   "高亮当前文件  
let NERDTreeShowHidden=1        "显示隐藏文件  
let NERDTreeMinimalUI=0         "不显示'Bookmarks' label 'Press ? for help'  
let NERDTreeWinSize=35          "窗口宽度  
"let NERDTreeWinPos=1
let NERDTreeChDirMode=2
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" autocmd VimEnter * if !argc() | NERDTree | endif

"------------------------------------------------------------------------------

" Taglist
nmap tl :Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_Ctags_Cmd="/usr/bin/ctags"	" 设置ctags
let Tlist_Exit_OnlyWindow=1				" 最后一个窗口退出
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Compart_Format=1
let Tlist_Process_File_Always=1
"let Tlist_Auto_Open=1
"let Tlist_Sort_Type="name"
let NERDTreeDirArrows=0
let Tlist_Auto_Update=1                 " Update the tag list automatically  
let Tlist_Compact_Format=1              " Hide help menu  
let Tlist_Enable_Fold_Column=0          " do show folding tree  
let Tlist_Exist_OnlyWindow=1            " If you are the last, kill yourself  
let Tlist_File_Fold_Auto_Close=0        " Fold closed other trees  
let Tlist_WinWidth=35                   " Set the window 40 cols wide.  
let Tlist_Close_On_Select=1             " Close the list when a item is selected  
let Tlist_Use_SingleClick=1             " Go To Target By SingleClick  

"------------------------------------------------------------------------------

" LeaderF
nmap <leader>ft :LeaderfFunction<CR>
nmap <leader>ff :LeaderfFile<CR>
nmap <leader>fb :LeaderfBuffer<CR>
nmap <leader>fm :LeaderfMru<CR>
nmap <leader>fl :LeaderfLine<CR>

"------------------------------------------------------------------------------
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0









" Rainbow parentheses for Lisp and variants
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
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
"let g:Tb_MaxSize = 2
"let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif


" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

" powerline
"let g:Powerline_symbols = 'fancy'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'

" SuperTab
" let g:SuperTabDefultCompletionType='context'
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
"let g:SuperTabRetainCompletionType=2

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'





"Powerline setting
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

"文件搜索
Plug 'Yggdroot/LeaderF'
"异步语法检查
Plug 'w0rp/ale'
"括号补全
Plug 'jiangmiao/auto-pairs'
"注释代码工具
Plug 'scrooloose/nerdcommenter'

Plug 'vim-scripts/taglist.vim'

Plug 'itchyny/lightline.vim'


"主题选择
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'altercation/solarized'
"Plug 'flazz/vim-colorschemes'

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" c-c++
Plug 'rhysd/vim-clang-format',           { 'for': [ 'c', 'cpp' ] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'c', 'cpp' ] }

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }


" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'

"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


"一只说话的狗
Plug 'mhinz/vim-startify'




"自动补全
"Plug 'ervandew/supertab'

"自动弹出提示
Plug 'vim-scripts/AutoComplPop'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Command	                            Description
"   PlugInstall [name ...] [#threads]	Install plugins
"   PlugUpdate [name ...] [#threads]	Install or update plugins
"   PlugClean[!]	                    Remove unused directories (bang version will clean without prompt)
"   PlugUpgrade	                        Upgrade vim-plug itself
"   PlugStatus	                        Check the status of plugins
"   PlugDiff	                        Examine changes from the previous update and the pending changes
"   PlugSnapshot[!] [output path]	    Generate script for restoring the current snapshot of the plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
