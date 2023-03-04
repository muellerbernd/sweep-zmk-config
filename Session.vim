let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/GithubProjects/my-mechanical-keyboard-journey/sweep-zmk-config
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +123 config/cradio.keymap
badd +2 german.dtsi
argglobal
%argdel
$argadd config/cradio.keymap
edit config/cradio.keymap
argglobal
balt german.dtsi
setlocal fdm=indent
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
19
normal! zo
33
normal! zo
42
normal! zo
50
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
63
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
80
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
96
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
114
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
131
normal! zo
let s:l = 1 - ((0 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
