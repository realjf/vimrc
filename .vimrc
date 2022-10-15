syntax on
set nocompatible
filetype plugin indent on

" Indent using four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab smarttab

" Autoindent when starting new line
set autoindent
set smartindent
set lazyredraw

" Ignore case when searching
" set ignorecase 

" Don't ignore case when search has capital letter
" set smartcase

" Enable highlighted case-insensitive incremential search
" set incsearch

" Enble search highlighting
set hlsearch

set title
set number
set encoding=UTF-8
set autochdir
set nowrap
" set relativenumber
" Store lots of :cmdline history
set history=5000

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Always show window statuses
set laststatus=2

" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" 指定插件目录
call plug#begin('~/.vim/plugged')

" Colors
" Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tomasr/molokai'
" Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'


" Editing
Plug 'matze/vim-move'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Plug 'sjl/gundo.vim'
" SirVer/ultisnips
Plug 'junegunn/vim-easy-align'
" Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'rhysd/git-messenger.vim'


" Buffer
Plug 'vim-airline/vim-airline'
" Plug 'fholgado/minibufexpl.vim'
Plug 'jlanzarotta/bufexplorer'


" Navigation
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'tpope/vim-fugitive' " help switching between companion files (e.g. '.h' and '.cpp' files)
Plug 'dyng/ctrlsf.vim'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'christoomey/vim-tmux-navigator'



" View
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status flags
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-buffer-ops' " 突出显示打开的节点
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Plug 'tsony-tsonev/nerdtree-git-plugin'



" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go语言支持, :GoInstallBinaries go install安装所有必要的程序
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" debugger
" Plug 'puremourning/vimspector' 



" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'



" Initialize plugin system
call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /usr/share/java/google-java-format-1.15.0-all-deps.jar"


" ----------------------------------------------------------------------------
" mappings，具体可见:https://learnvimscriptthehardway.stevelosh.com/chapters/05.html
" ----------------------------------------------------------------------------
let mapleader=',' " 设置<leader>为,
" <leader>是mapleader的表示方式，这意味着您可以选择一个您不关心的键（如 -）作为“前缀”键并在其上创建映射。这意味着您必须键入一个额外的键来激活映射，但是一个额外的击键很容易被肌肉记忆吸收
" let maplocalleader='\\' " 设置<localleader>为\
"
" map: 基础映射快捷键, map命令使按键在正常模式下工作
"
" nmap,vmap,imap: 模态映射快捷键, 这些告诉 Vim 只在正常、可视或插入模式下使用映射（递归调用映射）
" vnoremap,inoremap,nnoremap: 非递归映射模态下快捷键
" 
" nunmap <快捷键> : 删除快捷键
" 
" <esc>
" <nop>: 设置为空
" <silent>: 不输出在命令行中
" 


" ----------------------------------------------------------------------------
" choose theme and font
" ----------------------------------------------------------------------------

set termguicolors
colorscheme gruvbox
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

" Highlight line under cursor
set cursorline
set cursorcolumn


" Show the line and column number of the cursor position
set ruler





" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
" <leader>默认是\，<cr>是回车
" Edit myvimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Save
inoremap <C-s>     <C-O>:w<cr>
nnoremap <C-s>     :w<cr>
nnoremap <leader>w :w<cr>

" Copy
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" Quit
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a
inoremap <C-^> <C-o><C-^>


inoremap jk <Esc> " switching back to normal mode
" going to the end and the beginning of a line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" <nop> means that the $ and ^ are no longer bound to anything

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>


" fullscreen
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endfunction

map <silent> <F11> :call ToggleFullscreen()<CR>
imap <silent> <F11> <esc>:call ToggleFullscreen()<CR>
" autocmd VimEnter * call ToggleFullscreen()



" ----------------------------------------------------------------------------
" window split
" ----------------------------------------------------------------------------
" split resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 1/10)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 1/10)<CR>

" Splits Movement
nnoremap <silent> <Leader>wr <C-w>r<CR> " rotate to the right
nnoremap <silent> <Leader>wH <C-w>H<CR> " move to the left
nnoremap <silent> <Leader>wJ <C-w>J<CR> " move to the bottom
nnoremap <silent> <Leader>wK <C-w>K<CR> " move to the top
nnoremap <silent> <Leader>wL <C-w>L<CR> " move to the right
nnoremap <silent> <Leader>wT <C-w>T<CR> " (`:tab split`) move split to new tab


" Close Split
nmap <silent> <Leader>wc :close<CR> " close split
nmap <silent> <Leader>wq :q<CR> " close split and quit file
nmap <silent> <Leader>wo :only<CR> " close all other splits




" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------

nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz


" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>lw <C-W>l

" ----------------------------------------------------------------------------
" vim-multiple-cursors
" ----------------------------------------------------------------------------

let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" ----------------------------------------------------------------------------
" vim-move
" ----------------------------------------------------------------------------

" <C-k>   Move current line/selections up
" <C-j>   Move current line/selections down
let g:move_key_modifier = 'C'

" <S-k>   Move currently selected block up
" <S-j>   Move currently selected block down
" let g:move_key_modifier_visualmode = 'S'

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" wildfire.vim
" ----------------------------------------------------------------------------

map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)


" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------

let g:indentLine_char = '│'


" ----------------------------------------------------------------------------
" vim-fswitch
" ----------------------------------------------------------------------------

nmap <silent> <Leader>fs :FSHere<cr>

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1


" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------




" ----------------------------------------------------------------------------
" git-messenger
" ----------------------------------------------------------------------------

nmap <Leader>gm <Plug>(git-messenger)
let g:git_messenger_include_diff="all"
let g:git_messenger_always_into_popup=v:true
let g:git_messenger_preview_mods="botright"

" Normal color in popup window with 'CursorLine'
hi link gitmessengerPopupNormal CursorLine

" Header such as 'Commit:', 'Author:' with 'Statement' highlight group
hi link gitmessengerHeader Statement

" Commit hash at 'Commit:' header with 'Special' highlight group
hi link gitmessengerHash Special

" History number at 'History:' header with 'Title' highlight group
hi link gitmessengerHistory Title



function! s:setup_git_messenger_popup() abort
    " Your favorite configuration here

    " For example, set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:false


" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <C-b> <Esc>:NERDTreeToggle<CR> " ctrl+b
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeWinSize=50
let g:NERDTreeWinPos="left"
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0  
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusGitBinPath = '/usr/bin/git' " default: git (auto find in path)
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0  

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
                
 

" ----------------------------------------------------------------------------
" vim-instant-markdown
" ----------------------------------------------------------------------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Uncomment to override defaults:
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

nnoremap <Leader>md :InstantMarkdownPreview<CR>


" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
" :Git add
" :Git commit
" :Git rebase -i
" :Git diff 对比文件
" :Git log 查看git日志
" :Git --paginate,:Git -p
" :Git blame 使用带有地图的临时缓冲区进行额外的分类
" :Git mergetool 将他们的变更集加载到快速修复列表中
" :Git difftool 将他们的变更集加载到快速修复列表中
" 
"
"

" ----------------------------------------------------------------------------
" vimdiff
" ----------------------------------------------------------------------------
" do 从其他窗口获取更改到当前窗口
" dp 将当前窗口的更改放入另一个窗口
" ]c 跳转到后一个修改
" [c 跳转到前一个修改
" zo 打开目录
" zc 关闭目录
" zr 降低折叠水平
" zm 请再折叠一层
" :diffupdate,:diffu 重新计算差异
" :diffg RE 从REMOTE获取文件对比
" :diffg BA 从BASE获取文件对比
" :diffg LO 从LOCAL获取文件对比
"
"
"


" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


let g:gitgutter_terminal_reports_focus=1

" This path probably won't work
let g:gitgutter_git_executable = '/usr/bin/git'

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

command! Gqf GitGutterQuickFix | copen

set foldtext=gitgutter#fold#foldtext()


highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1



" ----------------------------------------------------------------------------
" bufexplorer
" ----------------------------------------------------------------------------





" ----------------------------------------------------------------------------
" minibufexpl
" ----------------------------------------------------------------------------

" inoremap <F4> <esc>:MBEToggle<cr>
" nnoremap <F4> :MBEToggle<cr>


" nnoremap ]b :bnext<cr>
" nnoremap [b :bprev<cr>


" MiniBufExpl Colors
" hi MBENormal               guifg=#808080 guibg=fg
" hi MBEChanged              guifg=#CD5907 guibg=fg
" hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
" hi MBEVisibleChanged       guifg=#F1266F guibg=fg
" hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
" hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"
"delete the buffer; keep windows
"
"function Kwbd(kwbdStage)
"    if(a:kwbdStage == 1)
"        let g:kwbdBufNum = bufnr("%")
"        let g:kwbdWinNum = winnr()
"        windo call Kwbd(2)
"        execute "bd! " . g:kwbdBufNum
"        execute "normal " . g:kwbdWinNum . ""
"    else
"        if(bufnr("%") == g:kwbdBufNum)
"            let prevbufvar = bufnr("#")
"            if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
"                b #
"            else
"                bn
"            endif
"        endif
"    endif
" endfunction

" close buffer
" imap <S-F4> <Esc>:call Kwbd(1)<CR>
" nmap <S-F4> :call Kwbd(1)<CR>


" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'v[/].(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\   'dir':  'v[/].(git|hg|svn|vendor/bundle/*|vendor/cache/*|public|spec)$',
\   'file': 'v.(exe|so|dll|swp|log|jpg|png|json)$'
\}


" ----------------------------------------------------------------------------
" coc.nvim
" ----------------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')




" ----------------------------------------------------------------------------
" 自动格式化文件 
" ----------------------------------------------------------------------------

augroup autoformat_settings
  autocmd!
  " Start NERDTree and leave the cursor in it.
  " autocmd VimEnter * NERDTree
  
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType swift AutoFormatBuffer swift-format
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  " autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

  " Close the tab if NERDTree is the only window remaining in it.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    
  " Open the existing NERDTree on each new tab.
  " autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END



" ----------------------------------------------------------------------------
" vim-go
" ----------------------------------------------------------------------------


" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Show the function signature for a given routine with \ + i
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
" Show the interfaces a type implements with \ + ii
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
" Describe the definition of a given type with \ + ci
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
" See the callers of a given function with \ + cc
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
" Find all references of a given type/function in the codebase with \ + cr
nmap <leader>cr <Plug>(coc-references)
" Go to definition/Go back with Ctrl+d and Ctrl+a
nmap <C-a> <C-o>
nmap <C-d> <Plug>(coc-definition)


" ----------------------------------------------------------------------------
" vim-easy-align
" ----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)          

