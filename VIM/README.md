## file type
```bash
set ff=unix
```

## .vimrc
- vi ~/.vimrc

```bash
set number "Indicate Line Number
set tabstop=4 "Tab Size Setting
set shiftwidth=4 "Shift Size Setting
set expandtab "Tab to space
set autoindent "Auto Indent
syntax on "Highlight Syntax
set list " View white spaces
autocmd FileType make setlocal noexpandtab " Back to tab from space
autocmd FileType automake setlocal noexpandtab " Back to tab from space
autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 " Back to tab from space
autocmd FileType html setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType css setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
autocmd FileType tex setlocal colorcolumn=0 " Back to color column
set colorcolumn=80
```

## Change encoding EUCKR to UTF-8
```
e ++enc=euckr
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
```
