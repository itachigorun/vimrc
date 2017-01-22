"=========================================================================
" DesCRiption: �ʺ��Լ�ʹ�õ�vimrc�ļ���for Linux/Windows, GUI/Console
"
" Last Change: 2016��01��03�� 00ʱ00�� 
"
" Version: 1.80
"
"=========================================================================

"=================================
"1.��������
"=================================
set number           "��ʾ�к�
set autoread         "�ļ���Vim֮���޸Ĺ����Զ����¶���
set autochdir        "��ǰĿ¼���ű��༭�ļ��ĸı���ı�
set nocompatible     "ʹ��vim����vi
set backspace=2      "����ʱ���˸��ɾ��
set shortmess=atI    " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" ������״̬����ʾ����Ϣ
set laststatus=2      "1������������ʱ��ʾ״̬�� 2������ʾ״̬�� 

"=================================
"2.��Ҫ�����ļ��ͱ����ļ������ٳ�ͻ
"==================================
set noswapfile
set nobackup
set nowb
set nowritebackup
set noundofile

set encoding=utf-8     "vim���ڲ����뷽ʽ
set fileencoding=utf-8  "vim�����ļ�����
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1  "��˳��ת��
set termencoding=utf-8     "vim������Ļ��ʾ�ı��룬vim����ڲ�����ת��Ϊ��Ļ���룬���������

"=================================
"3.��gvim ������
"=================================
 if has("gui_running")
     colorscheme  solarized
     "colorscheme  darkblue
     "colorscheme Tomorrow Tomorrow-Night
     "colorscheme desert
 endif

set go=                    "ȥ���߿�
set paste                  "ճ��ʱ���ָ�ʽ
set nowrap                 "ȡ������


filetype plugin on          "������
filetype plugin indent on   "�����Զ���ȫ
filetype on                 "����ļ�����
filetype indent on          " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ

set autoindent              " �Զ�����
set cindent
set showmatch               " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
set matchtime=2             " ������ת��ƥ�����ŵ�ʱ��
set smartindent             " ��������ʱʹ�������Զ�����
set history=1000            " ��ʷ��¼��
set showcmd                 "��״̬����ʾ���������������


"markdown����
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"markdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc


syntax on                  " �Զ��﷨����
set ruler                  " ��״̬�����
set autochdir              " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set ignorecase smartcase   " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set incsearch              " ������������ʱ����ʾ�������
set hlsearch               " ����ʱ������ʾ���ҵ����ı�

"=================================
"others
"=================================
autocmd! bufwritepost _vimrc source % " vimrc�ļ��޸�֮���Զ����� windows
autocmd! bufwritepost .vimrc source % " vimrc�ļ��޸�֮���Զ����� linux

