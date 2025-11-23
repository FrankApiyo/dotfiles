" Python3 provider configuration
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" colorscheme desert  " Disabled - using VSCode theme instead
" Flags
set showmatch 			" show matching
set ignorecase 			" case insensitive
set encoding=UTF-8
set hlsearch			" highlight search
set incsearch			" incremental search
set tabstop=4			" number of columns occupied by tab
set softtabstop=4		" see multiple spaces as tab stops so <BS> does the right thing
set expandtab			" converts tabs to white space
set shiftwidth=4		" width for auto-indents
set autoindent			" indent a new line the same amount as the line just typed
set number relativenumber			" add line numbers
set cc=80			" set an 80 column border for good coding style
syntax on			" syntax highlighting
set cursorline			" highlight current cursor-line
set spell			" Enable spellcheck
set noswapfile			" disable creating swap-file
set clipboard=unnamedplus		" use system clipboard for yank/paste

" Display the ruler
set ruler

" Highlight the cursor column
set cursorcolumn
" highlight CursorColumn cterm=NONE ctermbg=darkgrey guibg=lightgrey  " Disabled - VSCode theme handles this

" Highlight the cursor line
set cursorline
" highlight CursorLine cterm=NONE ctermbg=darkgrey guibg=lightgrey  " Disabled - VSCode theme handles this

call plug#begin("~/.vim/plugged")
" VSCode-like UI
Plug 'Mofiqul/vscode.nvim'                          " VSCode theme
Plug 'nvim-lualine/lualine.nvim'                    " VSCode-like statusline
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }      " VSCode-like buffer tabs
Plug 'lukas-reineke/indent-blankline.nvim'          " Indent guides like VSCode
Plug 'lewis6991/gitsigns.nvim'                      " Modern git signs (replacing gitgutter)
Plug 'nvim-tree/nvim-web-devicons'                  " File icons (replacing vim-devicons)
Plug 'nvim-tree/nvim-tree.lua'                      " Modern file explorer (can be used with NERDTree)
Plug 'windwp/nvim-autopairs'                        " Auto-closing brackets like VSCode
Plug 'norcalli/nvim-colorizer.lua'                  " Color highlighter

" Original plugins
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'terryma/vim-smooth-scroll'

Plug 'vim-scripts/indentpython.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'

" minimap vim
Plug 'wfxr/minimap.vim', {'branch': 'master'}

" ale
Plug 'dense-analysis/ale'

" Elixir
Plug 'elixir-editors/vim-elixir', {'branch':'master'}
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }

" structural editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'bfontaine/zprint.vim'

" Conjure!
Plug 'Olical/conjure'

" mason.nvim
Plug 'williamboman/mason.nvim'

" tailwind
Plug 'neovim/nvim-lspconfig'
Plug 'luckasRanarison/tailwind-tools.nvim'

" HTML
Plug 'mattn/emmet-vim'

" YAML support
Plug 'stephpy/vim-yaml'                             " Better YAML syntax
Plug 'cuducos/yaml.nvim'                            " YAML tools and formatting
call plug#end()

" mason setup
lua <<EOF
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
EOF

" minimap configs
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1
let g:minimap_background_processin = 1
let g:minimap_highlight_range = 1

" Minimap colors for diagnostics and git
augroup minimap_colors
  autocmd!
  autocmd ColorScheme * highlight MinimapDiffAdd    ctermfg=Green  guifg=#00ff00
  autocmd ColorScheme * highlight MinimapDiffModify ctermfg=Yellow guifg=#ffff00
  autocmd ColorScheme * highlight MinimapDiffRemove ctermfg=Red    guifg=#ff0000
  autocmd ColorScheme * highlight MinimapError      ctermfg=Red    guifg=#ff0000 ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight MinimapWarning    ctermfg=Yellow guifg=#ffaa00 ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight MinimapInfo       ctermfg=Cyan   guifg=#00ffff ctermbg=NONE guibg=NONE

  " Auto-refresh minimap on diagnostics change
  autocmd User CocDiagnosticChange silent! MinimapRefresh
  autocmd DiagnosticChanged * silent! MinimapRefresh
  autocmd BufWritePost * silent! MinimapRefresh
augroup END

