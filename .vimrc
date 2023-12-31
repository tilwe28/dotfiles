set number
set relativenumber
syntax on

set backspace=indent,eol,start " allow backspacing over everything

set termguicolors

" Show status line w/ file number
set ls=2

" Show commands being entered
set showcmd

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
map <esc> :noh <CR>

" Show marker at column
autocmd FileType gitcommit set colorcolumn=51,73
""autocmd FileType cpp set colorcolumn=80
highlight ColorColumn ctermbg=239

" Tabs
set expandtab " Use space characters
set tabstop=4 " Amount of space characters
set shiftwidth=4 " Amount of spaces >> does
set softtabstop=4 " Backspace over spaces like single tab
set autoindent
autocmd FileType mk.make set noexpandtab " Makefiles need tab

" Command autocompletion
set wildmode=longest,list
set wildmenu

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Theme
colorscheme wildcharm
"" hi Normal guibg=NONE ctermbg=NONE
hi Normal guibg=#121212 ctermbg=233

set viminfo+=n~/config/vim/viminfo
