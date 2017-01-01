"=========================================================================
" DesCRiption: �ʺ��Լ�ʹ�õ�vimrc�ļ���for Linux/Windows, GUI/Console
"
" Last Change: 2010��08��02�� 15ʱ13�� 
"
" Version: 1.80
"
"=========================================================================
"==================="
"1.��������"
"==================="
set number "��ʾ�к�"
set autoread"�ļ���Vim֮���޸Ĺ����Զ����¶���"
set autochdir"��ǰĿ¼���ű��༭�ļ��ĸı���ı�"
set nocompatible "ʹ��vim����vi"
map 9 $"ͨ��9��ת����ĩβ,0Ĭ����ת������"
map <silent>  <C-A>  gg v G "Ctrl-A ѡ����������"
set backspace=2"����ʱ���˸��ɾ��
set shortmess=atI " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" ������״̬����ʾ����Ϣ
set laststatus=2    " ������ʾ״̬��(1),������ʾ״̬��(2)  

"=========================="
"2.��Ҫ�����ļ��ͱ����ļ������ٳ�ͻ"
"=========================="
set noswapfile
set nobackup
set nowb
set nowritebackup
set noundofile

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1


set go= "ȥ���߿�

"ճ��ʱ���ָ�ʽ
set paste
set nowrap " ȡ�����С�


"==================="
"3. ��gvim ������"
"=================="
 if has("gui_running")
     colorscheme  solarized
     "colorscheme  darkblue
     "colorscheme Tomorrow Tomorrow-Night
     "colorscheme desert
 endif

"������
filetype plugin on
"�����Զ���ȫ
filetype plugin indent on

"����ļ�����
filetype on
" ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype indent on
" �Զ�����
set autoindent
set cindent
set showmatch " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
set matchtime=2 " ������ת��ƥ�����ŵ�ʱ��
set smartindent " ��������ʱʹ�������Զ�����
" ��ʷ��¼��
set history=1000

""��״̬����ʾ���������������
set showcmd

"markdown����
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc


syntax on " �Զ��﷨����
set ruler " ��״̬�����
set autochdir " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set ignorecase smartcase " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set incsearch " ������������ʱ����ʾ�������
set hlsearch " ����ʱ������ʾ���ҵ����ı�

"==========================================
""others
"==========================================
autocmd! bufwritepost _vimrc source % " vimrc�ļ��޸�֮���Զ����� windows
autocmd! bufwritepost .vimrc source % " vimrc�ļ��޸�֮���Զ����� linux

