set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'mhinz/vim-signify'
Plugin 'Shougo/vimproc.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'godlygeek/tabular'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-clang'
Plugin 'zchee/deoplete-go'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'
Plugin 'arakashic/chromatica.nvim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kopischke/vim-fetch'
Plugin 'Konfekt/FastFold'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-markdown', { 'for': 'markdown' }
Plugin 'shime/vim-livedown', { 'for': 'markdown' }
Plugin 'rust-lang/rust.vim', { 'for': 'rust' }

call vundle#end()

filetype plugin indent on


" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let g:NERDTreeHijackNetrw=0
augroup luan_nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" ---------------
" ctrlp
" ---------------
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
let g:ctrlp_switch_buffer = '0'

let g:ctrlp_map = ''
nnoremap <C-p> :CtrlPCurWD<cr>
nnoremap <leader>f :CtrlPCurWD<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>F :CtrlPBufTag<cr>
nnoremap <leader>S :CtrlPTag<cr>
nnoremap <leader>L :CtrlPLine<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

function! s:define_user_command()
  let l:expr = '\.final_builds/*\|node_modules/*\|\.o$\|\.obj$\|\.exe$\|\.so$\'
  let l:expr = l:expr . '|\.dll$\|\.pyc$\|\.svn\|\.hg\|\.bzr\|\.git\|\.sass-cache\'
  let l:expr = l:expr . '|\.class\|\.scssc\|Godeps/*'

  " Set the user_command option
  if executable('ag')
    let g:ctrlp_use_caching = 0
    let l:cmd = 'ag %s -U -l --hidden --nocolor -g ""'
  else
    let l:cmd = 'find %s -type f'
  endif

  " Set the user_command option
  let g:ctrlp_user_command = has('win32') || has('win64')
        \ ? 'dir %s /-n /b /s /a-d | findstr /V /l "' . l:expr . '"'
        \ : l:cmd . ' | grep -v "'. l:expr .'"'
endfunction

call s:define_user_command()

" ---------------
" vim-signify
" ---------------
let g:signify_update_on_bufenter = 1
let g:signify_disable_by_default = 0

" ---------------
" tcomment
" ---------------
nmap <leader>ci :TComment<cr>
xmap <leader>ci :TComment<cr>

nmap <leader>/ :TComment<cr>
xmap <leader>/ :TComment<cr>

" ---------------
" vim-fugitive
" ---------------
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gg :Gbrowse<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gv :Gitv<cr>
nnoremap <leader>gpl :Git pull --rebase<cr>
nnoremap <leader>gps :Git push origin head<cr>

" ---------------
" ale
" ---------------
scriptencoding utf-8

nmap <silent> <C-S-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-S-j> <Plug>(ale_next_wrap)

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '➤'
let g:ale_sign_info = '➟'
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'gometalinter'],
\   'typescript': ['tsserver', 'typecheck'],
\   'javascript': ['eslint'],
\}

" Enable completion where available.
let g:ale_completion_enabled = 1

" ---------------
" deoplete
" ---------------

let g:deoplete#enable_at_startup = 1

" ---------------
" autoformat
" ---------------
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

let g:formatters_javascript = ['eslint_local']
let g:formatters_vue = ['eslint_local']

augroup luan_autoformat
  autocmd!
  autocmd BufWrite *.c,*.h,*.cpp,*.hpp,*.go,*.js,*.vue,*.rs :Autoformat
augroup END
