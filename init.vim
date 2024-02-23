set number
set relativenumber
nnoremap JJ <C-W>j
nnoremap KK <C-W>k
nnoremap HH <C-W>h
nnoremap LL <C-W>l
inoremap øø {
inoremap ææ }
inoremap ØØ [
inoremap ÆÆ ]
inoremap åå {}
inoremap ÅÅ ()
nnoremap == <C-W>=
nnoremap <silent> ^ :resize +2<CR>
nnoremap <silent> ** :resize -2<CR>
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set wrap linebreak
set title
set signcolumn=number

filetype off
set nocompatible
filetype plugin indent on
syntax enable

call plug#begin()

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

".NET".
"Plug 'prabirshrestha/asyncomplete.vim', {'for':'cs'}
Plug 'OmniSharp/omnisharp-vim'

"Err"
Plug 'dense-analysis/ale'

"Rust"
Plug 'rust-lang/rust.vim'

Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'olimorris/onedarkpro.nvim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

let g:go_fmt_command = "goimports"

autocmd BufWritePre *.go :silent! GoFmt

".NET"
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_want_snippet = 1

"Ale"
let g:ale_linters = {
            \'cs': ['OmniSharp']
            \}

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
map <silent> <C-n> :NERDTreeFocus<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-go',
            \'coc-rust-analyzer',
            \'coc-json',
            \'coc-pyright',
            \'coc-r-lsp',
            \'coc-clangd',
            \'coc-vue'
            \]

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Rust"
let g:rustfmt_autosave = 1

"...
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
"colorscheme onedark_vivid
colorscheme ayu
