" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
set rtp+=~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Base plugins
"
Plug 'tbastos/vim-lua'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'

" Deoplete and snippets
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Syntax support
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'vim-latex/vim-latex'
Plug 'mboughaba/i3config.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'

" ----- to add later when needed ---------
" Plug 'scrooloose/nerdcommenter'
" PLug 'yggdroot/indentline'
"
" Plugins to test later:
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" ---------------------------- END OF PLUGINS -------------
"
" Sane vim defaults for ArchLabs

" Arch defaults
runtime! archlinux.vim

" make vim read the aliases to use on the shell
let $BASH_ENV = "~/.bash_aliases"

" system clipboard (requires +clipboard)
set clipboard^=unnamed,unnamedplus

" additional settings
set modeline           " enable vim modelines
set nohlsearch           " highlight search items
set incsearch          " searches are performed as you type
set confirm            " ask confirmation like save before quit.
set wildmenu           " Tab completion menu when using command mode
set expandtab          " Tab key inserts spaces not tabs
set softtabstop=4      " spaces to enter for each tab
set shiftwidth=4       " amount of spaces for indentation
set shortmess+=aAcIws  " Hide or shorten certain messages
set number relativenumber

set tw=72
set fo=cqt

set ignorecase
set cursorline          "highlight line under the cursor
set background=dark

let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

let g:python3_host_pro=$PYENV_ROOT.'/versions/neovim-g3/bin/python'

" make calcurse notes markdown compatible

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

"
" ------ leader mapping ------

let g:mapleader = ","

" ------ enable additional features ------

" enable mouse
set mouse=a
if has('mouse_sgr')
    " sgr mouse is better but not every term supports it
    set ttymouse=sgr
endif

set linebreak breakindent
set list listchars=tab:>>,trail:~

" midnight, night, or day
"let g:jinx_colors = 'midnight'

try
    colorscheme gruvbox
catch
    colorscheme jinx
endtry

let g:airline_theme='jellybeans'

if $TERM !=? 'linux'
    set termguicolors

    " true colors in terminals (neovim doesn't need this)
    if !has('nvim') && !($TERM =~? 'st' || &term =~? 'xterm')
        let $TERM = 'st-256color'
        let &term = 'st-256color'
    endif

    if has('multi_byte') && $TERM !=? 'linux'
        set listchars=tab:»»,trail:•
        set fillchars=vert:┃ showbreak=↪
    endif
endif

" toggle transparency "
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

" change cursor shape for different editing modes, neovim does this by default
if !has('nvim')
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    else
        let &t_SI = "\e[6 q"
        let &t_SR = "\e[4 q"
        let &t_EI = "\e[2 q"
    endif
endif

" ------ commands ------

command! D Explore
"command! R call <SID>ranger()
command! Q call <SID>quitbuffer()
command! -nargs=1 B :call <SID>bufferselect("<args>")
command! W execute 'silent w !sudo tee % >/dev/null' | edit!

" ------ basic maps ------

" open ranger as a file chooser using the function below
"nnoremap <leader>r :call <SID>ranger()<CR>

" match string to switch buffer
nnoremap <Leader>b :let b:buf = input('Match: ')<Bar>call <SID>bufferselect(b:buf)<CR>

" paste while in insert mode
inoremap <silent><C-v> <Esc>:set paste<CR>a<C-r>+<Esc>:set nopaste<CR>a

" change windows with ctrl+(hjkl)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" alt defaults
nnoremap 0 ^
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==j

" re-visual text after changing indent
vnoremap > >gv
vnoremap < <gv

" toggle line numbers, nn (no number)
""nnoremap <silent> <Leade> r>nn :set number!<CR>

" j = gj :: k = gk  while preserving numbered jumps eg. 12j
nnoremap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nnoremap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" open a terminal in $PWD
nnoremap <silent> <Leader>tt :terminal<CR>

