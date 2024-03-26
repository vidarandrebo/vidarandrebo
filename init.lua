vim.cmd([[
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

]])

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neoclide/coc.nvim', {['branch']= 'release'})

--.NET
Plug('prabirshrestha/asyncomplete.vim', {['for']='cs'})
Plug('OmniSharp/omnisharp-vim')

--Err"
Plug('dense-analysis/ale')

--Rust
Plug 'rust-lang/rust.vim'

Plug 'posva/vim-vue'

Plug('ayu-theme/ayu-vim') -- or other package manager"
Plug('navarasu/onedark.nvim')
Plug('preservim/nerdtree')
Plug('fatih/vim-go', { ['do']= ':GoUpdateBinaries' })
Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})

vim.call('plug#end')


vim.cmd([[
"Go"
let g:go_fmt_command = "gofumpt"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
autocmd BufWritePre *.go :silent! GoFmt

".NET"
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_want_snippet = 1

"Ale"
let g:ale_linters = {
            \'cs': ['OmniSharp'],
            \'go': ['vet', 'golint', 'typecheck']
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
            \'coc-rust-analyzer',
            \'coc-json',
            \'coc-go',
            \'coc-clangd',
            \'coc-pyright',
            \'coc-r-lsp',
            \'coc-clangd',
            \'@yaegassy/coc-volar',
            \'@yaegassy/coc-volar-tools',
            \]

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Rust"
let g:rustfmt_autosave = 1

"...
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let g:onedark_config = {
    \ 'style': 'darker',
\}
let ayucolor="dark"   " for dark version of theme
colorscheme onedark
"colorscheme ayu
]])

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  --ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
