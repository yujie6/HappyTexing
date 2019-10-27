filetype plugin indent on 
syntax on
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:vimtex_compiler_latexmk = {
        \ 'background' : 1,
        \ 'continuous' : 1,
        \ 'build_dir' : '.',
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \ ],
        \}
Plug 'drewtempelmeyer/palenight.vim'
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'vim-airline/vim-airline'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
Plug 'neomake/neomake'
call plug#end()


colorscheme palenight


set number
set smartindent
set tabstop=4
setlocal spell
set spelllang=en_us,cjk
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