" tab control
" default settings
nnoremap <silent> <M-j> :tabmove -1<CR>
nnoremap <silent> <M-k> :tabmove +1<CR>
nnoremap <silent> <Leader>te :tabnew<CR>
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>tp :tabprevious<CR>
nnoremap <silent> <Leader>tf :tabfirst<CR>

" close current buffer and/or tab
nnoremap <silent> <Leader>q :B<CR>:silent tabclose<CR>gT
nnoremap <silent> <Leader>tl :execute "tabn ".g:lasttab<CR>

" open a new tab in the current directory with netrw
nnoremap <silent> <Leader>- :tabedit <C-R>=expand("%:p:h")<CR><CR>

" split the window vertically and horizontally
nnoremap _ <C-W>s<C-W><Down>
nnoremap <Bar> <C-W>v<C-W><Right>

" copy whole line
noremap Y y$

" ------ additional maps ---
"  easier pane navigation

""nnoremap <C-w> <C-w>
""nnoremap <C-j> <C-w>j
""nnoremap <C-k> <C-w>k
""nnoremap <C-h> <C-w>h
""nnoremap <C-l> <C-w>l

" ------ autocmd ------

let g:lasttab = 1
augroup save_last_tab
    autocmd!
    autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" Reload changes if file changed outside of vim requires autoread
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from source file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" when not running in a console or a terminal that doesn't support 256 colors
" enable cursorline in the currently active window and disable it in inactive ones
if $DISPLAY !=? '' && &t_Co == 256
    augroup cursorline
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
    augroup END
endif

" ------ adv maps ------


" strip trailing whitespace, ss (strip space)
nnoremap <silent> <Leader>ss
            \ :let b:_p = getpos(".") <Bar>
            \  let b:_s = (@/ != '') ? @/ : '' <Bar>
            \  %s/\s\+$//e <Bar>
            \  let @/ = b:_s <Bar>
            \  nohlsearch <Bar>
            \  unlet b:_s <Bar>
            \  call setpos('.', b:_p) <Bar>
            \  unlet b:_p <CR>

" global replace
vnoremap <Leader>sw "hy
            \ :let b:sub = input('global replacement: ') <Bar>
            \ if b:sub !=? '' <Bar>
            \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
            \   execute '%s/'.b:rep."/".b:sub.'/g' <Bar>
            \   unlet b:sub b:rep <Bar>
            \ endif <CR>
nnoremap <Leader>sw
            \ :let b:sub = input('global replacement: ') <Bar>
            \ if b:sub !=? '' <Bar>
            \   execute "%s/<C-r><C-w>/".b:sub.'/g' <Bar>
            \   unlet b:sub <Bar>
            \ endif <CR>

" prompt before each replace
vnoremap <Leader>cw "hy
            \ :let b:sub = input('interactive replacement: ') <Bar>
            \ if b:sub !=? '' <Bar>
            \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
            \   execute '%s/'.b:rep.'/'.b:sub.'/gc' <Bar>
            \   unlet b:sub b:rep <Bar>
            \ endif <CR>

nnoremap <Leader>cw
            \ :let b:sub = input('interactive replacement: ') <Bar>
            \ if b:sub !=? '' <Bar>
            \   execute "%s/<C-r><C-w>/".b:sub.'/gc' <Bar>
            \   unlet b:sub <Bar>
            \ endif <CR>

" highlight long lines, ll (long lines)
let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth)
nnoremap <silent> <Leader>ll
            \ :if exists('w:longlines') <Bar>
            \   silent! call matchdelete(w:longlines) <Bar>
            \   echo 'Long line highlighting disabled'
            \   <Bar> unlet w:longlines <Bar>
            \ elseif &textwidth > 0 <Bar>
            \   let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth) <Bar>
            \   echo 'Long line highlighting enabled'
            \ <Bar> else <Bar>
            \   let w:longlines = matchadd('ColorColumn', '\%80v', 81) <Bar>
            \   echo 'Long line highlighting enabled'
            \ <Bar> endif <CR>