" Apply colors immediately
highlight MinimapDiffAdd    ctermfg=Green  guifg=#00ff00
highlight MinimapDiffModify ctermfg=Yellow guifg=#ffff00
highlight MinimapDiffRemove ctermfg=Red    guifg=#ff0000
highlight MinimapError      ctermfg=Red    guifg=#ff0000 ctermbg=NONE guibg=NONE
highlight MinimapWarning    ctermfg=Yellow guifg=#ffaa00 ctermbg=NONE guibg=NONE
highlight MinimapInfo       ctermfg=Cyan   guifg=#00ffff ctermbg=NONE guibg=NONE

let maplocalleader = ' '
let mapleader = ' '

" Startify configuration - Show tips on startup
let g:startify_custom_header = [
  \ '   ╔═══════════════════════════════════════════════════════════════════╗',
  \ '   ║               Welcome to Neovim - Quick Reference                 ║',
  \ '   ╚═══════════════════════════════════════════════════════════════════╝',
  \ '',
  \ '   📁 Files:     <leader>ff (find)  <leader>fr (recent)  <leader>fb (buffers)',
  \ '   🔍 Search:    <leader>fg (grep files)',
  \ '   🌳 Tree:      <leader>nt (toggle)  <leader>nf (sync to file)',
  \ '   🗺️  Map:       <leader>mm (toggle minimap)  <leader>mr (refresh)',
  \ '',
  \ '   📝 Editing:   ]b/[b (next/prev buffer)  ]d/[d (diagnostics)  ]h/[h (git hunks)',
  \ '   💡 LSP:       K (hover)  gd (definition)  <leader>co (outline)',
  \ '   📋 Copy:      yd (copy file dir)  yy (yank line)',
  \ '',
  \ '   💾 Full improvement guide: :e ~/.config/nvim-alt/RECOMMENDED_IMPROVEMENTS.md',
  \ '',
  \ ]

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   📂 Recent Files']            },
  \ { 'type': 'dir',       'header': ['   📁 Recent in '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   💾 Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   🔖 Bookmarks']      },
  \ ]

let g:startify_bookmarks = [
  \ { 'c': '~/.config/nvim-alt/init.vim' },
  \ { 'i': '~/.config/nvim-alt/RECOMMENDED_IMPROVEMENTS.md' },
  \ ]

let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

let python_highlight_all=1
" zprint configs
let g:zprint#options_map = '{:search-config? true}'
let g:zprint#make_autocmd = v:false

" Evaluate clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" Mark extra whitespace in red
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ============================================================================
" Python Configuration - Enhanced Support
" ============================================================================

" Python-specific settings
augroup python_settings
  autocmd!
  " PEP 8 indentation
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType python setlocal textwidth=79
  autocmd FileType python setlocal autoindent
  autocmd FileType python setlocal fileformat=unix

  " Enable folding
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal foldlevel=99
augroup END

" Python keybindings
augroup python_keybindings
  autocmd!
  " Override Conjure's gd with CoC's definition (Conjure interferes with Python)
  autocmd FileType python nmap <buffer> <silent> gd <Plug>(coc-definition)
  autocmd FileType python nmap <buffer> <silent> gy <Plug>(coc-type-definition)
  autocmd FileType python nmap <buffer> <silent> gi <Plug>(coc-implementation)
  autocmd FileType python nmap <buffer> <silent> gr <Plug>(coc-references)

  " Run current Python file
  autocmd FileType python nnoremap <buffer> <leader>pr :!python3 %<CR>

  " Run current Python file in a terminal split
  autocmd FileType python nnoremap <buffer> <leader>pt :split \| terminal python3 %<CR>

  " Run pytest for current file
  autocmd FileType python nnoremap <buffer> <leader>pT :!pytest %<CR>

  " Run all pytest tests
  autocmd FileType python nnoremap <buffer> <leader>pa :!pytest<CR>

  " Format with black
  autocmd FileType python nnoremap <buffer> <leader>pf :!black %<CR>

  " Run flake8 on current file
  autocmd FileType python nnoremap <buffer> <leader>pl :!flake8 %<CR>

  " Start Python REPL
  autocmd FileType python nnoremap <buffer> <leader>pi :terminal python3<CR>

  " Start IPython REPL (if available)
  autocmd FileType python nnoremap <buffer> <leader>pI :terminal ipython<CR>

  " Show type information (using CoC)
  autocmd FileType python nnoremap <buffer> <leader>ps :call CocActionAsync('doHover')<CR>
augroup END

" Python commands
command! PythonRun !python3 %
command! PythonTest !pytest
command! PythonFormat !black .
command! PythonLint !flake8 .
command! PythonRepl :terminal python3
command! IPythonRepl :terminal ipython

" Git blame does not want conflicts
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" ============================================================================
" JavaScript/TypeScript Configuration - Enhanced Support
" ============================================================================

" JS/TS specific settings
augroup javascript_typescript_settings
  autocmd!
  " 2-space indentation (JS/TS standard)
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  " Enable folding
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal foldmethod=syntax
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal foldlevel=99

  " JSX/TSX specific
  autocmd FileType javascriptreact,typescriptreact setlocal commentstring={/*\ %s\ */}
augroup END

" JS/TS keybindings
augroup javascript_typescript_keybindings
  autocmd!
  " Override any conflicting keybindings with CoC
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nmap <buffer> <silent> gd <Plug>(coc-definition)
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nmap <buffer> <silent> gy <Plug>(coc-type-definition)
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nmap <buffer> <silent> gi <Plug>(coc-implementation)
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nmap <buffer> <silent> gr <Plug>(coc-references)

  " Run JavaScript file with Node
  autocmd FileType javascript nnoremap <buffer> <leader>jr :!node %<CR>
  autocmd FileType typescript nnoremap <buffer> <leader>jr :!ts-node %<CR>

  " Run in terminal split
  autocmd FileType javascript nnoremap <buffer> <leader>jt :split \| terminal node %<CR>
  autocmd FileType typescript nnoremap <buffer> <leader>jt :split \| terminal ts-node %<CR>

  " Format with Prettier
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>jf :CocCommand prettier.formatFile<CR>

  " Run ESLint fix
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>jl :CocCommand eslint.executeAutofix<CR>

  " Run tests (Jest)
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>jT :!npm test %<CR>
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>ja :!npm test<CR>

  " TypeScript specific - show compiled output
  autocmd FileType typescript nnoremap <buffer> <leader>jc :!tsc %<CR>

  " Organize imports
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>jo :CocCommand tsserver.organizeImports<CR>

  " Rename file and update imports
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>jR :CocCommand tsserver.renameFile<CR>
augroup END

" JS/TS commands
command! NodeRun !node %
command! TsRun !ts-node %
command! NpmTest !npm test
command! NpmBuild !npm run build
command! NpmDev !npm run dev
command! YarnTest !yarn test
command! YarnBuild !yarn build
command! YarnDev !yarn dev

"
let g:NERDTreeWinSize = 30
let g:NERDTreeAutoCenter = 0
let g:NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
" Disable opening files in tabs from NERDTree
let g:NERDTreeMapOpenInTab = '<Nop>'
let g:NERDTreeMapOpenInTabSilent = '<Nop>'
if filereadable(expand('~/.vim/.devicons'))
    let g:NERDTreeDirArrowExpandable = ''
    let g:NERDTreeDirArrowCollapsible = ''
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:tagbar_iconchars = ["\uf054", "\uf078"]
endif
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 0
let g:NERDTreeSyntaxEnabledExtensions = ['h', 'sh', 'bash', 'vim', 'md']
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'A',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'M',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'C',
                \ 'Unknown'   :'?',
                \ }

