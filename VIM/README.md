## file type
```bash
set ff=unix
```

## .vimrc
- vi ~/.vimrc

```bash
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
syntax on
set list
set colorcolumn=80
```

## Change encoding EUCKR to UTF-8
```
e ++enc=euckr
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
```

## Remove matched lines

```
g/REGEX/d
```

## Remove white spaces

```
:%s/\s\+$//e
```

# Syntax highlighting

- [VIM Ployglot](https://github.com/sheerun/vim-polyglot)
- [Dart](https://github.com/dart-lang/dart-vim-plugin)
