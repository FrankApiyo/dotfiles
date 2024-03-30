colorscheme desert
" Flags
set nocompatible 		" disable compatibility with old-time vi
set showmatch 			" show matching
set ignorecase 			" case insensitive
" set mouse=v			" middle-click paste with
set hlsearch			" highlight search
set incsearch			" incremental search
set tabstop=4			" number of columns occupied by tab
set softtabstop=4		" see multiple spaces as tab stops so <BS> does the right thing
set expandtab			" converts tabs to white space
set shiftwidth=4		" width for auto-indents
set autoindent			" indent a new line the same amount as the line just typed
set number relativenumber			" add line numbers
set wildmode=longest,list	" get bash-like tab completions
set cc=80			" set an 80 column border for good coding style
set textwidth=80
set max_line_length="off"
filetype plugin indent on 	" allow auto-indenting depending on the file type
syntax on			" syntax highlighting
" set mouse=a			" enable mouse click
set mouse=
" set clipboard=unamedplus	" using system clipboard
filetype plugin on
set cursorline			" highlight current cursor-line
set ttyfast			" speed up the scrolling in vim
set spell			" Enable spellcheck
set noswapfile			" disable creating swap-file
" set backupdir=~/.cache/vim	" Directory to store backup files

" Plugins-- Set option
" vim.o.nocompatmpmpatible = 1
" vim.o.showmatch = 1

"vim.o.ignorecase = 1
"vim.o.hlsearch = 1
"vim.o.incsearch
call plug#begin("~/.vim/plugged")
" Plugin Section
" Plug 'dracula/vim', {'as':'dracula'}
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'

" Using vim-plug
Plug 'elixir-editors/vim-elixir', {'branch':'master'}

" structural editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'

" Conjure!
Plug 'Olical/conjure'
call plug#end()

" Evaluate clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" Git blame does not want conflicts
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

let g:NERDTreeWinSize = 30
let g:NERDTreeAutoCenter = 0
let g:NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
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

lua << EOF
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
require('telescope').setup{
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
                -- theme = {}, -- use own theme spec
                -- layout_config = { mirror=true }, -- mirror preview pane
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

:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <ESc>


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

" alays open NERDTree
autocmd VimEnter * NERDTree

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" treversing buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
noremap <silent> [T :tabfirst<CR>
noremap <silent> ]T :tablast<CR>
