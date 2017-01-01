"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分 
"
" Version: 1.80
"
"=========================================================================
"==================="
"1.基本设置"
"==================="
set number "显示行号"
set autoread"文件在Vim之外修改过，自动重新读入"
set autochdir"当前目录随着被编辑文件的改变而改变"
set nocompatible "使用vim而非vi"
map 9 $"通过9跳转到行末尾,0默认跳转到行首"
map <silent>  <C-A>  gg v G "Ctrl-A 选中所有内容"
set backspace=2"可随时用退格键删除
set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  

"=========================="
"2.不要交换文件和备份文件，减少冲突"
"=========================="
set noswapfile
set nobackup
set nowb
set nowritebackup
set noundofile

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1


set go= "去掉边框

"粘贴时保持格式
set paste
set nowrap " 取消换行。


"==================="
"3. 对gvim 的设置"
"=================="
 if has("gui_running")
     colorscheme  solarized
     "colorscheme  darkblue
     "colorscheme Tomorrow Tomorrow-Night
     "colorscheme desert
 endif

"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 自动缩进
set autoindent
set cindent
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set smartindent " 开启新行时使用智能自动缩进
" 历史记录数
set history=1000

""在状态栏显示“正在输入的命令
set showcmd

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc


syntax on " 自动语法高亮
set ruler " 打开状态栏标尺
set autochdir " 自动切换当前目录为当前文件所在的目录
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本

"==========================================
""others
"==========================================
autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载 windows
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载 linux

