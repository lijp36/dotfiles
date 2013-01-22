" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"�趨�����ǵĸ�����ʾ  
set hlsearch  
" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���  
set nocompatible  
" history�ļ�����Ҫ��¼������  
set history=100  
" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��  
set confirm  
" ����ļ�����  
filetype on  
" �����ļ����Ͳ��  
filetype plugin on  
" Ϊ�ض��ļ�����������������ļ�  
filetype indent on  
" �������·��ŵĵ��ʲ�Ҫ�����зָ�  
set iskeyword+=_,$,@,%,#,-  
" �﷨����  
syntax on  

" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ  
set shortmess=atI  
set noerrorbells  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" ������ʾƥ�������  
set showmatch  
" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩  
set matchtime=5  
" ��������ʱ�򲻺��Դ�Сд  
set noignorecase  
" ��Ҫ�����������ľ��ӣ�phrases��  
"set nohlsearch  
" ������ʱ������Ĵʾ�����ַ�����������firefox��������  
set incsearch  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" �Զ���ʽ��  
set formatoptions=tcrqn  
" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��  
 set autoindent  
 " ΪC�����ṩ�Զ�����  
 set smartindent  
 " ʹ��C��ʽ������  
 set cindent  
 " �Ʊ��Ϊ4  
 set tabstop=4  
 " ͳһ����Ϊ4  
 set softtabstop=4  
 set shiftwidth=4  
 " ��Ҫ�ÿո�����Ʊ��  
 set noexpandtab  
 set nowrap  
 set smarttab  
 nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  
 let OmniCpp_DisplayMode = 1  
"===================================�����Զ��ر�========================
function! My_BracketComplete()
    let char = strpart(getline('.'), col('.')-1, 1)
    if (char == ")")
        return "\<Right>"
    else
        return ")"
    endif