" Auto-sync NERDTree with current file
augroup nerdtree_sync
  autocmd!
  " Sync NERDTree when opening a buffer (only if NERDTree is already open)
  autocmd BufEnter * call SafeSyncNERDTree()
augroup END

" Function to safely sync NERDTree to current file
function! SafeSyncNERDTree()
  " Don't sync if we're in a special buffer
  if &filetype ==# 'nerdtree' || &buftype !=# '' || expand('%:p') ==# ''
    return
  endif

  " Don't sync if NERDTree isn't open
  let nerdtree_open = 0
  for i in range(1, winnr('$'))
    if getbufvar(winbufnr(i), '&filetype') ==# 'nerdtree'
      let nerdtree_open = 1
      break
    endif
  endfor

  if !nerdtree_open
    return
  endif

  " Save current window
  let l:current_winnr = winnr()
  let l:current_bufnr = bufnr('%')

  " Try to find and reveal current file in NERDTree
  try
    silent! NERDTreeFind
    " Return to the file window only if we're now in a different window
    if winnr() != l:current_winnr
      execute l:current_winnr . 'wincmd w'
    endif
  catch
    " Silently ignore any errors
  endtry
endfunction

" Manual sync function (for keybinding)
function! SyncNERDTree()
  call SafeSyncNERDTree()
