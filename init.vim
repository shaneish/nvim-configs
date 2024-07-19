"
" Plug-ish ish
"
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'MunifTanjim/nui.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-signify'
Plug 'm4xshen/autoclose.nvim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'hashivim/vim-terraform'
Plug 'ThePrimeagen/harpoon'
Plug 'samoshkin/vim-mergetool'
Plug 'rlane/pounce.nvim'
Plug 'ggandor/leap.nvim'
Plug 'booperlv/nvim-gomove'
Plug 'ellisonleao/glow.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'cameron-wags/rainbow_csv.nvim'
Plug 'hat0uma/csvview.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'duane9/nvim-rg'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'github/copilot.vim'
Plug 'UnsafeOats/oatjump.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'chentoast/marks.nvim'
Plug 'ziglang/zig.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tjdevries/colorbuddy.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'oatish/smartcolumn.nvim'
Plug 'hardselius/warlock'
Plug 'akinsho/bufferline.nvim'
call plug#end()

filetype plugin indent on
syntax on
filetype plugin on
let mapleader=";"

"
" Lua-ish ish
"
lua << EOF
servers = { "terraformls", "pyright", "lua_ls" }
require('treesitter-config')
require('nvim-cmp-config')
require('lspconfig-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('diagnostics')
require('telescope').load_extension('harpoon')
require("autoclose").setup({
   keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },
      [">"] = { escape = true, close = false, pair = "<>" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },
      ['"'] = { escape = true, close = true, pair = '""' },
      ["'"] = { escape = true, close = true, pair = "''" },
      ["`"] = { escape = true, close = true, pair = "``" },
   },
   options = {
      disabled_filetypes = { },
      disable_when_touch = true,
      touch_regex = "[%w(%[{]",
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = false,
   },
})
require("rust-tools").setup({
  tools = {
      inlay_hints = {
        highlight = "RustHints",
      },
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>a", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<C-space>A", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
require("gomove").setup({
  -- whether or not to map default key bindings, (true/false)
  map_defaults = true,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
})
require('glow').setup({
    width = 120,
    height = 140,
    install_path = '/usr/bin/glow'
})
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup {
    ensure_installed = { "lua_ls", "zls", "pyright", "tflint", "terraformls" },
}
-- require('lsp-zero').preset('recommended').setup()
require('leap').add_default_mappings()
require('csvview').setup()
-- csvview:
--  + ON - :CsvViewEnable
--  + OFF - :CsvViewDisable
require('rainbow_csv').setup()
-- rainbow_csv:
--  + ON - :RainbowDelim
--  + ALIGN - :RainbowAlign
--  + UNALIGN - :RainbowShrink
--  + LINT - :CSVLint
--  + QUERY - :Select [a1, a1 order by a1 desc]
--  + MANIPULATE COLUMNS - :Update [a1 = a1 + "_" + a2]
require('marks').setup({
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
      sign = "⚑",
      virt_text = "hello world",
      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
      -- defaults to false.
      annotate = false,
  },
  mappings = {}
})
require('oatjump').setup()
require("smartcolumn").setup({
    colorcolumn = 140
})
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline, it's very annoying
        underline = false
        })
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<c-space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<c-space>q', vim.diagnostic.setloclist, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<c-space>D', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<c-space>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<c-space>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<c-space>i', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<c-space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<c-space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<c-space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<c-space>td', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<c-space>R', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<c-space>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<c-space>r', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<c-space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
EOF

"
" #functions ish
"

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" CSV-ish stuff
let s:mappingsState=1
command! TM call ToggleMappings()
function! ToggleMappings()
    if s:mappingsState
        :CsvViewEnable
    else
        :CsvViewDisable
    endif
    let s:mappingsState = !s:mappingsState
endfunction
" Terminal-ish stuff
let g:term_proportion_default = 2.5
function! OpenTermSize()
    let current_window_size = (line('w$') - line('w0')) / g:term_proportion_default
    return current_window_size
endfunction

"
" #variables ish
"

" #settings ish"
set linespace=10
set mouse=a
set nocompatible
set showmatch
set expandtab
set autoindent
set number
set cursorline
set ttyfast
set backupdir=~/.config/nvim/nvim-temp
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set title
set matchpairs+=<:>
set iskeyword-=_
set swapfile
set termguicolors
set guifont=JetBrains\ Mono\ 13
set fillchars+=vert:\│
set completeopt=menu,menuone,noselect
set shell=/Users/h62756/.cargo/bin/nu

" #globalvars ish
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 0
let g:conceallevel = 0
let g:python3_host_prog = '~/.config/nvim/venv/bin/python3'
let g:pydocstring_enable_mapping = 0
let g:copilot_no_tab_map = v:true
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 0
let g:conceallevel = 0
let g:cursorhold_updatetime = 100
let g:context_nvim_no_redraw = 1
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
let g:rbql_with_headers = 1
let g:terraform_fmt_on_save = 1
let g:terraform_align = 1