endfunction
autocmd Filetype java,javascript,html imap ( ()<left>
"autocmd FileType java,javascript,html inoremap ) <C-R>=My_BracketComplete()<CR>

function! My_MidComplete()
    let char = strpart(getline('.'), col('.')-1, 1)
    if (char == "]")
        return "\<Right>"
    else
        return "]"
    endif
endfunction
autocmd Filetype java,javascript,html imap  [ []<left>
autocmd FileType java,javascript,html inoremap ] <C-R>=My_MidComplete()<CR>

autocmd Filetype java,javascript,html,css imap { {<esc>xA<esc>pa}<left><cr><esc>ko
function! My_BraceComplete()
    let char = strpart(getline('.'), col('.')-1, 1)
    if (char == "}")
        return "\<Right>"
    else
        return "}"
    endif
endfunction

function! My_appendSemicolon() "�ھ�ĩ��ӷֺź� ������Ի�ԭλ�� imap  ; <C-R>=My_appendSemicolon()<CR>
	let nowPos=col('.') "����±�
	let endPos=col('$') "��β�±�
	let len=endPos-nowPos
	let line=getline('.')
	if matchend(line,";\\s\*$")==strlen(line) " ��� �����ԷֺŽ�β�������ֺź����пո������� �򲻽��ֺżӵ�ĩβ,���ǹ�괦
		return ";" 
	else
		return repeat("\<Right>",len).";".repeat("\<Left>",len+1) "����β��ӷֺŲ��ص�ԭλ��
	endif
endfunction 
"============================end of �����Զ��ر�========================
"��omni���ʹ�õ�ʱ�� ����ʾ��������ʱ��һ������������ System.out.print( 
"������System.out.println() ע���������ţ��˺���Ҫ���ľ��ǵ�ʹ����ʾ��ʱ��
"����������
function! My_BracketComplete4omni()
	let line=getline('.')  "|  example: line=  System.ouout
	let  dotPos=strridx(line,".") "lengthOf('  System.')-1 ���һ����.���ڵ�λ��
	let cursePos=strlen(line)    "lengthOf('  System.ouout') ����λ��
	let len=cursePos-dotPos   "lengthof(ouout)+1 ��굽���һ����֮�� �ĳ���
	let lastCharIndex=strridx(line,'(') "�õ����һ�������ŵ��±꣬�ж��Ƿ���Ҫ����һ��������
	let bedot=strpart(line,0,dotPos) "  System  ���һ����֮ǰ�Ĳ���
	let afdot=strpart(line,dotPos+1,len) "ouout ���һ����֮�� �Ĳ���
	let b=match(afdot,'\(\w\+\)\1')   " the begin index of   ouou
	let e=matchend(afdot,'\(\w\+\)\1') " the end index of ouou 
	let ok=strpart(afdot,(e-b)/2)       " out    ,all the char after the first 'u' of ouout  
	"debug
	"return repeat("\<BS>",len-1).ok."\nline:".line."\ndotPos:".dotPos."\ncursePos:".cursePos."\nlen:".len."\nlastCharIndex:".lastCharIndex."\nbedot:".bedot."\nafdot:".afdot."\nb:".b."\ne:".e."\nok:".ok."\nrep:".rep
	let rep=repeat("\<Left>",strlen(ok)-1) "��ǰ�ƶ�strlen(ok) �����ȵ�λ�ã��Ա�ɾ��ouout ��ǰ����ֵ��ظ���ou
	let lenOfOk=strlen(ok)
	let lenOfBetweenDotAndOk=len-lenOfOk
	let rep=rep.repeat("\<BS>", lenOfBetweenDotAndOk-1) "ɾ��ouout ��ǰ����ֵ��ظ���ou
	let rep=rep.repeat("\<Right>",lenOfOk) "�������ƶ��������λ��
	if  lastCharIndex == -1
		if dotPos== -1
			return " "
		else
			return rep
		endif  
	else 
		return rep.")\<Left>"
	endif
endfunction

let g:closetag_html_style=1 
" ��һ�в��ø��ˣ���Ϊ ��closetag.vim ��������
"autocmd FileType xml,html,jsp imap  > ><C-_>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf

autocmd FileType java,javascript,html,css imap  ; <C-R>=My_appendSemicolon()<CR>
autocmd FileType java,javascript,,jsp,html,css map  ; i;<esc>
autocmd FileType java,javascript,html,jsp imap  "  "<cr><esc>kA<esc>xa<esc>ppJhi
autocmd FileType java,javascript,html,vim,jsp imap  '  '<cr><esc>kA<esc>xa<esc>ppJi
autocmd Filetype java,javascript,jsp inoremap <buffer>  .  .<C-X><C-O><C-P>
autocmd Filetype css inoremap <buffer>  :  :<C-X><C-O><C-P>
"tab ��������һ����Ŀ
autocmd Filetype css,javascript,java inoremap <buffer>  <tab>  <C-N>
"�������У�Ч����ͬ������һ����Ŀ����
autocmd Filetype java,javascript,css,html inoremap <buffer>  <F1>   <C-O><C-R>=My_BracketComplete4omni()<CR>
autocmd Filetype java,javascript,css,html, inoremap <buffer>  <F2>   <C-O><C-R>=My_BracketComplete4omni()<CR>
autocmd Filetype java,javascript,css,html inoremap <buffer>  <F3>   <C-O><C-R>=My_BracketComplete4omni()<CR>

" add jquery.vim to syntax dir
au BufRead,BufNewFile *.js set ft=javascript.jquery
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  a  a<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  b  b<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  c  c<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  d  d<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  e  e<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  f  f<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  g  g<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  h  h<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  i  i<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  j  j<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  k  k<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  l  l<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  m  m<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  n  n<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  o  o<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  p  p<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  q  q<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  r  r<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  s  s<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  t  t<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  u  u<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  v  v<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  w  w<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  x  x<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  y  y<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  z  z<C-N><C-P>

autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  A  A<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  B  B<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  C  C<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  D  D<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  E  E<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  F  F<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  G  G<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  H  H<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  I  I<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  J  J<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  K  K<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  L  L<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  M  M<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  N  N<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  O  O<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  P  P<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Q  Q<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  R  R<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  S  S<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  T  T<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  U  U<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  V  V<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  W  W<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  X  X<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Y  Y<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Z  Z<C-N><C-P>

"�趨����λ�ü���С
"winpos 355 35
"set lines=35 columns=98 



set number


set backup
set backupcopy=yes
set backupdir=~/.vimbackup

"set guioptions-=m
"set guioptions-=T

set wrap
set sidescroll=10

set fileencoding=utf-8
set enc=utf-8
" �����ļ�����
set fenc=utf-8
" �����ļ����������ͼ�֧�ָ�ʽ
set fencs=utf-8,gb18030,gbk,gb2312,cp936
