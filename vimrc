"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2017年01月03日 00时00分 
"
" Version: 1.80
"
"=========================================================================

"=================================
"1.基本设置
"=================================
set number           "显示行号
set autoread         "文件在Vim之外修改过，自动重新读入
set autochdir        "当前目录随着被编辑文件的改变而改变
set nocompatible     "使用vim而非vi
set backspace=2      "可随时用退格键删除
set shortmess=atI    " 启动的时候不显示那个援助乌干达儿童的提示
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
set laststatus=2      "1超过两个窗口时显示状态行 2总是显示状态行 

"=================================
"2.不要交换文件和备份文件，减少冲突
"==================================
set noswapfile
set nobackup
set nowb
set nowritebackup
set noundofile

set encoding=utf-8         "vim缓冲区以及界面的字符编码
set fileencoding=utf-8     "vim磁盘文件的字符编码
set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,cp936,latin1  "按顺序转码
set termencoding=utf-8     "vim用于终端显示的编码，vim会把内部编码转换为屏幕编码，在用于输出
language message utf-8     "解决consle输出乱码

" 读：fileencoding--->encoding 
" 显：encoding--->termencoding 
" 写：encoding--->fileencoding


"=================================
"3.对gvim 的设置
"=================================
 if has("gui_running")
     colorscheme  solarized
     "colorscheme  darkblue
     "colorscheme Tomorrow Tomorrow-Night
     "colorscheme desert
 endif

set go=                    "去掉边框
set paste                  "粘贴时保持格式
set nowrap                 "取消换行

"填充tab
set expandtab
set tabstop=4

filetype plugin on          "允许插件
filetype plugin indent on   "启动自动补全
filetype on                 "检测文件类型
filetype indent on          " 针对不同的文件类型采用不同的缩进格式

set autoindent              " 自动缩进
set cindent
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set smartindent             " 开启新行时使用智能自动缩进
set history=2000            " 历史记录数
set showcmd                 " 在状态栏显示“正在输入的命令
set showmode                " 在左下角显示当前vim模式


"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"markdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

syntax enable              " 打卡语法高亮
syntax on                  " 自动语法高亮
set ruler                  " 打开状态栏标尺
set autochdir              " 自动切换当前目录为当前文件所在的目录
set ignorecase smartcase   " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch              " 输入搜索内容时就显示搜索结果
set hlsearch               " 搜索时高亮显示被找到的文本

"=================================
"others
"=================================
autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载 windows
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载 linux

"=================================
"自动补全
"=================================
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf


"set mouse=a      "允许使用鼠标
" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: ") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

" 去掉输入错误的提示声音
set noeb