" Testing
abbr funciton function
abbr teh the
abbr tempalte template
abbr vodi void
abbr (vodi) (void)

" camelCase => camel_case
vnoremap ,case :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

set path+=**
let g:netrw_banner = 0 " disable annoying banner
let g:netrw_browse_split = 4 " open in prior window
let g:netrw_altv = 1 " open splits to the right
let g:netrw_liststyle = 3 " tree view
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" main() {{{1

filetype plugin indent on

let mapleader=','
let g:mapleader=','

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Plugin Manager {{{1
let g:dein_repo = 'https://github.com/Shougo/dein.vim.git'
let g:dein_dir = '~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'

if empty(glob(g:dein_dir))
  exec 'silent !mkdir -p '.g:dein_dir
  exec '!git clone '.g:dein_repo.' '.g:dein_dir
endif
exec 'set runtimepath+='.g:dein_dir

call dein#begin('~/.config/nvim/dein')

call dein#add('Shougo/dein.vim')

" Enabled Plugins {{{2
call dein#add('tpope/tpope-vim-abolish')
call dein#add('tpope/vim-capslock')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('easymotion/vim-easymotion')
call dein#add('godlygeek/tabular')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-visual-star-search')
call dein#add('yuttie/comfortable-motion.vim')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('tommcdo/vim-exchange')
call dein#add('nanotech/jellybeans.vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('morhetz/gruvbox')
call dein#add('vim-syntastic/syntastic')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tmux-plugins/vim-tmux')

" call dein#update()

" Disabled Plugins {{{2
" call dein#add('yggdroot/indentline')
" call dein#add('roxma/nvim-completion-manager')
" call dein#add('roxma/clang_complete')
" call dein#add('SirVer/ultisnips')
" call dein#add('honza/vim-snippets')
" call dein#add('Shougo/deoplete.nvim')
" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')
" call dein#add('zchee/deoplete-clang')
" call dein#add('iCyMind/NeoSolarized')
" call dein#add('joshdick/onedark.vim')
" call dein#add('neomake/neomake')

" }}}
call dein#end()
call dein#save_state()
" Install new plugins on startup
if dein#check_install()
  call dein#install()
endif

" Options {{{1
" Colors {{{2
set termguicolors
" set background=dark
let g:jellybeans_use_term_italics = 0
let g:jellybeans_use_gui_italics = 0
" let g:onedark_terminal_italics = 0
" let g:onedark_gui_italics = 0
" let g:gruvbox_bold = 1
" let g:gruvbox_italic = 0
" let g:gruvbox_underline = 0
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_contrast_light = 'soft'
" let g:gruvbox_invert_selection = 0
colorscheme jellybeans
let g:lightline = { 'colorscheme': 'jellybeans', }
" ...disable indent guides default
" let g:indent_guides_auto_colors = 0
" ...color override
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#373F4E
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#4B5263
autocmd VimEnter,Colorscheme * :hi ColorColumn guibg=#840000
" ...why won't this work?
" hi ColorColumn guibg=#840000

" Spaces, tabs, and indents {{{2
set tabstop=8
set softtabstop=8
set shiftwidth=0
set cindent
" ...round tabs to multiple of shiftwidth
" set shiftround
" set expandtab
" set breakindent
" set linebreak
set list
" │  ▸
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮,eol:¬
let &showbreak='↪ '

" UI Config {{{2
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" relative number in terminal normal mode
"autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
set laststatus=2
set showcmd
set cursorline " cursorcolumn
" autocmd WinLeave * setlocal nocursorline
" autocmd WinEnter * setlocal cursorline
set wildmode=longest:full,full
" set lazyredraw
set showmatch
set mouse=a
set inccommand=nosplit " Update expressions in realtime
let &showbreak='↪ '
set cc=80
set cmdheight=2
set ignorecase
set smartcase
set linebreak
set matchtime=2
set noshowmode
set scrolloff=1
set scrolljump=5
set sidescrolloff=5
set fillchars+=vert:┃,fold:\ 
" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" Searching {{{2
set incsearch
set hlsearch

" Folding {{{2
set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=syntax
set foldcolumn=2
set modelines=1

" Backups {{{2
" Don't clutter directories with .swp files
silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup
set backup
set writebackup


" Keymaps {{{1
" Searching {{{2
" remove search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Folding {{{2
" open folds
nnoremap <space> za

" Movement {{{2
" word wrap navigation
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" Make escape work in the Neovim terminal.
tnoremap <Esc> <C-\><C-n>
" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" mouse wheel flick motion (plugin setting)
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" consistent with C and D
nnoremap Y y$
" jk is escape
" inoremap jk <esc>
" Move line vertically
nmap <C-Up> [e
nmap <C-Down> ]e
" Move multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Tabs {{{2
" create new tab
" noremap <silent> <A-t> :$tabnew<CR>
" map <leader>tn :tabnew<CR>
" map <leader>tc :tabclose<CR>
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Convenience {{{2
" quick macro repeat
nnoremap Q @q
" transpose characters (depends on vim-repeat from tpoop)
nmap cp <Plug>TransposeCharacters
nnoremap <silent> <Plug>TransposeCharacters xp
\:call repeat#set("\<Plug>TransposeCharacters")<CR>
" quicker commands
noremap ; :
noremap q; q:
" source config file
nnoremap <Leader>v :so $MYVIMRC<CR>
nnoremap <Leader>e :e $MYVIMRC<CR>
" quick buffer open
" nnoremap gb :ls<cr>:e #
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Plugin Settings {{{1
" deoplete startup
" let g:deoplete#enable_at_startup = 1
" deoplete
"let g:deoplete#enable_at_startup = 1
"set completeopt-=preview
" deoplete clang
" let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
" easymotion
map <Leader> <Plug>(easymotion-prefix)
" nvim completion manager
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"let g:clang_library_path='/usr/lib/libclang.so'
" Tabularize (alignment)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a; :Tabularize /:\zs<CR>
vmap <Leader>a; :Tabularize /:\zs<CR>
" Neomake
" autocmd! BufWritePost * Neomake
" indent guides settings
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" snippet directories for neosnippet
" let g:neosnippet#snippets_directory='~/.config/nvim/dein/repos/github.com/honza/vim-snippets/snippets'
" set completeopt-=preview
" neosnippet settings
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" syntastic recommended newbie defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = ['clang_check']
" }}}

" vim:foldmethod=marker:foldlevel=0