endfunction

" Function to close all NERDTree-only tabs (utility command)
function! CloseNERDTreeTabs()
  let current_tab = tabpagenr()
  let last_tab = tabpagenr('$')

  " Go through all tabs
  for i in range(1, last_tab)
    execute 'tabnext ' . i
    " If this tab only has NERDTree, close it
    if winnr('$') == 1 && &filetype ==# 'nerdtree'
      tabclose
      let current_tab = current_tab - (i < current_tab ? 1 : 0)
    endif
  endfor

  " Return to appropriate tab
  execute 'tabnext ' . min([current_tab, tabpagenr('$')])
endfunction

command! CloseNERDTreeTabs call CloseNERDTreeTabs()

lua << EOF
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '-u' -- thats the new thing
            },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = {
                i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    },
                },
                -- ... also accept themem settings, for example
                -- theme = "dropdown", -- use dropdown theme
                live_grep = { hidden=true },
                -- theme = {}, -- use own theme spec
                layout_config = { mirror=true }, -- mirror preview pane
            }
        }
}
EOF

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split pane to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <C-k> <C-W>k

nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
set updatetime=3

:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <ESc>

nnoremap <leader>rn :%s/\([^\n]\)\n\([^\n]\)/\1 \2/g

" CoC: Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" View outline of current file
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p;h')<CR>
" vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" always open NERDTree - DISABLED (use Ctrl+b to toggle nvim-tree instead)
" autocmd VimEnter * NERDTree

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>

nnoremap <leader>r <cmd>NERDTreeRefreshRoot<cr>

" Toggle NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Manually sync NERDTree to current file
nnoremap <leader>nf :call SyncNERDTree()<cr>

" Minimap keybindings
nnoremap <leader>mm :MinimapToggle<cr>
nnoremap <leader>mr :MinimapRefresh<cr>

" treversing buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
noremap <silent> [T :tabfirst<CR>
noremap <silent> ]T :tablast<CR>

" smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

if has('nvim')
  let s:user_dir = stdpath('config')
else
  let s:user_dir = has('win32') ? expand('~/vimfiles') : expand('~/.vim')
endif

let g:ale_elixir_elixir_ls_release = s:user_dir . '/plugins/vim-elixirls/elixir-ls/release'

" https://github.com/JakeBecker/elixir-ls/issues/54
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }

let g:ale_linters = {'html': ['htmlhint'], 'css': ['stylelint'],'clojure': ['clj-kondo'], 'elixir':[ 'credo', 'elixir-ls' ]}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['eslint'], 'html': ['prettier', 'html-beautify'], 'css': ['stylelint'], 'elixir': ['mix_format']}

let g:ale_fix_on_save = 1

" ============================================================================
" VSCode-like UI Configuration
" ============================================================================

" VSCode Theme Setup
lua << EOF
-- VSCode Dark+ theme
vim.o.background = 'dark'
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Enable transparent background (optional)
    transparent = false,

    -- Enable italic comments
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = false,

    -- Override colors
    color_overrides = {},

    -- Override highlight groups
    group_overrides = {}
})

-- Load the colorscheme
require('vscode').load()
EOF

" Lualine (VSCode-like statusline)
lua << EOF
require('lualine').setup {
  options = {
    theme = 'vscode',
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 3,  -- Use 3 for absolute path with ~ for home
        shorting_target = 60,  -- Reserve more space for filename (default is 40)
      }
    },
    lualine_x = {'filetype'},  -- Removed 'encoding' and 'fileformat' to save space
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 3,
        shorting_target = 60,
      }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree', 'fugitive'}
}
EOF

