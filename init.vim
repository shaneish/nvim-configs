"" Vim-Plug
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
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'MunifTanjim/nui.nvim'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'hashivim/vim-terraform'
Plug 'ThePrimeagen/harpoon'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'windwp/nvim-spectre'
Plug 'samoshkin/vim-mergetool'
Plug 'rlane/pounce.nvim'
Plug 'ggandor/leap.nvim'
Plug 'goolord/alpha-nvim'
Plug 'booperlv/nvim-gomove'
Plug 'ellisonleao/glow.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'akinsho/git-conflict.nvim'
Plug 'nastevens/vim-duckscript'
Plug 'cameron-wags/rainbow_csv.nvim'
Plug 'hat0uma/csvview.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Plug 'm4xshen/smartcolumn.nvim'
Plug 'github/copilot.vim'
Plug 'UnsafeOats/oatjump.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'nvim-orgmode/orgmode'
Plug 'chentoast/marks.nvim'
Plug 'dpayne/CodeGPT.nvim'
Plug 'ziglang/zig.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'NTBBloodbath/zig-tools.nvim'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
" Plug 'arturgoms/moonbow.nvim'
" Plug 'catppuccin/nvim', { 'as': 'catpuccin' }
" Plug 'n1ghtmare/noirblaze-vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'jesseleite/nvim-noirbuddy'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

" Better tabs + buffers
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

call plug#end()

" Personal settings
set linespace=10
set mouse=a
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" set cc=120                  " set an 120 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
" set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set backupdir=~/.config/nvim/nvim-temp
" set nobackup
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set title
set matchpairs+=<:>
set iskeyword-=_
let mapleader=" "
set swapfile

" ocaml shite
" let g:opamshare = substitute(system('opam var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"

"" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Coloring
highlight link TSError Normal
set fillchars+=vert:\│
highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray

set termguicolors
" colorscheme moonbow
set guifont=JetBrains\ Mono\ 13
colorscheme noirbuddy

highlight Normal guibg=NONE ctermbg=NONE
highlight Error guibg=NONE ctermbg=NONE
highlight Comment guifg=#f9ff9f
highlight LineNr guifg=#969294
" highlight RustHints guifg=#f08080
highlight RustHints guifg=#f33a6a

" nvim-cmp
set completeopt=menu,menuone,noselect