" #autcmd ish
autocmd BufRead,BufNewFile *.hcl set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
autocmd BufWritePre *.tf lua vim.lsp.buf.format()
autocmd BufRead,BufNewFile *.csv.txt set filetype=csv
autocmd BufRead,BufNewFile *.tsv.txt set filetype=tsv
autocmd FileType csv nmap <C-f> :call ToggleMappings()<CR>
autocmd FileType tsv nmap <C-f> :call ToggleMappings()<CR>
autocmd FileType python nmap <C-f> :Black<CR>
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType md nmap <C-f> :set conceallevel=0<CR>
autocmd FileType json nmap <C-f> :set conceallevel=0<CR>
autocmd FileType text nmap <C-f> :set conceallevel=0<CR>

" #colorscheme ish
" colorscheme zenwritten
colorscheme warlock

" #highlight ish
highlight link TSError Normal
highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
highlight Normal guibg=NONE ctermbg=NONE
highlight Error guibg=NONE ctermbg=NONE
highlight Comment guifg=#b9d2da
highlight LineNr guifg=#e9f0fd
highlight RustHints guifg=#44a6c6
highlight DiffDelete guifg=#ff5555 guibg=none
highlight ColorColumn guifg=#7e9198

" Weird leader stuff
nmap <space> <leader>
nmap <space><space> <leader><leader>
xmap <space> <leader>
xmap <space><space> <leader><leader>

" Copilot
imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
imap <silent><script><expr> <M-tab> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
imap <C-]> <Plug>(copilot-next)
imap <C-[> <Plug>(copilot-previous)
imap <C-e> <Plug>(copilot-dismiss)
imap <C-s> <Plug>(copilot-suggest)

" Terminal
tmap kj <C-\><C-n>
tmap <C-d> kj:q<CR>
tmap <C-t> <Esc><cmd>bd!<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
nmap <expr> <C-t> ":botright terminal<CR>:resize " . OpenTermSize() . "<CR>i"
xmap <expr> <C-t> ":botright terminal<CR>:resize " . OpenTermSize() . "<CR>i"


" Core
nmap \ :NvimTreeFindFileToggle<CR>:set relativenumber<CR>:set nowrap<CR>
nmap <leader><leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader><leader>t :call TrimWhitespace()<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <leader><leader>d <cmd>silent! bd!<CR>
nmap <C-d> <cmd>silent! bd!<CR>
nmap <leader><leader>w <cmd>w<CR>
nmap <leader><leader>q <cmd>q!<CR>
nmap <leader><leader>s <cmd>w!<CR><cmd>q!<CR>
nmap <C-space>n :cnext<CR>
nmap <C-space>N :cprevious<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
noremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>gm <cmd>MergetoolToggle<CR>
nnoremap <leader>hm <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>h] <cmd>lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>h[ <cmd>lua require("harpoon.ui").nav_prev()<CR>
nnoremap <leader>h1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>hf <cmd>Telescope harpoon marks<CR>

"Normal remaps
nnoremap <leader>k g_
nnoremap <leader>j _
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap y "0y
nnoremap P "0P
nnoremap p "0p
nnoremap d "1d
nnoremap x "_x
nnoremap <C-p> "1p
nnoremap <leader><C-p> "1P
nnoremap R s
nnoremap <C-s> <cmd>Pounce<CR>
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
nnoremap j jzz
nnoremap k kzz
nnoremap n nzz
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-space>j o<Esc>_C<Esc>
nnoremap <C-space>k O<Esc>_C<Esc>
nnoremap <C-d> :bd!<CR>
nnoremap <C-m>ls :MarksListBuf<CR>
nnoremap <C-m>la :MarksListGlobal<CR>
nmap <C-f> :set conceallevel=0<CR>
nmap <c-.> <C-W>l
nmap <c-,> <C-W>h

" Insert remaps
inoremap kj <Esc>
inoremap <leader><leader> <Esc>
inoremap <C-space><C-space> <Esc>la
inoremap <C-space>x <Esc>lxa
inoremap <C-space>l <Esc>A
inoremap <C-space>h <Esc>I
inoremap <C-space>j <Esc>o<Esc>_C
inoremap <C-space>k <Esc>O<Esc>_C
inoremap <C-d> <cmd>silent! bd!<CR>

" Visual remaps
xnoremap < <gv
xnoremap > >gv
xnoremap <leader>k g_
xnoremap <leader>j _
xnoremap <C-j> <C-d>zz
xnoremap <C-k> <C-u>zz
xnoremap j jzz
xnoremap k kzz
xnoremap <leader>y "+y
xnoremap <leader>yy "+yy
xnoremap <leader>Y "+yg_
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xnoremap y "0y
xnoremap p "0p
xnoremap d "1d
xnoremap x "_x
xnoremap <C-p> "1p
xnoremap <leader><C-p> "1P
xnoremap <C-d> <cmd>silent! bd!<CR>
xnoremap <expr> j  mode() ==# "v" ? "j$" : "j"
xnoremap <expr> <C-j> mode() ==# "v" ? "<C-d>$"  : "<C-d>"
xnoremap <expr> k  mode() ==# "v" ? "k$" : "k"
xnoremap <expr> <C-k> mode() ==# "v" ? "<C-u>$"  : "<C-u>"
