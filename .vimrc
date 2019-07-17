
set nocompatible              " be iMproved, required
syntax enable
so ~/.vim/plugins.vim

set number
set modifiable
set backspace=indent,eol,start										"make backspace like another text editor."
set showmode
set tabstop=8
set expandtab
set showtabline=1
set laststatus=0
"set statusline=0
"set tabline=0
set softtabstop=4
set shiftwidth=4
set linespace=11											"set linespace but this work only for gui vim"
"set noshowmode
set cursorline
set noswapfile
let mapleader = ','											"The default leader is \, but a comma is much better.
let g:phpcd_php_cli_executable = 'php7.0'
let g:mta_use_matchparen_group = 1
let g:mta_set_default_matchtag_color = 1

"---------------------------visuals---------------------------"
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
let g:material_theme_style = 'dark'
set background=dark
"let g:airline_theme = 'dracula'
set t_CO=256
syntax on
colorscheme dracula
set guifont=Hasklig\ Semibold\ Italic
" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=L

set foldcolumn=0 


"---------------------------searching---------------------------"
set hlsearch 
set incsearch


"---------------------------mappings----------------------------"
nmap <leader>ev :tabedit ~/.vimrc<cr>
nmap <leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <leader>es :tabedit ~/.vim/snippets/php.snippets<cr>
nmap <leader>q :q <cr>
nmap <leader>vs :vs <cr>
nmap <leader>b :buffers <cr>
nmap <leader>bd :bd <C-A> <cr>
nmap gl :!gl <C-A> <cr>
nmap <leader><space> :nohlsearch<cr>

nmap <C-\> :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <leader>s :w<cr>
imap <C>: :<cr>
nmap <c-E> :CtrlPMRUFiles<cr>
map <C-C> :s:^:\/\/<CR>
map <C-T> :s:^\/\/<CR>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
"----- Make Myself Learn Vim -----
nnoremap <left> :echoe "Use h"<cr>
nnoremap <right> :echoe "Use l"<cr>
nnoremap <up> :echoe "Use k"<cr>
nnoremap <down> :echoe "Use j"<cr>

"------------------------plugins-----------------------------------"
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }
"/
"/ctrl-p
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
"/
"PHP Companion
"/
let g:vim_php_use_sort='alpha'
"/
"/NerdTree
"/
let NERDTreeHijackNetrw = 0
"/
"/
"/NerdTreeComment
"/
"/
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"/
"/
"/auto save
"/
"/
"/vim
"/
let g:user_emmet_install_global = 1
autocmd FileType html,css,php,vue EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'


" .vimrc
let g:auto_save = 1  " enable AutoSave on Vim startup

"---------------------------laravel-specific---------------------------"
nmap <leader>lr :e app/Http/routes.php<cr>

"---------------------------set auto command----------------------------"
augroup autosourcing
	autocm!
	autocmd BufWritePost .vimrc source %
augroup END


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>e :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>w <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>m :call PhpExpandClass()<CR>

if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

vmap <leader>su ! awk '{print length(), $0 \| "sort -n \| cut -d \" \" -f2-" }'<cr>
