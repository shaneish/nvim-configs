"
" plug-ish ish
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
Plug 'muniftanjim/nui.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'daisuzu/autorepeat.vim'
Plug 'mhinz/vim-signify'
Plug 'oatish/autoclose.nvim'
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
Plug 'mikesmithgh/kitty-scrollback.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jbyuki/venn.nvim'
Plug 'pappasam/nvim-repl'
call plug#end()

filetype plugin indent on
syntax on
filetype plugin on
let mapleader=" "
set termguicolors

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
   options = {
      disabled_filetypes = { "text" },
      disable_when_touch = false,
      touch_regex = "[%w(%[{]",
      bidirectional_disable_when_touch = true,
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = false,
   },
disabled = false,
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
  map_defaults = false,
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
require('kitty-scrollback').setup()
require('colorizer').setup()
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
  vim.keymap.set('n', '<c-space>H', vim.lsp.buf.hover, bufopts)
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

" Centerizer
let s:centerize=1
function! Centerizer()
    if s:centerize
        return "zz"
    else
        return ""
    endif
endfunction


function! ToggleCenterizer()
  let s:centerize = !s:centerize
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
let g:term_lines_to_resize = 40
let g:term_default_window_size = 20
function! OpenTermSize()
    let current_window_size = line('w$') - line('w0')
    if current_window_size < g:term_lines_to_resize
        return g:term_default_window_size
    endif
    let new_term_window_size = current_window_size / g:term_proportion_default
    return new_term_window_size
endfunction

let g:venn_enabled = 0
function! Toggle_Venn()
    if g:venn_enabled
        let g:venn_enabled = 0
        set ve=
    else
        set ve=all
        let g:venn_enabled = 1
    endif
endfunction

let g:is_databricks_notebook = 0
function! ToggleDatabricksNotebook()
    if g:is_databricks_notebook == 1
        let g:is_databricks_notebook = 0
    else
        let g:is_databricks_notebook = 1
    endif
endfunction

let g:code_type_suffix_mapping = {"python": " python", "sql": " sql", "rust": " rust", "r": " r", "rmarkdown": "{r}", "scala": " scala", "vim": " vim", "lua": " lua", "sh": " sh"}
let g:code_type_comment_mapping = {"python": "#", "sql": "--", "rust": "//", "r": "#", "rmarkdown": "```", "markdown": "```", "md": "```", "scala": "//", "vim": '"', "lua": "--", "sh": "#"}
let g:filetypes_with_code_block_type_identifiers = ["md", "markdown", "rmarkdown", "rmd", "journal"]
let g:code_block_identifier = "```"
let g:infer_default_code_block = 1
let g:infer_default_code_block_identifiers = 1
let g:append_text_code_block = ""
let g:append_code_block_suffix = ""
let g:default_code_block_suffix = "%%"
function! CodeBlockIdentifier(append=0)
    let out = g:code_block_identifier
    echom "1st" . out
    if g:infer_default_code_block == 1
        if has_key(g:code_type_comment_mapping, &filetype) == 1
            let out = g:code_type_comment_mapping[&filetype]
            echom "2nd" . out
        endif
    endif
    if g:is_databricks_notebook == 1
        echom "3rd" . out . " COMMAND ----------"
        return out . " COMMAND ----------"
    endif
    if a:append == 1
        if index(g:filetypes_with_code_block_type_identifiers, &filetype) >= 0
            if has_key(g:code_type_suffix_mapping, g:append_text_code_block) == 1
                echom "4th" . out . g:code_type_suffix_mapping[g:append_text_code_block]
                return out . g:code_type_suffix_mapping[g:append_text_code_block]
            endif
        else
            echom "5th" . out . " " . g:default_code_block_suffix
            return out . " " . g:default_code_block_suffix
        endif
    elseif index(g:filetypes_with_code_block_type_identifiers, &filetype) < 0
        echom "6th" . out . " " . g:default_code_block_suffix
        return out . " " . g:default_code_block_suffix
    endif
    echom "7th" . out
    return out
endfunction

function! SetCodeBlockIdentifier(separator="")
    if a:separator == ""
        let g:code_block_identifier = input("Enter the code block identifier: ")
    else
        let g:code_block_identifier = a:separator
    endif
    let g:infer_default_code_block = 0
endfunction

function! ToggleInferDefaultCodeBlock()
    if g:infer_default_code_block == 1
        let g:infer_default_code_block = 0
    else
        let g:infer_default_code_block = 1
    endif
endfunction

function! EchoToggleAppendCodeBlock()
    echom "Current code block identification text: " . g:append_text_code_block . " and current filetype: " . &filetype
endfunction

