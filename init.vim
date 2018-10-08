runtime! debian.vim

if has("syntax")
  syntax on
endif

"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

"if has("autocmd")
"  filetype plugin indent on
"endif

"set showcmd   	  	" Show (partial) command in status line.
"set smartcase 	  	" Do smart case matching
"set hidden    	  	" Hide buffers when they are abandoned
"set mouse=a   	  	" Enable mouse usage (all modes)

set statusline=%f\ %l,%c
set background=dark
set showmatch  	  	" Show matching brackets.
set ignorecase 	  	" Do case insensitive matching
set incsearch  	  	" Incremental search
set autowrite  	  	" Automatically save before commands like :next and :make

set ts=4
set autoindent
set nu
set tabstop=4 shiftwidth=4
set expandtab
set foldmethod=syntax
""set nofoldenable
""set foldmethod=indent
""set foldnestmax=10
""set foldlevel=1

set list listchars=tab:→\ ,trail:·
setlocal omnifunc=syntaxcomplete#Complete

set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ternjs/tern_for_vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'scrooloose/syntastic'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

call plug#begin("~/.config/nvim/bundle/")
Plug 'Valloric/YouCompleteMe'
Plug 'critiqjo/lldb.nvim'
Plug 'neovim/python-client'
Plug 'lervag/vimtex'
call plug#end()
filetype plugin indent on
autocmd FileType java setlocal omnifunc=javacomplete#Complete

map <F2> :NERDTreeToggle<cr>
map <F3> :tabnext<cr>
map <F4> :tabprev<cr>
map <F5> :TagbarToggle<cr>
map <F6> :JCimportsAddMissing<cr>
map <F7> :JCimportsRemoveUnused<cr>
map <F8> <Plug>LLBreakSwitch
map <F12> :windo wincmd H<cr>

"execute pathogen#infect()

let mapleader = ","
let maplocalleader = ","
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic Options and Configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_loc_list_height = 15

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" Checkers para los distintos lenguajes.
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_c_checkers = []
"let g:syntastic_cpp_checkers = ['clang_check']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_cpp_include_dirs = []

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -pthread -Wl,--no-as-needed"
let g:syntastic_cpp_config_file = ".syntastic_cpp_config"

let g:syntastic_mode_map = { 'passive_filetypes': [''] }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" UltiSnips Options and Configuration

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<c-l>"

let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" YouCompleteMe Options and Configuration

let g:ycm_show_diagnostics_ui = 0 "default 1
let g:ycm_key_invoke_completion = '<C-Space>'

" Make YCM compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<s-tab>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<c-tab>', '<Up>', '<C-k>']

if(!exists('g:ycm_semantic_triggers'))
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:ycm_confirm_extra_conf = 0

"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_always_populate_location_list = 1 "default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"
"let g:ycm_complete_in_strings = 1 "default 1
"let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3' "default ''
"
"let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
"let g:ycm_server_log_level = 'info' "default info
"let g:ycm_warning_symbol = '>>'
"let g:ycm_error_symbol = '>>'
"
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
"
"let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"let g:ycm_filetype_whitelist = { '*': 1 }
"
"nnoremap <F10> :YcmForceCompileAndDiagnostics <CR>