" Bufferline (VSCode-like tabs)
lua << EOF
require('bufferline').setup {
  options = {
    mode = "buffers",
    style_preset = require('bufferline').style_preset.default,
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
    diagnostics = "coc",
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    offsets = {
      {
        filetype = "NERDTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      },
      {
        filetype = "nvim-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  }
}
EOF

" Indent Blankline (VSCode-like indent guides)
lua << EOF
require('ibl').setup {
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
    injected_languages = false,
    highlight = { "Function", "Label" },
    priority = 500,
  },
  exclude = {
    filetypes = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
    },
    buftypes = {
      "terminal",
      "nofile",
    },
  },
}
EOF

" GitSigns (Modern git indicators)
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}
EOF

" nvim-tree (Modern file explorer)
lua << EOF
require('nvim-tree').setup {
  disable_netrw = false,
  hijack_netrw = false,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  view = {
    width = 30,
    side = 'left',
  },
  renderer = {
    group_empty = false,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "M",
          staged = "A",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "✖",
          ignored = "◌",
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
}
EOF

" Auto-pairs (Auto-closing brackets)
lua << EOF
require('nvim-autopairs').setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},
    javascript = {'template_string'},
  },
  disable_filetype = { "TelescopePrompt" , "vim" },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})
EOF

" Colorizer (Color preview)
lua << EOF
require('colorizer').setup()
EOF

" ============================================================================
" Error & Diagnostics Viewing (VSCode-like)
" ============================================================================

" Show all Neovim messages and errors
nnoremap <leader>em :messages<CR>

" Clear messages
nnoremap <leader>ec :messages clear<CR>

" Show diagnostics in location list (all errors in current file)
nnoremap <leader>el :lopen<CR>

" Show diagnostics in quickfix list (all errors across files)
nnoremap <leader>eq :copen<CR>

" CoC: Show all diagnostics
nnoremap <silent> <leader>ed :CocList diagnostics<CR>

" CoC: Next/Previous diagnostic
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Show hover documentation (errors/warnings)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Health check (shows plugin/system issues)
nnoremap <leader>eh :checkhealth<CR>

" Telescope: Show all diagnostics
nnoremap <leader>et :Telescope diagnostics<CR>

" ============================================================================
" VSCode-like Keybindings
" ============================================================================

" Ctrl+b - Toggle file explorer (nvim-tree, like VSCode Ctrl+b)
nnoremap <C-b> :NvimTreeToggle<CR>

" Tab navigation (buffer tabs like VSCode)
nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>

" Close current buffer (like VSCode Ctrl+w)
nnoremap <silent> <leader>x :bdelete<CR>

" Pick buffer (like VSCode quick switch)
nnoremap <silent> <leader>bp :BufferLinePick<CR>

" Close all buffers except current
nnoremap <silent> <leader>bo :BufferLineCloseOthers<CR>

" Move buffer left/right
nnoremap <silent> <leader>< :BufferLineMovePrev<CR>
nnoremap <silent> <leader>> :BufferLineMoveNext<CR>

" ============================================================================
" YAML Configuration - Enhanced Visual Support
" ============================================================================

" Treesitter setup for better syntax highlighting
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "yaml", "json", "lua", "vim", "vimdoc", "python",
    "javascript", "typescript", "html", "css", "bash",
    "elixir", "clojure"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  -- Better folding
  fold = {
    enable = true
  }
}

-- Enable treesitter-based folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false  -- Don't fold by default
EOF

" YAML LSP - Simple and reliable schema support
lua << EOF
-- Setup YAML Language Server with built-in schema support
require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      -- Enable schema store for automatic schema detection
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      -- Automatic schema mapping for common files
      schemas = {
        kubernetes = "/*.k8s.{yml,yaml}",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
      },
      format = {
        enable = true,
      },
      validate = true,
      hover = true,
      completion = true,
      customTags = {
        "!Base64 scalar",
        "!Cidr scalar",
        "!And sequence",
        "!If sequence",
        "!Not sequence",
        "!Equals sequence",
        "!Or sequence",
        "!FindInMap sequence",
        "!GetAtt scalar",
        "!GetAZs scalar",
        "!ImportValue scalar",
        "!Join sequence",
        "!Select sequence",
        "!Split sequence",
        "!Sub scalar",
        "!Sub sequence",
        "!Ref scalar",
      },
    },
  },
})
EOF

lua << EOF
-- Treesitter Context (sticky scroll) - automatically enabled on startup
require('treesitter-context').setup {
  enable = true,           -- Automatically enable on startup
  max_lines = 3,           -- How many lines of context
  min_window_height = 0,   -- Minimum editor height
  line_numbers = true,
  multiline_threshold = 1,
  trim_scope = 'outer',    -- Remove whitespace
  mode = 'cursor',         -- Line used to calculate context
  separator = nil,
  zindex = 20,
}
EOF

