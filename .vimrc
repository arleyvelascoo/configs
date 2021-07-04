set number
set clipboard=unnamedplus
set mouse=a
set numberwidth=1
syntax on
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode


call plug#begin('~/.vim/plugged')
" test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'
"Syntax
Plug 'sheerun/vim-polyglot'

"Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" IDE
Plug 'christoomey/vim-tmux-navigator'

" EasyMotion
Plug 'easymotion/vim-easymotion'
"NerdTree
Plug 'scrooloose/nerdtree'

"Code of Conquer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"AutoCOmplete
"Plug 'sirver/ultisnips'

"Indent
Plug 'yggdroot/indentline'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'

"Java Highlighting
Plug 'uiiaoo/java-syntax.vim'

call plug#end()


"let g:lsc_server_commands = {'java': '<path-to-java-language-server>/java-language-server/dist/lang_server_{linux|mac|windows}.sh'}

"Disable java highlighting
highlight link javaIdentifier NONE
highlight link javaDelimiter NONE

"let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox


let NERDTreeQuitOnOpen=1
"Tecla lider
let mapleader = " "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

nmap <Leader>// :noh<CR>

nmap <Leader>fs :Files<CR>

" For tabs
nmap <Leader>n :tabn<CR>
nmap <Leader>p :tabp<CR>

" Resize split window
nmap <C-y> :vertical resize -5<CR>
nmap <C-p> :vertical resize +5<CR>
nmap <C-u> :res -5<CR>
nmap <C-i> :res +5<CR>


" -------------------- COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

nmap <Leader>rnm <Plug>(coc-rename)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
