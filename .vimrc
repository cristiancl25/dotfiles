" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
call plug#end() " Initialize plugin system

" General configuration
set showmatch
set cursorline
set number
set laststatus=2
set t_Co=256
set autoindent
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set hlsearch " Highlight search
set incsearch "Preview of the search
" set nofoldenable " Disables block code contraction

" Mute search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" ZSH autocompletion integration
set wildmenu
set wildmode=full


" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" gruvbox theme
let g:airline_theme='gruvbox'
colorscheme gruvbox
set background=dark
let g:grubvox_contrast='soft'


" NerdTree
map <C-n> :NERDTreeToggle<CR>


" TagBar
" Needs exuberant-ctags installed
nmap <F8> :TagbarToggle<CR>


" vim-go plugin configuration
nmap gi :GoInfo<CR>
nmap gb :GoBuild<CR>
nmap gr :GoReferrers<CR>
nmap gl :GoMetaLinter<CR>


" ALE
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