" YAML-specific settings
augroup yaml_settings
  autocmd!
  " Set YAML indentation to 2 spaces (standard)
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  " Better visual indicators for YAML
  autocmd FileType yaml setlocal cursorcolumn

  " Folding for YAML
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType yaml setlocal foldlevel=99

  " Show list characters to see indentation clearly
  autocmd FileType yaml setlocal list
  autocmd FileType yaml setlocal listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+

  " YAML key highlighting enhancement
  autocmd FileType yaml syntax match yamlKey /^\s*\w\+:/
  autocmd FileType yaml highlight yamlKey ctermfg=cyan guifg=#4FC1FF
augroup END

" YAML keybindings (when in YAML files)
augroup yaml_keybindings
  autocmd!
  " Format YAML (using LSP if available, fallback to basic formatting)
  autocmd FileType yaml nnoremap <buffer> <leader>yf :lua vim.lsp.buf.format({async=true})<CR>

  " Show YAML diagnostics
  autocmd FileType yaml nnoremap <buffer> <leader>yd :lua vim.diagnostic.open_float()<CR>

  " Go to definition (useful for anchors/references)
  autocmd FileType yaml nnoremap <buffer> gd :lua vim.lsp.buf.definition()<CR>

  " Show hover info (schema documentation)
  autocmd FileType yaml nnoremap <buffer> <leader>yh :lua vim.lsp.buf.hover()<CR>
augroup END

" ============================================================================
" Elixir Configuration - Enhanced Native Support
" ============================================================================

" ElixirLS is configured through CoC (see coc-settings.json)
" CoC will handle the language server communication for Elixir files

" Elixir-specific settings
augroup elixir_settings
  autocmd!
  " Set Elixir indentation to 2 spaces (Elixir standard)
  autocmd FileType elixir,eelixir setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  " Enable spell checking for strings and comments
  autocmd FileType elixir,eelixir setlocal spell

  " Better visual indicators
  autocmd FileType elixir,eelixir setlocal cursorline cursorcolumn

  " Folding for Elixir (based on syntax)
  autocmd FileType elixir,eelixir setlocal foldmethod=expr
  autocmd FileType elixir,eelixir setlocal foldexpr=nvim_treesitter#foldexpr()
  autocmd FileType elixir,eelixir setlocal foldlevel=99

  " Highlight TODO, FIXME, NOTE, etc.
  autocmd FileType elixir,eelixir syntax match elixirTodo /\(TODO\|FIXME\|NOTE\|HACK\|XXX\):/
  autocmd FileType elixir,eelixir highlight elixirTodo ctermfg=Yellow guifg=#FFFF00 ctermbg=NONE guibg=NONE cterm=bold gui=bold
augroup END

" Elixir keybindings
augroup elixir_keybindings
  autocmd!
  " Format Elixir file with mix format
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ef :!mix format %<CR>

  " Format all Elixir files in project
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>eF :!mix format<CR>

  " Run tests for current file
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>et :!mix test %<CR>

  " Run all tests
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>eT :!mix test<CR>

  " Run test at current line
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>el :execute '!mix test %:' . line('.')<CR>

  " Compile current file
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ec :!mix compile<CR>

  " Run Credo (linter)
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>er :!mix credo %<CR>

  " Run Dialyzer
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ed :!mix dialyzer<CR>

  " Generate docs
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>eg :!mix docs<CR>

  " Open IEx with current project
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ei :terminal iex -S mix<CR>

  " Open IEx Phoenix server
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ep :terminal iex -S mix phx.server<CR>

  " Show hex docs for word under cursor
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>eh :!open https://hexdocs.pm/<cword><CR>

  " Insert pipe operator on next line
  autocmd FileType elixir,eelixir inoremap <buffer> <C-l> <CR>\|><Space>

  " Toggle between test and implementation file
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>ea :call ToggleElixirFile()<CR>

  " Show diagnostics
  autocmd FileType elixir,eelixir nnoremap <buffer> <leader>es :lua vim.diagnostic.open_float()<CR>
augroup END

