
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'rking/ag.vim'

" Styling
Plug 'mhartington/oceanic-next'
Plug 'reedes/vim-colors-pencil'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

" UI
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Soure Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Code
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Windows
Plug 'jimsei/winresizer'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme OceanicNext

let mapleader = ','

set clipboard+=unnamed
set pastetoggle=<f6>
set nopaste
autocmd BufWritePre * %s/\s\+$//e
set number

" Copy to osx clipboard
vnoremap <C-c> "*y<CR>
vnoremap y myy`y
vnoremap Y myY`y

map <esc> :noh<cr>

" Code ---------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" vim-rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" neomake
autocmd! BufWritePost * Neomake

" Navigation ----------------------------------------------------------------
" Fix for vim-tmux-navigator in neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" NERDTree ------------------------------------------------------------------{{{

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let g:NERDTreeAutoDeleteBuffer=1

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction


call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#141e23')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#141e23')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#141e23')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#141e23')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#141e23')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#141e23')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#141e23')
" call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', '#141e23')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#141e23')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#141e23')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#141e23')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#141e23')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#141e23')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#141e23')

"}}}


" vim-airline ---------------------------------------------------------------{{{
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set guifont=SauceCodePro\ Nerd\ Font\ Regular:h13
"}}}


