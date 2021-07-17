"
"           Liam's init.vim
"°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸
"
"

syntax on


"~~~~PLUGINS~~~~

call plug#begin('~/.vim/plugged')
                                                            
Plug 'oblitum/rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'sainnhe/gruvbox-material'
"Plug 'scrooloose/nerdtree'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'

call plug#end()


"~~~SETTINGS~~~
    
set nohlsearch
set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set cmdheight=1
set expandtab
set smartindent
set nu 
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=82
set foldmethod=indent
set foldlevel=99
set pyxversion=3
set splitbelow
set scrolloff=5
set mouse=a

highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:gruvbox_material_background = 'medium'
colorscheme gruvbox-material
set background=dark
hi Normal guibg=NONE ctermbg=NONE

let g:lightline = {'colorscheme' : 'seoul256'}


call lightline#init()
call lightline#colorscheme()

source $HOME/.config/nvim/plug-config/coc.vim


if has('python')                                                          
    set pyx=2                                                               
elseif has('python3')                                                     
    set pyx=3                                                               
endif

"~~~REMAPS~~~


let mapleader = ","

"nmap <leader>ne :NERDTree<cr>
nmap <leader>ne :CocCommand explorer<cr>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references) 
nmap <F2> <Plug>(coc-rename)

nnoremap <leader>f :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

inoremap jj <ESC>

"Terminal
tnoremap jj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

"For latex
:map <leader>c :w<CR>:!bash ~/Documents/latex/compileLatex.sh<CR>


"For Python
":map <leader>c :w<CR><C-J>apython3 setup.py<CR>

vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"autocmd BufReadPre *.tex let b:vimtex_main = 'Documentation.tex'
au FileType tex let b:main_tex_file='Documentation.tex'

"~~~AutoOpen~~~

"autocmd VimEnter * NERDTree
"autocmd VimEnter * CocCommand explorer 
autocmd VimEnter * RainbowToggle
"autocmd VimEnter * Startify 
"
"


function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction


"Automatic getters and setters 

inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "\<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "\<up>"
