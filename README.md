# Oceanic Material

![](https://user-images.githubusercontent.com/41671631/81046200-6a971880-8eea-11ea-999d-4170a364ec1d.png)

Oceanice_Material is a dark colorscheme for vim/neovim

- Most filetype support
- Most plugins support
- Fast startup time

## Installation

- vim-plug
  ```viml
  plug 'hardcoreplayers/oceanic-material'
  ```
- dein
  ```viml
  call dein#add('hardcoreplayers/oceanic-material')
  ```
  Then add this on your vimrc

```viml
set background=dark
colorscheme oceanic_material
```

## Options

If you doesn't like some of the code to be bolded, like functions and language controls, add this option to vimrc:

```viml
let g:oceanic_material_enable_bold = 0
```

If you want comments to be in italic, also add this:

```viml
let g:oceanic_material_enable_italic = 1
```

To use transparent background, add this option:

```viml
let g:oceanic_material_transparent_background = 1
```

If you doesn't like underline reverse undercurl, you can add these option:

```viml
let g:oceanic_material_enable_underline = 1
let g:oceanic_material_enable_undercurl = 1
let g:oceanic_material_enable_reverse = 1
```

## Thanks to

- [equinusocio/material-theme](https://github.com/equinusocio/material-theme)

- [NLKNguyen/papercolor-theme](https://github.com/NLKNguyen/papercolor-theme)

- [mhartington/oceanic-next](https://github.com/mhartington/oceanic-next)