" Function to toggle between test and implementation files
function! ToggleElixirFile()
  let current_file = expand('%')
  let is_test = match(current_file, '_test\.exs$') != -1

  if is_test
    " Switch from test to implementation
    let impl_file = substitute(current_file, 'test/\(.*\)_test\.exs$', 'lib/\1.ex', '')
    if filereadable(impl_file)
      execute 'edit ' . impl_file
    else
      echo "Implementation file not found: " . impl_file
    endif
  else
    " Switch from implementation to test
    let test_file = substitute(current_file, 'lib/\(.*\)\.ex$', 'test/\1_test.exs', '')
    if filereadable(test_file)
      execute 'edit ' . test_file
    else
      echo "Test file not found: " . test_file
    endif
  endif
endfunction

" Elixir snippets configuration
augroup elixir_snippets
  autocmd!
  " Common Elixir snippets with UltiSnips
  autocmd FileType elixir,eelixir inoremap <buffer> defm defmodule<Space><CR>end<Esc>kA
  autocmd FileType elixir,eelixir inoremap <buffer> deff def<Space>do<CR>end<Esc>kA
  autocmd FileType elixir,eelixir inoremap <buffer> defp defp<Space>do<CR>end<Esc>kA
  autocmd FileType elixir,eelixir inoremap <buffer> ioo IO.inspect(<Esc>a, label: "")<Esc>hi
  autocmd FileType elixir,eelixir inoremap <buffer> pipi \|> IO.inspect(label: "")<Esc>hi
augroup END

" Enhanced Elixir highlighting
augroup elixir_highlight
  autocmd!
  " Highlight pipe operators
  autocmd FileType elixir,eelixir syntax match elixirPipe /|>/
  autocmd FileType elixir,eelixir highlight elixirPipe ctermfg=Magenta guifg=#C678DD cterm=bold gui=bold

  " Highlight atoms
  autocmd FileType elixir,eelixir syntax match elixirAtom /:\w\+/
  autocmd FileType elixir,eelixir highlight elixirAtom ctermfg=Cyan guifg=#56B6C2

  " Highlight sigils
  autocmd FileType elixir,eelixir syntax match elixirSigil /\~[a-zA-Z]\+/
  autocmd FileType elixir,eelixir highlight elixirSigil ctermfg=Green guifg=#98C379
augroup END

" Elixir project commands
command! ElixirDeps !mix deps.get
command! ElixirClean !mix clean
command! ElixirTest !mix test
command! ElixirFormat !mix format
command! ElixirCredo !mix credo --strict
command! ElixirDialyzer !mix dialyzer
command! ElixirIex :terminal iex -S mix
command! ElixirPhoenix :terminal iex -S mix phx.server
command! ElixirEcto !mix ecto.migrate
command! ElixirEctoRollback !mix ecto.rollback

" Quick reference comment
" ============================================================================
" Elixir Keybindings Quick Reference:
" <leader>ef - Format current file
" <leader>eF - Format all files
" <leader>et - Run tests for current file
" <leader>eT - Run all tests
" <leader>el - Run test at current line
" <leader>ec - Compile project
" <leader>er - Run Credo on current file
" <leader>ed - Run Dialyzer
" <leader>eg - Generate documentation
" <leader>ei - Open IEx REPL
" <leader>ep - Start Phoenix server in IEx
" <leader>eh - Open hex docs for word under cursor
" <leader>ea - Toggle between test and implementation
" <leader>es - Show diagnostics
" ============================================================================

" ============================================================================
" Python Keybindings Quick Reference:
" <leader>pr - Run current Python file
" <leader>pt - Run in terminal split
" <leader>pT - Run pytest for current file
" <leader>pa - Run all pytest tests
" <leader>pf - Format with black
" <leader>pl - Lint with flake8
" <leader>pi - Open Python REPL
" <leader>pI - Open IPython REPL
" <leader>ps - Show type information
"
" Universal keybindings (work in all languages including Python & Elixir):
" gd - Go to definition
" gy - Go to type definition
" gi - Go to implementation
" gr - Find all references
" K - Show hover documentation
" <leader>rn - Rename symbol
" <leader>ca - Code actions
" ============================================================================

" ============================================================================
" JavaScript/TypeScript Keybindings Quick Reference:
" <leader>jr - Run current JS/TS file
" <leader>jt - Run in terminal split
" <leader>jT - Run test for current file
" <leader>ja - Run all tests
" <leader>jf - Format with Prettier
" <leader>jl - ESLint autofix
" <leader>jc - Compile TypeScript
" <leader>jo - Organize imports
" <leader>jR - Rename file (updates imports)
"
" Universal keybindings work for JS/TS too (gd, gr, K, etc.)
" ============================================================================
