" NeoVIM configurations

" ----------------------- "
" Plugin & their settings "
" ----------------------- "
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged/')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()

" lsp
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}

" completion-nvim
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

" semshi
function CustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=223 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=208 guifg=#5f5f00
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=66 guifg=#ff0000
    hi semshiAttribute       ctermfg=223  guifg=#00ffaf
    hi semshiSelf            ctermfg=208 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=104 guifg=#fffff ctermbg=232 guibg=#d7005f
endfunction
autocmd FileType python call CustomHighlights()
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>

" fzf (Originally, 'Ctrl-p' works same as 'p')
nnoremap <C-p> :FZF<CR>

" gruvbox
colorscheme gruvbox


" ------------ "
" Basic config "
" ------------ "
set number " display line number
set relativenumber " display relative line number
set expandtab " convert tab to spaces
set tabstop=4 " set tab as 4-white-spaces
set shiftwidth=4
set softtabstop=4 " delete tab with backspace
set ignorecase
set smartcase
set scrolloff=5 " show lines above and below cursor (when possible)
set showmatch " show matching braces when text indicator is over them
set hidden
set mouse+=a " enable mouse mode (scorlling, selection, etc)
set updatetime=300
set signcolumn=yes


" -------------- "
" Other settings "
" -------------- "
"let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '$HOME/anaconda3/bin/python'
" unbind keys for tmux
map <C-a> <Nop>

" highlihg current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" quicker window movement in terminal
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" netrw (built-in file-browser)
let g:netrw_bufsettings = 'rnu'
nnoremap <leader>e :Explore<CR>
nnoremap <leader>v :Vexplore<CR>

" terminal
au TermOpen * setlocal nonumber norelativenumber signcolumn=no


" ------------------------ "
" Language specific config "
" ------------------------ "
autocmd FileType python setlocal textwidth=100
autocmd FileType json syntax match Comment +\/\/.\+$+