" copilot
imap <silent><script><expr> <leader><tab> copilot#Accept("\<CR>")
imap <C-]> <Plug>(copilot-next)
imap <C-[> <Plug>(copilot-previous)
imap <C-e> <Plug>(copilot-dismiss)
imap <C-s> <Plug>(copilot-suggest)
let g:copilot_no_tab_map = v:true

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'

" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Python
let g:python3_host_prog = '~/.config/nvim/venv/bin/python3'
let g:pydocstring_doq_path = '~/config/nvim/venv/bin/doq'


""" Core plugin configuration (lua)

lua << EOF
servers = {
    'pyright',
    'tflint',
    'terraformls',
    'zls',
}
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
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
require('noirbuddy').setup({
    preset = 'kiwi',
})
require('oatjump').setup()
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
require('treesitter-config')
require('spectre').setup()
require('nvim-cmp-config')
require('lspconfig-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('zen-config')
require('diagnostics')
require('codegpt.config')
require('zig-tools').setup()
vim.g["codegpt_openai_api_key"] = os.getenv("OPENAI_API_KEY")
require('lspconfig')['lua_ls'].setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
require('telescope').load_extension('harpoon')
require('leap').add_default_mappings()
require('transparent').setup({
    enable = true
})
require('alpha').setup(require('alpha.themes.dashboard').config)
require('glow').setup({
    width = 120,
    height = 140,
})
require('flutter-tools').setup{}
-- require('smartcolumn').setup({
--    colorcolumn = 100,
--    disabled_filetypes = { "help", "text", "markdown" },
--    limit_to_window = true,
-- })
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline, it's very annoying
        underline = false
        })

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
local rt = require("rust-tools")
rt.setup({
  tools = {
      inlay_hints = {
        highlight = "RustHints",
      },
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader><leader>a", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- gmove
require("gomove").setup {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = true,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
}

require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Notes/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Notes/org/refile.org',
})

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

-- Resize split when terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')

EOF

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

""" Rainbow CSV
let g:rbql_with_headers = 1

""" Custom Functions

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

autocmd BufRead,BufNewFile *.csv.txt set filetype=csv
autocmd BufRead,BufNewFile *.tsv.txt set filetype=tsv
autocmd FileType csv nmap <leader>= :call ToggleMappings()<CR>
autocmd FileType tsv nmap <leader>= :call ToggleMappings()<CR>
""" Custom Mappings (vim) (lua custom mappings are within individual lua config files)

" Weirdish
nmap <space> <leader>
nmap <space><space> <leader><leader>
xmap <space> <leader>
xmap <space><space> <leader><leader>

" Core
nmap \ :NvimTreeFindFileToggle<CR>:set relativenumber<CR>:set nowrap<CR>
nmap <leader><leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t= :call TrimWhitespace()<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader><leader>d <cmd>bd!<CR>
nmap <leader><leader>w <cmd>w<CR>
nmap <leader><leader>q <cmd>q!<CR>
nmap <leader><leader>s <cmd>w!<CR><cmd>q!<CR>
nmap <leader>n :cnext<CR>

" Python
autocmd FileType python nmap <leader>fmt :Black<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
noremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <Esc><Esc> <Esc><cmd>nohlsearch<CR><Esc>
nnoremap <leader>gm <cmd>MergetoolToggle<CR>
nnoremap <leader>t <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>hm <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>h] <cmd>lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>h[ <cmd>lua require("harpoon.ui").nav_prev()<CR>
nnoremap <leader>h1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>h5 <cmd>lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>hf <cmd>Telescope harpoon marks<CR>
nnoremap <leader>ss <cmd>lua require('spectre').open()<CR>
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>sv <esc><cmd>lua require('spectre').open_visual()<CR>
nnoremap <leader>sp viw<cmd>lua require('spectre').open_file_search()<CR>

"Normal remaps
nnoremap <leader>k g_
nnoremap <leader>j _
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>Y "+yg_
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader><C-y> _vg_y
nnoremap y "0y
nnoremap P "0P
nnoremap p "0p
nnoremap d "1d
nnoremap x "_x
nnoremap <C-p> "1p
nnoremap <leader><C-p> "1P
nmap <leader>z ysiw
nmap <leader>zz yssw
nnoremap <leader>q{ 0v$F{%
nnoremap <leader>q( 0v$F(%
nnoremap <leader>q[ 0v$F[%
nnoremap <leader>q< 0v$F<%
nnoremap R s
nnoremap <C-s> <cmd>Pounce<CR>
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
nnoremap j jzz
nnoremap k kzz
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap R s
nnoremap n nzz
nnoremap <leader>g <cmd>/=======<CR>

" Insert remaps
inoremap kj <Esc>
inoremap <leader><leader> <Esc>
inoremap <leader>k <Esc>la
inoremap <leader>j <Esc>lxa

" visual remaps
xnoremap qq g_
xnoremap <leader><C-y> v_vg_y
xnoremap <leader><leader>{ f{%
xnoremap <leader><leader>( f(%
xnoremap <leader><leader>[ f[%
xnoremap <leader><leader>< f<%
xnoremap <leader>w <cmd>Pounce<CR>
xnoremap <leader>i g<C-a>
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
xnoremap <expr> j  mode() ==# "v" ? "j$" : "j"
xnoremap <expr> <C-j> mode() ==# "v" ? "<C-d>$"  : "<C-d>"
xnoremap <expr> k  mode() ==# "v" ? "k$" : "k"
xnoremap <expr> <C-k> mode() ==# "v" ? "<C-u>$"  : "<C-u>"
xmap <leader>z" S"
xmap <leader>z' S'
xmap <leader>z[ S]
xmap <leader>z] S[
xmap <leader>z{ S}
xmap <leader>z} S{
xmap <leader>z( S)
xmap <leader>z) S(

" term stuff
:tnoremap <Esc> <C-\><C-n>
