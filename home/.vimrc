" ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░
source ~/.vim/bundles.vim						"load plugins
" set leader key "
let g:mapleader = "\<Space>"

" map easier exit of insert mode
inoremap jk <Esc>
colorscheme gruvbox                             "set colorscheme
syntax on

" general bindings "
nnoremap , m'<ESC>:
nnoremap <Leader>= m'gg=G`'
nnoremap <Leader>pp :set paste!<CR>
nnoremap <Leader>; m'A;<ESC>`'
nnoremap <Leader>dd m'VGdd<ESC>`'
nnoremap <Leader>du m'Vggdd<ESC>`'
nnoremap <Leader>vc :source ~/.vimrc<CR>:echo "Reloaded .vimrc"<CR>
nnoremap <Leader>re m'<ESC>:%s/foo/bar/g
nnoremap <Leader>no m'<ESC>:set nonumber<Enter>
nnoremap <Leader>np m'<ESC>:set number<Enter>
nnoremap <C-h> m'<ESC>:wincmd h<Enter>
nnoremap <C-l> m'<ESC>:wincmd l<Enter>
nnoremap <Leader>v m'<ESC>:hi LineNr ctermfg=black<Enter>		"hide line number, but keep indent
nnoremap <Leader>c m'<ESC>:hi LineNr ctermfg=darkgray<Enter>

set clipboard=unnamedplus                  			"xclip support
set numberwidth=10
set tags=.tags                                      "make tagefiles hidden
set tagcase=match                                   "match case when searching for tags
set title                                           "Update window title
set hidden                                          "Allow to leave buffer without saving
set showcmd                                         "Show keys pressed in normal
set tabstop=4                                       "Shorter hard tabs
set softtabstop=0                                   "no spaces
set smarttab
set conceallevel=2
set shiftwidth=4                                    "Shorter shiftwidth
set autoindent                                      "Auto indent newline
set scrolljump=-15                                  "Jump 15 when moving cursor bellow screen
set lazyredraw                                      "redraw only when needed faster macros
set shortmess=aAtcT                                 "get rid of annoying messagesc
set incsearch smartcase ignorecase hlsearch         "better search
set backspace=2                                     "backspace through anything
set foldmethod=syntax                               "Enable folding
set foldlevel=99                                    "start with all folds open
set nowildmenu                                      "Autocompletion of commands
set wildmode=list:full								" tab list
set wildignorecase
set wildignore=*.git/*,*.tags,tags,*.o,*.class,*.ccls-cache
set path+=**10
set splitbelow
set splitright
set number											" Show linenumbers
set laststatus=2 									" Formats the statusline
set noshowmode
set noshowcmd
set cmdheight=1
set shortmess+=F

" some variables "
let g:name = 'Daniel Palm'

" statusline 
hi NormalColor ctermbg=46 ctermfg=0
hi InsertColor ctermbg=51 ctermfg=0
hi ReplaceColor ctermbg=165 ctermfg=0
hi VisualColor ctermbg=Black ctermfg=Red
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%F
set statusline+=\
set statusline+=%l
highlight EndOfBuffer ctermfg=black ctermbg=black   "hide left ~
"https://www.developmenttools.com/ascii-art-generator/?csrfmiddlewaretoken=Y4qf6rmMDcNOcDOsvXVVN9MK8xwoQMTfF0u8arBIXaA8yQxKmJNeHq9fCB6ZoSKU&inputText=vim#p=display&f=Bloody&t=rvim
" vim dashboard 
let g:startify_custom_header = [
		  \' 		´		´		',
	  	  \' o           |   .        ___---___                    .      	',
		  \'        .   -0-        .--\        --.     .     .         .	',
		  \'             |       ./.;_.\     __/~ \.     					',
		  \'                    /;  / `-´  __\    . \                       ', 
		  \'  .        .       / ,--´     / .   .;   \        |				',
		  \'                  | .|       /       __   |      -O-       .	',
		  \'                 |__/    __ |  . ;   \ | . |      |				',
		  \'                 |      /  \\_    . ;| \___|    				',
		  \'    .    o       |      \  .~\\___,--´     |           .		',
 		  \'                 |     | . ; ~~~~\_    __|						',
		  \'     |             \    \   .  .  ; \  /_/   .					',
		  \'    -O-        .    \   /         . |  ~/                  .	',
		  \'     |    .          ~\ \   .      /  /~          o				',
 		  \'  .                   ~--___ ; ___--~       					',
		  \'                  .          ---         .                 		',
		  \' 		--~~~=:>[XXXXXXXXX]>   ´    .           ´      			',
		  \' 		´		´		.		o		´				.		',
		  \' 									_							',
		  \'	 ___ _ __  __ _  __  ___ __ __(_) _ __ 						',
		  \'	(_-<| ´_ \/ _´ |/ _|/ -_)\ V /| || ´  \ 					',
		  \' 	/__/| .__/\__._|\__|\___| \_/ |_||_|_|_| 					',
		  \'  	    |_|														',
		  \ ]
let g:startify_list_order = [
      \ ['   recents:'],
      \ 'files',
      \ ['   sessions:'],
      \ 'sessions',
      \ ['   bookmarks:'],
      \ 'bookmarks',
      \ ]
