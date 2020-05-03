# Oceanic Material

Oceanice_Material colorscheme for vim/neovim

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

## Thanks to

- [equinusocio/material-theme](https://github.com/equinusocio/material-theme)

- [mhartington/oceanic-next](https://github.com/mhartington/oceanic-next)

- [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material)

