set shiftwidth=4
set tabstop=4

set foldmethod=manual
set nofoldenable
" set foldmarker={,}

set cursorline " highlight current line
set autochdir " always switch to the current file directory 
set hidden " не выгружать буфер когда переключаешься на другой

set backup
set backupdir=$HOME/.vim/backups

let NERDTreeShowHidden=1

set browsedir=current
" Просмотр буферов
map <F2> ,be
map <S-F2> ,bs
"NERDTree
map <F3> :NERDTreeToggle<cr>

map <F5> :TlistToggle<cr>
vmap <F5> <esc>:TlistToggle<cr>
imap <F5> <esc>:TlistToggle<cr>

nnoremap <silent> <F11> :YRShow<CR> 
" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i


:set clipboard=unnamed,exclude:cons\\\|linux

let mapleader = ","

let leader = ","

filetype plugin on

" allow to use backspace instead of "x"
"set backspace=indent,eol,start whichwrap+=<,>,[,]

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb= 

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                     \*.jpg,*.gif,*.png
set wildmode=list:longest " turn on wild mode huge list


" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" Нумерация
set nu 
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"nmap yy yy:silent .w !xclip<CR>
"vmap y y:silent '<,'> w !xclip<CR>

" игнорировать регистр при поиске
set ic
" подсвечивать поиск
set hls
" использовать инкрементальный поиск
set is
" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
"set iskeyword=@,48-57,_,192-255
" задать размер табуляции в четыре пробела
set ts=4
" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
set mouse=a
" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Включаем подсветку синтаксиса
syntax on
" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase

" Отключаем создание бэкапов
"set nobackup
" Отключаем создание swap файлов
"set noswapfile
"" Все swap файлы будут помещаться в эту папку
set dir=~/.vim/swp

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r

" Просмотр нетекстовых файлов в Vim -->
    au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
    au BufReadPost *.doc silent %!antiword "%"
    au BufReadPost *.odt silent %!odt2txt "%"
" Просмотр нетекстовых файлов в Vim <--

" Горячие клавиши -->
    " Ускоренное передвижение по тексту
    nmap <C-H> 5h
    nmap <C-J> 5j
    nmap <C-K> 5k
    nmap <C-L> 5l

" Клавиши быстрого редактирования строки в режиме вставки
    " и в режиме редактирования командной строки.
    " -->
        "imap <C-H> <BS>
        imap <C-J> <Left>
        imap <C-K> <Right>
        imap <C-L> <Del>

        "cmap <C-H> <BS>
        cmap <C-J> <Left>
        cmap <C-K> <Right>
        cmap <C-L> <Del>
    " <--

  " Более привычные Page Up/Down, когда курсор остаётся в той же строке,
    " а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
    " Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
    " привязка делается к двойному нажатию этих комбинаций.
    nmap <PageUp> <C-U><C-U>
    imap <PageUp> <C-O><C-U><C-O><C-U>
    nmap <PageDown> <C-D><C-D>
    imap <PageDown> <C-O><C-D><C-O><C-D>

" Горячие клавиши <--

" Переключение между заголовочными файлами и
" файлами с исходным кодом.
" -->
    "   Соответственно:
    "   ,s - переключение на исходный код
    "   ,S - тоже самое, только открыть в новом окне
    "   ,h - переключение на заголовочный файл
    "   ,H - тоже самое, только открыть в новом окне

    nmap ,h :call MySwitchToHeader()<CR>
    nmap ,H :call MySwitchToHeaderInNewWindow()<CR>
    nmap ,s :call MySwitchToSource()<CR>
    nmap ,S :call MySwitchToSourceInNewWindow()<CR>

    function! MySwitchToHeader()
        if &filetype == "c"
            find %:t:r.h
            return
        end

        if &filetype == "cpp"
            find %:t:r.hpp
            return
        end
    endfunction

    function! MySwitchToHeaderInNewWindow()
        if &filetype == "c"
            sf %:t:r.h
            return
        end

        if &filetype == "cpp"
            sf %:t:r.hpp
            return
        end
    endfunction

    function! MySwitchToSource()
        if &filetype == "c"
            find %:t:r.c
            return
        end

        if &filetype == "cpp"
            find %:t:r.cpp
            return
        end
    endfunction

    function! MySwitchToSourceInNewWindow()
        if &filetype == "c"
            sf %:t:r.c<CR>
            return
        end

        if &filetype == "cpp"
            sf %:t:r.cpp<CR>
            return
        end
    endfunction
" <--

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" c-C AND C-v - Copy/Paste в "глобальный клипборд"
"vmap <C-C> "+yi
"imap <C-V> <esc>"+gPi

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" Выключаем ненавистный режим замены
"imap >Ins> <Esc>i

" С-q - выход из Vim 
map <C-Q> <Esc>:qa<cr>

nmap tt :tabnew<CR>

" Не использовать короткие теги PHP для поиска PHP блоков
"let php_noShortTags = 1

nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>l

nmap  <leader>s :make<cr>
vmap <leader>s <esc>:make<cr>i
imap <leader>s <esc>:make<cr>i

"Так как мы включили autoindent, то вставка текста с отступами (из буфера обмена X Window или screen) будет «глючить» — отсупы будут «съезжать». К счастью, это легко исправить — нажав Ctrl+U сразу после вставки.
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

"Надоело набирать chmod +x script.sh после создания нового скрипта? Пусть этим займётся Vim — все файлы, начинающиеся с !#/bin/sh или чего-то подобного автоматически будут сделаны исполняемыми:

function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction
"au BufWritePost * call ModeChange()

"map <S-tab> :tabprevious<cr>
"nmap <S-tab> :tabprevious<cr>
"imap <S-tab> <ESC>:tabprevious<cr>i
"map <C-tab> :tabnext<cr>
"nmap <C-tab> :tabnext<cr>
"imap <C-tab> <ESC>:tabnext<cr>i
"nmap <C-t> :tabnew<cr>
"imap <C-t> <ESC>:tabnew<cr>

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

"setlocal dictionary+=$HOME/.vim/phpdic/phpfunclist
setlocal dictionary+=$HOME/.vim/phpdic/funclist.txt
"setlocal dictionary+=$HOME/.vim/phpdic/phpproto

set runtimepath+=$HOME/.vim/phpdoc

map <C-Q> <Esc>:qa<cr>

" Автозавершение слов по tab =)
function InsertTabWrapper()
 let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
   return "\<tab>"
	else
 return "\<c-p>"
  endif
  endfunction
  imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
 set complete=""
"Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

"taglist settings
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_WinWidth = 35
let tlist_php_settings = 'php;c:class;f:Functions'
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Process_File_Always = 1
let Tlist_Show_One_File = 1 

"Включаем filetype плугин. Настройки, специфичные для определынных файлов
"мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.thtml set filetype=php
au BufRead,BufNewFile *.tpl set filetype=smarty 
au Filetype smarty exec('set dictionary=/home/dimon/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k 
imap <S-Space><S-Space> <C-X><C-K> 

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"
let g:snips_author = "Kostin Dmitrij"

colorscheme vibrantink

function! OpenPhpFunction (keyword)
 exe "12new"
 exe "silent read !$HOME/.vim/external/phpman ".substitute(a:keyword, "_", "-", "g")
 exe "set buftype=nofile bufhidden=delete filetype=php readonly"
 exe "1"
endfunction
autocmd FileType php map <buffer> K :call OpenPhpFunction('<C-r><C-w>')<CR>

function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=YMC '.l:filename)
"    echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction
set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()