function! ToggleDefaultCodeBlock()
    if g:append_text_code_block == ""
        let g:append_text_code_block = "python"
    elseif g:append_text_code_block == "python"
        let g:append_text_code_block = "sql"
    elseif g:append_text_code_block == "sql"
        let g:append_text_code_block = "rust"
    elseif g:append_text_code_block == "rust"
        let g:append_text_code_block = "r"
    elseif g:append_text_code_block == "r"
        let g:append_text_code_block = "rmarkdown"
    elseif g:append_text_code_block == "rmarkdown"
        let g:append_text_code_block = "scala"
    elseif g:append_text_code_block == "scala"
        let g:append_text_code_block = "vim"
    elseif g:append_text_code_block == "vim"
        let g:append_text_code_block = "lua"
    else
        let g:append_text_code_block = ""
    endif
    call EchoToggleAppendCodeBlock()
endfunction

function! SetDefaultCodeBlock()
    let g:append_text_code_block = input("Enter the default code block type: ")
    call EchoToggleAppendCodeBlock()
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
set number relativenumber
set cursorline
set ttyfast
set backupdir=~/.config/nvim/nvim-temp
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=5 showcmd showmode
set list listchars=trail:»,tab:»-
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set title
set matchpairs+=<:>
set iskeyword-=_
set swapfile
set guifont=JetBrains\ Mono\ 13
set fillchars+=vert:\│
set completeopt=menu,menuone,noselect
set shell=nu

" #globalvars ish
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 0
let g:conceallevel = 0
let g:python3_host_prog = '~/.config/pyenvs/v3.12/bin/python'
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
let g:repl_split = 'bottom'
let g:repl_filetype_commands = {'python': '~/.config/pyenvs/v3.12/bin/ipython', 'rust': 'evcxr'}

" #autcmd ish
autocmd BufRead,BufNewFile *.hcl set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
autocmd Filetype terraform setlocal ts=2 sw=2 expandtab conceallevel=0
autocmd Filetype hcl setlocal ts=2 sw=2 expandtab conceallevel=0
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
autocmd BufWritePre *.tf lua vim.lsp.buf.format()
autocmd BufRead,BufNewFile *.csv.txt set filetype=csv conceallevel=0
autocmd BufRead,BufNewFile *.tsv.txt set filetype=tsv conceallevel=0
autocmd BufRead,BufNewFile *.toml set filetype=toml conceallevel=0
autocmd FileType csv nmap <C-f> :call ToggleMappings()<CR>
autocmd FileType tsv nmap <C-f> :call ToggleMappings()<CR>
autocmd FileType python nmap <C-f> :Black<CR>
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType toml setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType python setlocal conceallevel=0
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2 conceallevel=0
autocmd FileType md setlocal conceallevel=0
autocmd FileType json setlocal conceallevel=0
autocmd FileType text setlocal conceallevel=0

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

