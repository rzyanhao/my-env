" ========================================>>>> 开启256色 
set t_Co=256
" let $PYTHONHOME="/Users/yanhao/.pyenv/versions/2.7.10/bin"
" set pythonthreedll=/Users/yanhao/.pyenv/Versions/3.6.1/lib/libpython3.6m.a
" ========================================>>>> 修改leader
let mapleader = ','
" ====>>>> 根据文件类型加载不同插件
filetype plugin on

" ========================================>>>> 让配置变更立即生效
" autocmd BufWritePost ~/.vimrc source ~/.vimrc

" >>>>>>>>>>>>>>>>>>>>>>>>>>> 插件安装 <<<<<<<<<<<<<<<<<<<<<<<<<<<
"
" ========================================>>>> 文件类型检测
filetype off

" ========================================>>>> 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" ========================================>>>>>插件列表
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ========================================>>>>> 移动
Plugin 'easymotion/vim-easymotion'

" ========================================>>>>> 配色方案
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'joshdick/onedark.vim'
Plugin 'spf13/vim-colors'

" ========================================>>>>> 状态栏和主题美化
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'

" ========================================>>>> 高亮相关
" Plugin 'octol/vim-cpp-enhanced-highlight'                " ==== C++
" Plugin 'othree/yajs.vim'                                 " ==== Javascript ES5 & ES6
" Plugin 'sheerun/vim-polyglot'                            " ==== 大多数语言
" Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'othree/javascript-libraries-syntax.vim'          " ==== Javascript 框架库高亮
" Plugin 'mxw/vim-jsx'                                     " ==== Jsx
" Plugin 'chemzqm/vim-jsx-improve'
 " Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'hail2u/vim-css3-syntax'         		 " ==== css3, 支持less, scss
" Plugin 'cakebaker/scss-syntax.vim'                       " ==== 实时显示颜色
" Plugin 'chrisbra/Colorizer'
Plugin 'ap/vim-css-color'

" ========================================>>>> 注释
Plugin 'scrooloose/nerdcommenter'

" ========================================>>>> 补全
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'heracek/HTML-AutoCloseTag'
Plugin 'epilande/vim-react-snippets'


" ========================================>>>> 缩进
Plugin 'nathanaelkane/vim-indent-guides' 

" ========================================>>>> 文件操作相关
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mhinz/vim-signify'

" ========================================>>>> 前端插件
Plugin 'mattn/emmet-vim'
" Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'w0rp/ale'
Plugin 'docunext/closetag.vim'
Plugin 'matchit.zip'

" ========================================>>>> git
Plugin 'airblade/vim-gitgutter'
" ========================================>>>> 解决中文输入法无法输入命令问题 
Plugin 'ybian/smartim' 
Plugin 'tpope/vim-fugitive'

" ========================================>>>> 其他
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'mileszs/ack.vim'


call vundle#end()

" 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on



" >>>>>>>>>>>>>>>>>>> 主要配置 <<<<<<<<<<<<<<<<<<<<

" ========================================>>>> 配色主题
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" color solarized             " Load a colorscheme

colorscheme onedark

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

if has('gui_macvim')
    ""设置mac vim 背景
    set guifont=Andale\ Mono\ Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    set transparency=2
    ""不全屏为set nofu
    " set nofu
endif

" ========================================>>>>  营造专注气氛
" set gcr=a:block-blinkon0   " 禁止光标闪烁
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


" ========================================>>>> 辅助信息
set laststatus=2   " 总是显示状态栏
set ruler          " 显示光标当前位置
set number         " 开启行号显示
                   " 显示绝对行号      set number
                   " 取消显示绝对行号   set nonumber
                   " 显示相对行号       set relativenumber
                   " 取消显示相对行号   set norelativenumber

set cursorline    " 高亮显示当前 - 行
set cursorcolumn  " 高亮显示当前 - 列
set hlsearch      " 高亮显示搜索结果


" ========================================>>>> 语法分析
syntax enable
syntax on


" ========================================>>>> 缩进
filetype indent on  " 自适应不同语言的智能缩进
set expandtab       " 将制表符扩展为空格
set tabstop=4       " 设置编辑时制表符占用空格数
set shiftwidth=4    " 设置格式化时制表符占用空格数
set softtabstop=4   " 让 vim 把连续数量的空格视为一个制表符
set backspace=indent,eol,start
set autoindent

" ========================================>>>> 代码折叠
set foldmethod=indent   " 基于缩进或语法进行代码折叠 
                        " 手动建立折叠（manual）、
                        " 基于缩进进行折叠（indent）、
                        " 基于语法进行折叠（syntax）、
                        " 未更改文本构成折叠（diff）等等，
set nofoldenable       " 启动 vim 时关闭折叠代码


" ========================================>>>> 其他配置

" ack 配置
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
nnoremap <Leader>a :Ack!<Space>
" select all
map <Leader><Leader>a ggVG