" local keyword jump
nnoremap <Leader>fw
            \ [I:let b:jump = input('Go To: ') <Bar>
            \ if b:jump !=? '' <Bar>
            \   execute "normal! ".b:jump."[\t" <Bar>
            \   unlet b:jump <Bar>
            \ endif <CR>


" quit the current buffer and switch to the next
" without this vim will leave you on an empty buffer after quiting the current
function! <SID>quitbuffer() abort
    let l:bf = bufnr('%')
    let l:pb = bufnr('#')
    if buflisted(l:pb)
        buffer #
    else
        bnext
    endif
    if bufnr('%') == l:bf
        new
    endif
    if buflisted(l:bf)
        execute('bdelete! ' . l:bf)
    endif
endfunction

" switch active buffer based on pattern matching
" if more than one match is found then list the matches to choose from
function! <SID>bufferselect(pattern) abort
    let l:bufcount = bufnr('$')
    let l:currbufnr = 1
    let l:nummatches = 0
    let l:matchingbufnr = 0
    " walk the buffer count
    while l:currbufnr <= l:bufcount
        if (bufexists(l:currbufnr))
            let l:currbufname = bufname(l:currbufnr)
            if (match(l:currbufname, a:pattern) > -1)
                echo l:currbufnr.': '.bufname(l:currbufnr)
                let l:nummatches += 1
                let l:matchingbufnr = l:currbufnr
            endif
        endif
        let l:currbufnr += 1
    endwhile

    " only one match
    if (l:nummatches == 1)
        execute ':buffer '.l:matchingbufnr
    elseif (l:nummatches > 1)
        " more than one match
        let l:desiredbufnr = input('Enter buffer number: ')
        if (strlen(l:desiredbufnr) != 0)
            execute ':buffer '.l:desiredbufnr
        endif
    else
        echoerr 'No matching buffers'
    endif
endfunction

"  open ranger as a file chooser
"function! <SID>ranger()
"    let l:temp = tempname()
"    execute 'silent !xterm -e ranger --choosefiles='.shellescape(l:temp).' $PWD'
"    if !filereadable(temp)
"        redraw!
"        return
"    endif
"    let l:names = readfile(l:temp)
"    if empty(l:names)
"        redraw!
"        return
"    endif
"    execute 'edit '.fnameescape(l:names[0])
"    for l:name in l:names[1:]
"        execute 'argadd '.fnameescape(l:name)
"    endfor
"    redraw!
"endfunction
"
"----------- Additional mappings for editing
"
"


" ------------- plugin configurations ------------
" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete=1

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" syntastic -----------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" easymotion -----------

" hjkl motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Goyo & Limelight -----------

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" mappings for goyo and limelight
nnoremap <Leader>gy :Goyo<CR>
nnoremap <Leader>gl :Limelight<CR>

" vim-markdown -----------

" change folding style
let g:vim_markdown_folding_style_pythonic = 1

" set header folding level
let g:vim_markdown_folding_level = 1

" Nvim-R -----------
"
" highlighting chunks
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1

" start libraries
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods'

" latex options -----------

let R_latexcmd = ['pdflatex']
let R_openhtml = 1
let R_openpdf = 1

" paste on the next line -----------

nmap P :pu<CR>
nmap W :wq<CR>
nmap <Leader>w :w<CR>
nmap Q :q!<CR>

" mappgings for git -----------

nnoremap <Leader>g :Git <Space>
nnoremap <Leader>gs :Gstatus <CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>go :Gcheckout<Space>
nnoremap <Leader>gb :Gbranch<Space>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gpl :Git pull<CR>

nnoremap <Leader>gg :GitGutterToggle<CR>
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
nmap <Leader>hf :GitGutterFold<CR>

" mappings for vim-plug -----------

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" mapping to change the keymaps ---
"
nnoremap <Leader>ei :!setxkbmap -layout us -variant intl<CR><CR>
nnoremap <Leader>eu :!setxkbmap -layout us -variant mac<CR><CR>