" Copilot
imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
imap <C-]> <Plug>(copilot-next)
imap <C-[> <Plug>(copilot-previous)
imap <C-e> <Plug>(copilot-dismiss)
imap <C-s> <Plug>(copilot-suggest)

" Terminal
tmap kj <C-\><C-n>
tmap <C-d> kj:q<CR>
tmap <C-t> <Esc><cmd>bd!<CR>
nmap <expr> <C-space><C-t> ":terminal python3 -i " . resolve(expand('%:p')) . "<CR>"
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
nmap <expr> <C-t> ":botright terminal<CR>:resize " . OpenTermSize() . "<CR>i"
xmap <expr> <C-t> ":botright terminal<CR>:resize " . OpenTermSize() . "<CR>i"
nmap <expr> <space><C-t> ":cd %:p:h<CR>:botright terminal<CR>i"



" Core
inoremap <S-CR> <Esc>
nmap \ :NvimTreeFindFileToggle<CR>:set number<CR>:set nowrap<CR>
nmap <leader><leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader><leader>t :call TrimWhitespace()<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <leader><leader>d <cmd>silent! bd!<CR>
nmap D <cmd>silent! bd!<CR>
nmap <leader><leader>w <cmd>w!<CR>
nmap W <cmd>w!<CR>
nmap <leader><leader>q <cmd>q!<CR>
nmap <C-q> <cmd>q!<CR>
nmap <leader><leader>s <cmd>w!<CR><cmd>q!<CR>
nmap <C-space>n :cnext<CR>
nmap <C-space>N :cprevious<CR>
xmap <leader><leader>d <cmd>silent! bd!<CR>
xmap <leader><leader>w <cmd>w!<CR>
xmap <leader><leader>q <cmd>q!<CR>
xmap <C-q> <cmd>q!<CR>
xmap W <cmd>w!<CR>
xmap D <cmd>silent! bd!<CR>
xnoremap <C-d> D

" Telescope mappings
nnoremap <C-space>ff <cmd>Telescope find_files<cr>
noremap <C-space>fg <cmd>Telescope live_grep<cr>
nnoremap <C-space>fb <cmd>Telescope buffers<cr>
nnoremap <C-space>fh <cmd>Telescope help_tags<cr>
nnoremap <C-space>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-space>gm <cmd>MergetoolToggle<CR>
nnoremap <C-space>hm <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <C-space>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-space>h] <cmd>lua require("harpoon.ui").nav_next()<CR>
nnoremap <C-space>h[ <cmd>lua require("harpoon.ui").nav_prev()<CR>
nnoremap <C-space>h1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-space>h2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-space>h3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-space>hf <cmd>Telescope harpoon marks<CR>

"
" Python repl mappings
"
nnoremap <Leader>rt <Cmd>ReplToggle<CR>
nmap <Leader>rc <Plug>ReplSendCell
nmap <Leader>rr <Plug>ReplSendLine
xmap <Leader>r  <Plug>ReplSendVisual

""
"Normal remaps
"
nmap <expr> <A-C-j> ']]' . Centerizer()
nmap <expr> <A-C-k> '[[' . Centerizer()
nmap <expr> <A-j> ']m' . Centerizer()
nmap <expr> <A-k> '[m' . Centerizer()
nmap <A-l> ]M
nmap <A-h> [M
nmap <expr> } '}' . Centerizer()
nmap <expr> { '{' . Centerizer()
nnoremap <leader>e :REPLSendSession<Cr>
nnoremap <leader>l g_
nnoremap <leader>h _
nnoremap <leader>k g_
nnoremap <leader>j _
nnoremap <leader>y "+y
nnoremap <leader>yw BvE"+y
nnoremap <leader>yy ^vg_"+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap vw BvE
nnoremap <C-y> "+y
nnoremap <C-p> "+p
nnoremap <leader><C-p> "+P
nnoremap y "0y
nnoremap yw BvEy
nnoremap P "0P
nnoremap p "0p
nnoremap d "1d
nnoremap x "_x
nnoremap <C-space>p "1p
nnoremap <C-space>P "1P
nnoremap R s
nnoremap <C-s> <cmd>Pounce<CR>
nnoremap <expr> <C-j> '<C-d>' . Centerizer()
nnoremap <expr> <C-k> '<C-u>' . Centerizer()
nnoremap <expr> j 'j' . Centerizer()
nnoremap <expr> k 'k' . Centerizer()
nnoremap <expr> n 'n' . Centerizer()
nnoremap <expr> N 'N' . Centerizer()
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-space>j o<Esc>_C<Esc>
nnoremap <C-space>k O<Esc>_C<Esc>
nnoremap <C-d> :bd!<CR>
nnoremap <C-m>ls :MarksListBuf<CR>
nnoremap <leader>B <cmd>call Toggle_Venn()<CR>
nmap <expr> J g:venn_enabled ? '<C-v>j:VBox<CR>' : 'J'
nmap <expr> K g:venn_enabled ? '<C-v>k:VBox<CR>' : 'K'
nnoremap <C-m>la :MarksListGlobal<CR>
nmap <C-f> :set conceallevel=0<CR>
nmap <c-.> <C-W>l
nmap <c-,> <C-W>h
nnoremap gg gg0
nnoremap G G$
nnoremap <leader><C-y> gg0vG$"+y
nmap <expr> L g:venn_enabled ? '<C-v>l:VBox<CR>' : 'L'
nmap <expr> H g:venn_enabled ? '<C-v>h:VBox<CR>' : 'H'
nmap <expr> F g:venn_enabled ? '`<hk<C-v>`>lj:VBox<CR>' : 'F'
nmap <expr> <C-space>j g:venn_enabled ? '8J' : '<C-space>j'
nmap <expr> <C-space>k g:venn_enabled ? '8K' : '<C-space>k'
nmap <expr> <C-space>l g:venn_enabled ? '8L' : '<C-space>l'
nmap <expr> <C-space>h g:venn_enabled ? '8H' : '<C-space>h'
nnoremap <leader>` _i```
nnoremap <leader><leader>` i```
nnoremap <leader>o o<Esc>_
nnoremap <C-space><C-o> O<Esc>_
nnoremap <leader><leader>o o<Esc>_i
nnoremap <C-space><C-space><C-o> O<Esc>_i
nnoremap <leader>th :/```<CR>NjVnk:noh<CR>
nnoremap <leader>tk :/```<CR>N:noh<CR>
nnoremap <leader>tj :/```<CR>n:noh<CR>
nnoremap t<C-c> zz:call ToggleCenterizer()<CR>
nnoremap t<C-a> :call ToggleDefaultCodeBlock()<CR>
nnoremap t<C-s> :call SetDefaultCodeBlock()<CR>
nnoremap t<C-i> :call ToggleInferDefaultCodeBlock()<CR>
nnoremap t<C-d> :call ToggleDatabricksNotebook()<CR>
nnoremap t<C-b> :call SetCodeBlockIdentifier()<CR>
nnoremap <C-space><C-space><C-space><C-p> :call EchoToggleAppendCodeBlock()<CR>
nnoremap <expr> <C-c> 'O<Esc>_C' . CodeBlockIdentifier(1) . '<Esc>o<Esc>_C' . CodeBlockIdentifier() . '<Esc>ko<Esc>_C'
nnoremap <expr> <C-i> 'O<Esc>_C' . CodeBlockIdentifier() . '<Esc>o<Esc>_C' . CodeBlockIdentifier() . '<Esc>kA '

" Insert remaps
inoremap  <Esc>
inoremap <C-l> <Esc>la
inoremap <C-;> <Esc>lxa
inoremap <C-h> <Esc>ha
inoremap <C-k> <Esc>ka
inoremap <C-j> <Esc>ja
inoremap <C-space>l <Esc>A
inoremap <C-space>h <Esc>I
inoremap <C-space>j <Esc>o<Esc>_C
inoremap <C-space>k <Esc>O<Esc>_C
inoremap <C-space>` <Esc>_i```
inoremap <C-space><C-space>` ```
inoremap <C-space>C <Esc>lC
inoremap <C-d>l <Esc>lC
inoremap <C-d>h <Esc>v_di
inoremap <C-d>j <Esc>jddkA
inoremap <C-d>k <Esc>kddjA
inoremap <expr> <C-c> '<Esc>o<Esc>_C' . CodeBlockIdentifier(1) . '<Esc>o<Esc>_C' . CodeBlockIdentifier() . '<Esc>ko<Esc>_C'
inoremap <expr> <C-i> '<Esc>o<Esc>_C' . CodeBlockIdentifier() . '<Esc>o<Esc>_C' . CodeBlockIdentifier() . '<Esc>kA '

" Visual remaps
xnoremap < <gv
xnoremap > >gv
xnoremap <leader>k g_
xnoremap <leader>j _
xnoremap <expr> <C-j> '<C-d>' . Centerizer()
xnoremap <expr> <C-k> '<C-u>' . Centerize()
xnoremap <expr> j 'j' . Centerizer()
xnoremap <expr> k 'k' . Centerizer()
xnoremap <expr> n 'n' . Centerizer()
xnoremap <expr> N 'N' . Centerizer()
xnoremap t<C-c> zz:call ToggleCenterizer()<CR>
xnoremap <leader>y "+y
xnoremap <leader>yy "+yy
xnoremap <leader>Y "+yg_
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xnoremap <C-y> "+y
xnoremap y "0y
xnoremap p "0p
xnoremap d "1d
xnoremap x "_x
xnoremap <C-p> "1p
xnoremap <leader><C-p> "1P
xnoremap <expr> <C-space>V mode() ==# "v" ? "v" : "<C-v>"
xnoremap gg gg0
xnoremap G G$
xnoremap <expr> f g:venn_enabled ? ':VBox<CR>' : 'f'
xmap <expr> F g:venn_enabled ? '<Esc>F' : 'F'
xnoremap <expr> <space>h g:venn_enabled ? '8h' : '<C-h>'
xnoremap <expr> <space>l g:venn_enabled ? '8l' : '<C-l>'
xmap <expr> <A-h> g:venn_enabled ? '<Plug>GoVSMLeft' : '[Mzz'
xmap <expr> <A-j> g:venn_enabled ? '<Plug>GoVSMDown' : ']mzz' . Centerizer()
xmap <expr> <A-k> g:venn_enabled ? '<Plug>GoVSMUp' : '[mzz' . Centerizer()
xmap <expr> <A-l> g:venn_enabled ? '<Plug>GoVSMRight' : ']Mzz'
xnoremap <leader>` <Esc>`<O```<Esc>`>o```<Esc>
xnoremap <C-s> <cmd>Pounce<CR>
xnoremap <Esc> <Nop>
xnoremap <Esc><Esc> <Esc>
xnoremap <expr> <C-c> '<Esc><Esc>`<O<Esc>_C' . CodeBlockIdentifier(1) . '<Esc>`><Esc>o' . CodeBlockIdentifier() . '<Esc>k0'
xnoremap <expr> <C-i> '<Esc><Esc>`<O<Esc>_C' . CodeBlockIdentifier() . '<Esc>`><Esc>o' . CodeBlockIdentifier() . '<Esc>`<k$a '
xmap <expr> <A-C-j> ']]' . Centerizer()
xmap <expr> <A-C-k> '[[' . Centerizer()
xmap <expr> <S-}> '}' . Centerizer()
xmap <expr> <S-{> '{' . Centerizer()
