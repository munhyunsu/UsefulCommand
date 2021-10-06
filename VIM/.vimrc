set number "Indicate Line Number
set tabstop=4 "Tab Size Setting
set shiftwidth=4 "Shift Size Setting
set expandtab "Tab to space
set autoindent "Auto Indent
set list "New line and tab
syntax on "Highlight Syntax
autocmd FileType make setlocal noexpandtab " Back to tab from space
autocmd FileType automake setlocal noexpandtab " Back to tab from space
autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 " Back to tab from space
autocmd FileType html setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType css setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType tex setlocal colorcolumn=0 " Back to color column
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
set colorcolumn=80
set list "Invisible View
"set listchars=tab:\|\ "Tab Syntax
"set listchars=tab:>-     "Tab Syntax2

"noremap <F8> :call HexMe()<CR>
"let $in_hex=0
"function HexMe()
"	if $in_hex>0
"		:%!xxd -r
"		let $in_hex=0
"		set binary!
"		set noeol!
"	else
"		set binary
"		set noeol
"		:%!xxd
"		let $in_hex=1
"	endif
"endfunction

noremap <F8> :call ToggleHex()<CR>
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