set encoding=utf-8
set incsearch       " 开启实时搜索功能
set ignorecase      " 搜索时大小写不敏感
set nocompatible    " 关闭兼容模式
"set wildmenu        " vim 自身命令行模式智能补全
set mouse=a         " 设置鼠标滚动
set nowrap
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" 方便在窗间移动
" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_
" map <C-L> <C-W>l<C-W>_
" map <C-H> <C-W>h<C-W>_

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" ariline
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
" easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" map <Leader><leader>h <Plug>(easymotion-linebackward)
" map <Leader><Leader>j <Plug>(easymotion-j)
" map <Leader><Leader>k <Plug>(easymotion-k)
" map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
" map <Leader><leader>. <Plug>(easymotion-repeat)

" map <Leader> <Plug>(easymotion-prefix)
" map <leader>h <Plug>(easymotion-linebackward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
" map <leader>. <Plug>(easymotion-repeat)
"
map s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 使用系统粘贴板
set clipboard=unnamed
" ========================================>>>> 处理未保存或只读文件时弹出确认
set confirm


" =======================================>>>> 插件配置
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}
" let g:syntastic_javascript_checkers = ['eslint']
" let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
" let g:formatters_javascript = ['eslint']

" ****** javascript-libraries-syntax配置 ***** 
let g:used_javascript_libs = 'jquery,react,vue'

" autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0
" ********************************************


" ************ nerdcommenter配置 ************* 
" " 在注释符默认添加空格
let g:NERDSpaceDelims = 1
" 使用紧凑语法美化多行注释
let g:NERDCompactSexyComs = 1
" 将行注释符左对齐而不是下面的代码缩进
let g:NERDDefaultAlign = 'left'
" 设置语言默认使用备用定界符
let g:NERDAltDelims_java = 1
" 添加自定义格式或覆盖默认值。
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" 允许注释和转换空行（注释区域时有用）
let g:NERDCommentEmptyLines = 1
" 启用时修整尾随空格注释
let g:NERDTrimTrailingWhitespace = 1
" ********************************************


" ************ YouCompleteMe配置 ************* 
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=1

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1"

let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/Users/yanhao/.pyenv/shims/python'
" ********************************************


" ************* UltiSnips配置 **************** 
" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
" let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:acp_enableAtStartup = 0
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
" set completeopt-=preview
" ********************************************


" ********** vim-indent-guides配置 *************
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 自定义关联可视化 颜色
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" *********************************************


" *************** nerdtree配置 ****************
map <C-e> <plug>NERDTreeTabsToggle<CR>
" map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" 设置 NERDTree 子窗口宽度
" let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
" let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
" let NERDTreeAutoDeleteBuffer=1

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDShutUp=1
" *********************************************
hi Visual cterm=bold ctermbg=Blue ctermfg=NONE

" ************* minibufexpl配置 ***************
" 显示/隐藏 MiniBufExplorer 窗口
" map <Leader>bl :MBEToggle<cr>
"
" " buffer 切换快捷键
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>
" nnoremap <Leader>bn :MBEbn<cr>  " 正向遍历 buffer
" nnoremap <Leader>bp :MBEbp<cr>  " 逆向遍历（光标必须在 buffer 列表子窗口外）
" nnoremap <Leader>bd :MBEbd<cr>  " 关闭当前buffer（光标必须在 buffer 列表子窗口外）
" nnoremap <Leader>bb :b#<cr>     " 你之前所在的前一个 buffer）
" *********************************************






"  if has('gui_running')
"     set guioptions-=T           " Remove the toolbar
"     set lines=40                " 40 lines of text instead of 24
"     set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
" else
"     if &term == 'xterm' || &term == 'screen'
"         set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
"     endif
" endif
"
" function! InitializeDirectories()
"     let parent = $HOME
"     let prefix = 'vim'
"     let dir_list = {
"                 \ 'backup': 'backupdir',
"                 \ 'views': 'viewdir',
"                 \ 'swap': 'directory' }
"
"     if has('persistent_undo')
"         let dir_list['undo'] = 'undodir'
"     endif
"
"     let common_dir = parent . '/.' . prefix
"
"     for [dirname, settingname] in items(dir_list)
"         let directory = common_dir . dirname . '/'
"         if exists("*mkdir")
"             if !isdirectory(directory)
"                 call mkdir(directory)
"             endif
"         endif
"         if !isdirectory(directory)
"             echo "Warning: Unable to create backup directory: " . directory
"             echo "Try: mkdir -p " . directory
"         else
"             let directory = substitute(directory, " ", "\\\\ ", "g")
"             exec "set " . settingname . "=" . directory
"         endif
"     endfor
" endfunction
" call InitializeDirectories()
" function! NERDTreeInitAsNeeded()
"     redir => bufoutput
"     buffers!
"     redir END
"     let idx = stridx(bufoutput, "NERD_tree")
"     if idx > -1
"         NERDTreeMirror
"         NERDTreeFind
"         wincmd l
"     endif
" endfunction
" call InitializeDirectories()
