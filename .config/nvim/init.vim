let mapleader = ' '
let maplocalleader = ' '
set number
set laststatus=2
set noshowmode
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set shortmess+=c

set lazyredraw
set cmdheight=2
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap=<,>,h,l
set clipboard+=unnamedplus
set nowrap list linebreak hidden
set scrolloff=5
set iskeyword-=/,#
set completeopt-=preview
set signcolumn=yes
set termguicolors
set mouse=a

set wrapscan ignorecase hlsearch incsearch
set inccommand=nosplit
set gdefault
set virtualedit=block

set autoread noswapfile nobackup nowritebackup
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent smartindent

set splitright
cnoremap <c-p> <up>
cnoremap <c-n> <down>

nnoremap Q @q
nnoremap gV `[v`]
map q: <nop>
map q/ <nop>
map q? <nop>
nnoremap c* /\<<cr>=expand('<cword>')<cr>\>\C<cr>``cgn
nnoremap c# ?\<<cr>=expand('<cword>')<cr>\>\C<cr>``cgn
nnoremap d* /\<<cr>=expand('<cword>')<cr>\>\C<cr>``dgn
nnoremap d# ?\<<cr>=expand('<cword>')<cr>\>\C<cr>``dgn

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
inoremap <c-s> <c-g>u<esc>[s1z=`]a<c-g>u " autocorrect the nearest mistake

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


call plug#begin('~/.config/nvim/plug')
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'moll/vim-bbye'
Plug 'google/vim-searchindex'
Plug 'junegunn/vim-slash'
nnoremap <plug>(slash-after) zz
autocmd InsertEnter * :set nohlsearch
Plug 'kopischke/vim-stay'

Plug 'vim-airline/vim-airline'
let g:enable_bold_font = 1
let g:one_allow_italics = 1
let g:airline_theme = 'one'
let g:airline_extensions = [
      \ 'virtualenv', 'capslick', 'tabline',
      \ 'branch', 'coc', 'term', 'vimagit',
      \ 'po', 'whitespace',
      \ 'wordcount' ]
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
for i in [1,2,3,4,5,6,7,8,9]
  execute "nmap <space>".i." <plug>AirlineSelectTab".i
endfor
Plug 'rakr/vim-one'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'kana/vim-operator-user'
Plug 'tpope/vim-capslock' " i-^L
Plug 'rhysd/conflict-marker.vim' " ct/co/cn/cb
Plug 'tpope/vim-commentary' " gc
Plug 'tpope/vim-abolish' " cr
Plug 'tommcdo/vim-exchange' " cx
Plug 'svermeulen/vim-subversive'
nmap cp <plug>(SubversiveSubstitute)
nmap cpp <plug>(SubversiveSubstituteLine)
nmap cP <plug>(SubversiveSubstituteToEndOfLine)
Plug 'junegunn/vim-easy-align' " space a
nmap <leader>a <plug>(EasyAlign)

Plug 'chaoren/vim-wordmotion'
let g:wordmotion_prefix = 'g'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim' " all pairs and arguments
let g:targets_aiAI = 'aIAi'
Plug 'andymass/vim-matchup' " %
Plug 'michaeljsmith/vim-indent-object' " i/I
Plug 'Julian/vim-textobj-variable-segment' " vi/va
Plug 'FooSoft/vim-argwrap'
nnoremap <silent> <leader>s :ArgWrap<cr>
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'tpope/vim-projectionist'

Plug 'kana/vim-submode'
Plug 'machakann/vim-sandwich'
let g:sandwich_no_default_key_mappings = 0
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutFastWrap='<a-]>'
let g:AutoPairsShortcutJump = ''
inoremap <c-]> <esc>:call AutoPairsJump()<cr>a
Plug 'tpope/vim-endwise'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'tpope/vim-characterize'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'camspiers/lens.vim'

let g:python_recommended_style = 0
Plug 'ap/vim-css-color'
Plug 'mboughaba/i3config.vim'
let g:lua_syntax_fold = 1
Plug 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup end
let g:tex_flavor = 'latex'
Plug 'lervag/vimtex'
let g:vimtex_fold_enabled = 1
let g:vimtex_vimew_method = 'mupdf'
let g:vimtext_compiler_progname = 'nvr'
let g:vimtext_compiler_method = 'latexmk'


Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_next = '<c-k>'
autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')

let g:coc_global_extensions = [
            \ 'coc-lists', 'coc-snippets',
            \ 'coc-pyright', 'coc-python',
            \ 'coc-tsserver', 'coc-json', 
            \ 'coc-css', 'coc-svelte', 'coc-html',
            \ 'coc-vimtex', 'coc-texlab',
            \ 'coc-sh', 'coc-vimlsp',
            \ 'coc-db', 'coc-restclient'
            \ ]
function! SetupCoc()
  if &foldmethod == 'manual'
    setlocal foldmethod=syntax
  endif
  setlocal formatexpr=CocAction('formatSelected')
  setlocal keywordprg=:call\ CocAction('doHover')
  nmap <silent><buffer> [s <plug>(coc-diagnostic-prev)
  nmap <silent><buffer> ]s <plug>(coc-diagnostic-next)
  nmap <buffer> z= <plug>(coc-fix-current)
endfunction

augroup coc
  autocmd!
  autocmd FileType python call SetupCoc()
  autocmd FileType html,javascript,typescript,svelte call SetupCoc()
augroup end
let g:pydoc_executable = 0

Plug 'honza/vim-snippets'

call plug#end()
filetype plugin indent on

set background=dark
silent! colorscheme one

call one#highlight('Folded', '888888', 'none', 'none')
call one#highlight('MatchMaker', 'none', '333333', 'none')
call one#highlight('ExtraWhiteSpace', 'none', 'none', 'none')
call one#highlight('Conceal', 'none', 'none', 'none')
call one#highlight('SignatureMarkText', 'aaaa00', 'none', 'none')
call one#highlight('Search', 'e06c75', 'none', 'italic')
call one#highlight('IncSearch', 'e06c75', 'none', 'underline')
call one#highlight('Sneak', '5c6370', 'none', 'none')
call one#highlight('MatchParen', 'e5c07b', 'none', 'italic')

runtime macros/sandwich/keymap/surround.vim
let g:sandwich#recipes += [
\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
\
\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
\
\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
\
\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['{']},
\
\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['[']},
\
\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['(']},
\ ]
