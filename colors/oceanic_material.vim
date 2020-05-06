" ===============================================================
" Theme: Oceanice_Material
" Author: Glepnir
" License: MIT
" Source: http://github.com/hardcoreplayers/oceanic_material
" ===============================================================

" Initialization: {{{
"
hi clear

if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name = "oceanic_material"
let s:oceanic_material_version = '0.1.0'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

let s:oceanic_material_transparent_background = get(g:,'oceanic_material_transparent_background',0)
" if set to 1,disable bold
let s:oceanic_material_enable_bold = get(g:,'oceanic_material_enable_bold', 0)
" if set to 1,enable italic
let s:oceanic_material_enable_italic = get(g:,'oceanic_material_enable_italic',0)
" if set to 1,disable underline
let s:oceanic_material_enable_underline = get(g:,'oceanic_material_enable_underline',0)
" if set to 1,disable reverse
let s:oceanic_material_enable_reverse = get(g:,'oceanic_material_enable_reverse',0)
" if set to 1,disable reverse
let s:oceanic_material_enable_undercurl = get(g:,'oceanic_material_enable_undercurl',0)

let s:bold = ' cterm=bold gui=bold '
if s:oceanic_material_enable_bold == 1
  let s:bold = ''
endif

let s:italic = ''
if s:oceanic_material_enable_italic == 1
  let s:italic = ' cterm=italic gui=italic '
endif

let s:underline = ' cterm=underline gui=underline '
if s:oceanic_material_enable_underline == 1
  let s:underline = ''
endif

let s:reverse = ' cterm=reverse gui=reverse '
if s:oceanic_material_enable_reverse == 1
  let s:reverse = ''
endif

let s:undercurl = ' cterm=undercurl gui=undercurl '
if s:oceanic_material_enable_undercurl == 1
  let s:undercurl = ''
endif

let s:colors = {
      \ 'bg0':              ['#1b2b34',   '235'],
      \ 'bg1':              ['#343d46',   '237'],
      \ 'bg2':              ['#282828',   '235'],
      \ 'bg3':              ['#3c3836',   '237'],
      \ 'bg4':              ['#3c3836',   '237'],
      \ 'bg5':              ['#504945',   '239'],
      \ 'bg_diff_green':    ['#32361a',   '22'],
      \ 'bg_visual_green':  ['#333e34',   '22'],
      \ 'bg_diff_red':      ['#3c1f1e',   '52'],
      \ 'bg_visual_red':    ['#442e2d',   '52'],
      \ 'bg_diff_blue':     ['#0d3138',   '17'],
      \ 'bg_visual_blue':   ['#2e3b3b',   '17'],
      \ 'fg0':              ['#d4be98',   '223'],
      \ 'fg1':              ['#ddc7a1',   '223'],
      \ 'fg3':              ['#4f5b66', '240'],
      \ 'red':              ['#ea6962',   '167'],
      \ 'orange':           ['#e78a4e',   '208'],
      \ 'yellow':           ['#d8a657',   '214'],
      \ 'green':            ['#a9b665',   '142'],
      \ 'aqua':             ['#89b482',   '108'],
      \ 'blue':             ['#7daea3',   '109'],
      \ 'purple':           ['#d3869b',   '175'],
      \ 'darkgreen':        ['#5faf5f',    '71'],
      \ 'bg_red':           ['#ea6962',   '167'],
      \ 'bg_green':         ['#a9b665',   '142'],
      \ 'bg_yellow':        ['#d8a657',   '214'],
      \ 'grey0':            ['#7c6f64',   '243'],
      \ 'grey1':            ['#928374',   '245'],
      \ 'grey2':            ['#a89984',   '246'],
      \ 'none':             ['NONE',      'NONE']
  \ }

function! g:OceanicMaterial()
  echo s:oceanic_material_version
endfunction

function! s:create_color_variables() abort
  for key in keys(s:colors)
    let palette = get(s:colors,key)
    let {'s:fg_' . key} = ' guifg='.palette[0].' ctermfg='.palette[1].' '
    let {'s:bg_' . key} = ' guibg='.palette[0].' ctermbg='.palette[1]. ' '
  endfor
  let s:sp_red = ' guisp='.s:colors.red[0] . ' '
  let s:sp_blue = ' guisp='.s:colors.blue[0] . ' '
  let s:sp_aqua = ' guisp='.s:colors.aqua[0] . ' '
  let s:sp_yellow = ' guisp='.s:colors.yellow[0] . ' '
  let s:sp_purple = ' guisp='.s:colors.purple[0] . ' '
endfunction

function! s:set_color_variables() abort
  call s:create_color_variables()
  let s:terminal = {
        \ 'black':    s:colors.bg0,
        \ 'red':      s:colors.red,
        \ 'yellow':   s:colors.yellow,
        \ 'green':    s:colors.green,
        \ 'cyan':     s:colors.aqua,
        \ 'blue':     s:colors.blue,
        \ 'purple':   s:colors.purple,
        \ 'white':    s:colors.fg0
        \ }
  let g:terminal_color_0 = s:terminal.black[0]
  let g:terminal_color_1 = s:terminal.red[0]
  let g:terminal_color_2 = s:terminal.green[0]
  let g:terminal_color_3 = s:terminal.yellow[0]
  let g:terminal_color_4 = s:terminal.blue[0]
  let g:terminal_color_5 = s:terminal.purple[0]
  let g:terminal_color_6 = s:terminal.cyan[0]
  let g:terminal_color_7 = s:terminal.white[0]
  let g:terminal_color_8 = s:terminal.black[0]
  let g:terminal_color_9 = s:terminal.red[0]
  let g:terminal_color_10 = s:terminal.green[0]
  let g:terminal_color_11 = s:terminal.yellow[0]
  let g:terminal_color_12 = s:terminal.blue[0]
  let g:terminal_color_13 = s:terminal.purple[0]
  let g:terminal_color_14 = s:terminal.cyan[0]
  let g:terminal_color_15 = s:terminal.white[0]
endfunction

" Oceanic Material Transparent BackGround
function! s:apply_syntax_highlightings()
  if s:oceanic_material_transparent_background
    exec 'hi Normal' . s:fg_fg0 . s:bg_none
    exec 'hi Terminal' . s:fg_fg0 . s:bg_none
    exec 'hi FoldColumn' . s:fg_grey0 . s:bg_none
    exec 'hi SignColumn' . s:fg_fg0 . s:bg_none
    exec 'hi ToolbarLine' . s:fg_fg0 . s:bg_none
    exec 'hi VertSplit' . s:fg_bg0 . s:bg_none
  else
    exec 'hi Normal' . s:fg_fg0 . s:bg_bg0
    exec 'hi Terminal' . s:fg_fg0 . s:bg_bg0
    exec 'hi ToolbarLine' . s:fg_fg1 . s:bg_bg3
    exec 'hi SignColumn' . s:fg_fg0 . s:bg_bg0
    exec 'hi FoldColumn' . s:fg_grey0 . s:bg_bg2
    exec 'hi VertSplit' . s:fg_bg0 . s:bg_bg5
  endif
  exec 'hi Folded' . s:fg_grey1 . s:bg_bg2
  exec 'hi EndOfBuffer' . s:fg_bg0 . s:bg_none
  exec 'hi IncSearch'. s:fg_bg0 . s:bg_bg_red
  exec 'hi Search'. s:fg_bg0 . s:bg_bg_green
  exec 'hi ColorColumn'. s:fg_none . s:bg_bg1
  exec 'hi Conceal'. s:fg_grey1 . s:bg_none
  exec 'hi Cursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi vCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi iCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi lCursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi CursorIM'. s:fg_none . s:bg_none . s:reverse
  exec 'hi CursorColumn'. s:fg_none. s:fg_bg1
  exec 'hi CursorLine'. s:fg_none . s:bg_bg1
  exec 'hi LineNr'. s:fg_grey0. s:bg_none
  exec 'hi CursorLineNr'. s:fg_darkgreen . s:bg_none
  exec 'hi DiffAdd'. s:fg_none . s:bg_bg_diff_green
  exec 'hi DiffChange'. s:fg_none. s:bg_bg_diff_blue
  exec 'hi DiffDelete'. s:fg_none. s:bg_bg_diff_red
  exec 'hi DiffText'. s:fg_bg0 . s:bg_fg0
  exec 'hi Directory'. s:fg_green. s:bg_none
  exec 'hi ErrorMsg'. s:fg_red. s:bg_none. s:bold . s:underline
  exec 'hi WarningMsg'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi ModeMsg'. s:fg_fg0. s:bg_none. s:bold
  exec 'hi MoreMsg'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi MatchParen'. s:fg_none. s:bg_bg4
  exec 'hi NonText'. s:fg_bg5. s:bg_none
  exec 'hi Whitespace'. s:fg_bg5. s:bg_none
  exec 'hi SpecialKey'. s:fg_bg5. s:bg_none
  exec 'hi Pmenu'. s:fg_fg1. s:bg_bg3
  exec 'hi PmenuSbar'. s:fg_none. s:bg_bg3
  exec 'hi PmenuSel'. s:fg_bg3. s:bg_bg_green
  exec 'hi PmenuThumb'. s:fg_none. s:bg_grey0
  exec 'hi WildMenu'. s:fg_bg3. s:bg_bg_green
  exec 'hi Question'. s:fg_yellow. s:bg_none
  " spell
  exec 'hi SpellBad'. s:fg_red. s:bg_none. s:undercurl. s:sp_red
  exec 'hi SpellCap'. s:fg_blue. s:bg_none. s:undercurl. s:sp_blue
  exec 'hi SpellLocal'. s:fg_aqua. s:bg_none. s:undercurl. s:sp_aqua
  exec 'hi SpellRare'. s:fg_purple. s:bg_none. s:undercurl. s:sp_purple

  exec 'hi Visual'. s:fg_none. s:bg_none. s:reverse
  exec 'hi VisualNOS'. s:fg_none. s:bg_none. s:reverse

  exec 'hi QuickFixLine'. s:fg_purple. s:bg_none. s:bold
  exec 'hi Debug'. s:fg_orange. s:bg_none
  exec 'hi debugPC'. s:fg_bg0. s:bg_green
  exec 'hi debugBreakpoint'. s:fg_bg0. s:bg_red
  exec 'hi ToolbarButton'. s:fg_bg0. s:bg_grey2

  " Syntax
  exec 'hi Boolean'. s:fg_purple. s:bg_none
  exec 'hi Number'. s:fg_purple. s:bg_none
  exec 'hi Float'. s:fg_purple. s:bg_none
  exec 'hi PreProc'. s:fg_purple. s:bg_none. s:italic
  exec 'hi PreCondit'. s:fg_purple. s:bg_none. s:italic
  exec 'hi Include'. s:fg_purple. s:bg_none. s:italic
  exec 'hi Define'. s:fg_purple. s:bg_none. s:italic
  exec 'hi Conditional'. s:fg_red. s:bg_none. s:italic
  exec 'hi Repeat'. s:fg_red. s:bg_none. s:italic
  exec 'hi Keyword'. s:fg_red. s:bg_none. s:italic
  exec 'hi Typedef'. s:fg_red. s:bg_none. s:italic
  exec 'hi Exception'. s:fg_red. s:bg_none. s:italic
  exec 'hi Statement'. s:fg_red. s:bg_none. s:italic
  exec 'hi Error'. s:fg_red. s:bg_none
  exec 'hi StorageClass'. s:fg_orange. s:bg_none
  exec 'hi Tag'. s:fg_orange. s:bg_none
  exec 'hi Label'. s:fg_orange. s:bg_none
  exec 'hi Structure'. s:fg_orange. s:bg_none
  exec 'hi Operator'. s:fg_orange. s:bg_none
  exec 'hi Title'. s:fg_orange. s:bg_none. s:bold
  exec 'hi Special'. s:fg_yellow. s:bg_none
  exec 'hi SpecialChar'. s:fg_yellow. s:bg_none
  exec 'hi Type'. s:fg_yellow. s:bg_none
  exec 'hi Function'. s:fg_green. s:bg_none. s:bold
  exec 'hi String'. s:fg_green. s:bg_none
  exec 'hi Character'. s:fg_green. s:bg_none
  exec 'hi Constant'. s:fg_aqua. s:bg_none
  exec 'hi Macro'. s:fg_aqua. s:bg_none
  exec 'hi Identifier'. s:fg_blue. s:bg_none

  " Comment
  exec 'hi Comment'. s:fg_grey1. s:bg_none. s:italic
  exec 'hi SpecialComment'. s:fg_grey1. s:bg_none. s:italic
  exec 'hi Todo'. s:fg_purple. s:bg_none. s:italic

  exec 'hi Delimiter'. s:fg_fg0. s:bg_none
  exec 'hi Ignore'. s:fg_grey1. s:bg_none
  exec 'hi Underlined'. s:fg_none. s:bg_none. s:underline

  " Markdown Filetype:
  "===============================================================
  exec 'hi markdownH1'. s:fg_red. s:bg_none. s:bold
  exec 'hi markdownH2'. s:fg_orange. s:bg_none. s:bold
  exec 'hi markdownH3'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi markdownH4'. s:fg_green. s:bg_none. s:bold
  exec 'hi markdownH5'. s:fg_blue. s:bg_none. s:bold
  exec 'hi markdownH6'. s:fg_purple. s:bg_none. s:bold
  exec 'hi markdownUrl'. s:fg_blue. s:bg_none. s:underline
  exec 'hi markdownItalic'. s:fg_none. s:bg_none. s:italic
  exec 'hi markdownBold'. s:fg_none. s:bg_none. s:bold
  exec 'hi markdownItalicDelimiter'. s:fg_grey1. s:bg_none. s:italic
  exec 'hi markdownCode' .s:fg_green. s:bg_none
  exec 'hi markdownCodeBlock' .s:fg_aqua. s:bg_none
  exec 'hi markdownCodeDelimiter' .s:fg_aqua. s:bg_none
  exec 'hi markdownBlockquote'.s:fg_grey1. s:bg_none
  exec 'hi markdownListMarker'. s:fg_red. s:bg_none
  exec 'hi markdownOrderedListMarker'. s:fg_red. s:bg_none
  exec 'hi markdownRule'. s:fg_purple. s:bg_none
  exec 'hi markdownHeadingRule'. s:fg_grey1. s:bg_none
  exec 'hi markdownUrlDelimiter'. s:fg_grey1. s:bg_none
  exec 'hi markdownLinkDelimiter'. s:fg_grey1. s:bg_none
  exec 'hi markdownLinkTextDelimiter'. s:fg_grey1. s:bg_none
  exec 'hi markdownHeadingDelimiter'. s:fg_grey1. s:bg_none
  exec 'hi markdownLinkText'. s:fg_purple. s:bg_none
  exec 'hi markdownUrlTitleDelimiter'. s:fg_green. s:bg_none
  exec 'hi markdownIdDeclaration'. s:fg_purple. s:bg_none
  exec 'hi markdownBoldDelimiter'. s:fg_grey1. s:bg_none
  exec 'hi markdownId'. s:fg_yellow. s:bg_none

  " Plugin: https://github.com/gabrielelana/vim-markdown
  exec 'hi mkdURL'. s:fg_blue. s:fg_none. s:underline
  exec 'hi mkdInlineURL'. s:fg_purple. s:bg_none. s:underline
  exec 'hi mkdItalic'. s:fg_grey1. s:bg_none. s:italic
  exec 'hi mkdCodeDelimiter'.s:fg_aqua . s:bg_none
  exec 'hi mkdBold'.s:fg_grey1 . s:bg_none
  exec 'hi mkdLink'.s:fg_purple . s:bg_none
  exec 'hi mkdHeading'.s:fg_grey1 . s:bg_none
  exec 'hi mkdListItem'.s:fg_red . s:bg_none
  exec 'hi mkdRule'.s:fg_purple . s:bg_none
  exec 'hi mkdDelimiter'.s:fg_grey1 . s:bg_none
  exec 'hi mkdId'.s:fg_yellow . s:bg_none
  "===============================================================
  " https://github.com/marshallward/vim-restructuredtext
  "===============================================================
  exec 'hi rstStandaloneHyperlink'. s:fg_purple. s:bg_none.s:underline
  exec 'hi rstSubstitutionReference'.s:fg_blue . s:bg_none
  exec 'hi rstInterpretedTextOrHyperlinkReference'.s:fg_aqua . s:bg_none
  exec 'hi rstTableLines'.s:fg_grey1 . s:bg_none
  "===============================================================
  " Latex: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX
  "===============================================================
  exec 'hi texStatement'.s:fg_green . s:bg_none
  exec 'hi texOnlyMath'.s:fg_grey1 . s:bg_none
  exec 'hi texDefName'.s:fg_yellow . s:bg_none
  exec 'hi texNewCmd'.s:fg_orange . s:bg_none
  exec 'hi texCmdName'.s:fg_blue . s:bg_none
  exec 'hi texBeginEnd'.s:fg_red . s:bg_none
  exec 'hi texBeginEndName'.s:fg_blue . s:bg_none
  exec 'hi texDocType'.s:fg_purple . s:bg_none
  exec 'hi texDocTypeArgs'.s:fg_orange . s:bg_none
  "===============================================================
  " Html: https://notabug.org/jorgesumle/vim-html-syntax {{{
  "===============================================================
  exec 'hi htmlH1'. s:fg_red. s:bg_none. s:bold
  exec 'hi htmlH2'. s:fg_orange. s:bg_none. s:bold
  exec 'hi htmlH3'. s:fg_yellow. s:bg_none. s:bold
  exec 'hi htmlH4'. s:fg_green. s:bg_none. s:bold
  exec 'hi htmlH5'. s:fg_blue. s:bg_none. s:bold
  exec 'hi htmlH6'. s:fg_purple. s:bg_none.s:bold
  exec 'hi htmlLink'. s:fg_none. s:bg_none. s:underline
  exec 'hi htmlBold'. s:fg_none. s:bg_none. s:bold
  exec 'hi htmlBoldUnderline'. s:fg_none. s:bg_none. s:bold . s:underline
  exec 'hi htmlBoldItalic'. s:fg_none. s:bg_none. s:bold . s:italic
  exec 'hi htmlBoldUnderlineItalic'. s:fg_none. s:bg_none. s:bold . s:underline . s:italic
  exec 'hi htmlUnderline'. s:fg_none. s:fg_none. s:underline
  exec 'hi htmlUnderlineItalic'. s:fg_none. s:bg_none. s:underline . s:italic
  exec 'hi htmlItalic'. s:fg_none. s:bg_none. s:italic
  exec 'hi htmlTag'. s:fg_green. s:bg_none
  exec 'hi htmlEndTag'. s:fg_blue. s:bg_none
  exec 'hi htmlTagN'. s:fg_orange. s:bg_none. s:italic
  exec 'hi htmlTagName'. s:fg_orange. s:bg_none. s:italic
  exec 'hi htmlArg'. s:fg_aqua. s:bg_none
  exec 'hi htmlScriptTag'. s:fg_purple. s:bg_none
  exec 'hi htmlSpecialTagName'. s:fg_red. s:bg_none.s:italic
  "===============================================================
  " Xml:" builtin: https://github.com/chrisbra/vim-xml-ftplugin
  "===============================================================
  exec 'hi xmlTag'. s:fg_green. s:bg_none
  exec 'hi xmlEndTag'. s:fg_blue. s:bg_none
  exec 'hi xmlTagName'. s:fg_orange. s:bg_none.s:italic
  exec 'hi xmlEqual'. s:fg_orange. s:bg_none
  exec 'hi xmlAttrib'. s:fg_aqua. s:bg_none
  exec 'hi xmlEntity'. s:fg_red. s:bg_none
  exec 'hi xmlEntityPunct'. s:fg_red. s:bg_none
  exec 'hi xmlDocTypeDecl'. s:fg_grey1. s:bg_none
  exec 'hi xmlDocTypeKeyword'. s:fg_purple. s:bg_none.s:italic
  exec 'hi xmlCdataStart'. s:fg_grey1. s:bg_none
  exec 'hi xmlCdataCdata'. s:fg_purple. s:bg_none
  "===============================================================
  " CSS: builtin: https://github.com/JulesWang/css.vim
  "===============================================================
  exec 'hi cssAttrComma'.s:fg_fg0 . s:bg_none
  exec 'hi cssBraces'.s:fg_fg0 . s:bg_none
  exec 'hi cssTagName'.s:fg_purple. s:fg_none. s:italic
  exec 'hi cssClassNameDot'.s:fg_red . s:bg_none
  exec 'hi cssClassName'.s:fg_red . s:bg_none.s:italic
  exec 'hi cssFunctionName'.s:fg_yellow . s:bg_none
  exec 'hi cssAttr'.s:fg_orange . s:bg_none
  exec 'hi cssProp'.s:fg_aqua . s:bg_none
  exec 'hi cssCommonAttr'.s:fg_yellow . s:bg_none
  exec 'hi cssPseudoClassId'.s:fg_blue . s:bg_none
  exec 'hi cssPseudoClassFn'.s:fg_green . s:bg_none
  exec 'hi cssPseudoClass'.s:fg_purple . s:bg_none
  exec 'hi cssImportant'.s:fg_red . s:bg_none . s:italic
  exec 'hi cssSelectorOp'.s:fg_orange . s:bg_none
  exec 'hi cssSelectorOp2'.s:fg_orange . s:bg_none
  exec 'hi cssColor'.s:fg_green . s:bg_none
  exec 'hi cssAttributeSelector'.s:fg_aqua . s:bg_none
  exec 'hi cssUnitDecorators'.s:fg_orange . s:bg_none
  exec 'hi cssValueLength'.s:fg_green . s:bg_none
  exec 'hi cssValueInteger'.s:fg_green . s:bg_none
  exec 'hi cssValueNumber'.s:fg_green . s:bg_none
  exec 'hi cssValueAngle'.s:fg_green . s:bg_none
  exec 'hi cssValueTime'.s:fg_green . s:bg_none
  exec 'hi cssValueFrequency'.s:fg_green . s:bg_none
  exec 'hi cssVendor'.s:fg_grey1 . s:bg_none
  exec 'hi cssNoise'.s:fg_grey1 . s:bg_none
  "===============================================================
  " SASS
  "===============================================================
  exec 'hi sassProperty'.s:fg_aqua . s:bg_none
  exec 'hi sassAmpersand'.s:fg_orange . s:bg_none
  exec 'hi sassClass'.s:fg_red . s:bg_none .s:italic
  exec 'hi sassClassChar'.s:fg_red . s:bg_none
  exec 'hi sassMixing'.s:fg_purple . s:bg_none.s:italic
  exec 'hi sassMixinName'.s:fg_orange . s:bg_none
  exec 'hi sassCssAttribute'.s:fg_yellow . s:bg_none
  exec 'hi sassInterpolationDelimiter'.s:fg_green . s:bg_none
  exec 'hi sassFunction'.s:fg_yellow . s:bg_none
  exec 'hi sassControl'.s:fg_red . s:bg_none .s:italic
  exec 'hi sassFor'.s:fg_red . s:bg_none .s:italic
  exec 'hi sassFunctionName'.s:fg_green . s:bold
  "===============================================================
  " scss-syntax: https://github.com/cakebaker/scss-syntax.vim
  "===============================================================
  exec 'hi scssMixinName'.s:fg_yellow . s:bg_none
  exec 'hi scssSelectorChar'.s:fg_red . s:bg_none
  exec 'hi scssSelectorName'.s:fg_red . s:bg_none .s:italic
  exec 'hi scssInterpolationDelimiter'.s:fg_green . s:bg_none
  exec 'hi scssVariableValue'.s:fg_green . s:bg_none
  exec 'hi scssNull'.s:fg_purple . s:bg_none
  exec 'hi scssBoolean'.s:fg_purple . s:bg_none
  exec 'hi scssVariableAssignment'.s:fg_grey1 . s:bg_none
  exec 'hi scssForKeyword'.s:fg_purple . s:bg_none .s:italic
  exec 'hi scssAttribute'.s:fg_orange . s:bg_none
  exec 'hi scssFunctionName'.s:fg_yellow . s:bg_none
  "===============================================================
  " LESS: vim-less: https://github.com/groenewege/vim-less
  "===============================================================
  exec ' hi lessMixinChar'.s:fg_grey1 . s:bg_none
  exec ' hi lessClass'.s:fg_red . s:bg_none .s:italic
  exec ' hi lessVariable'.s:fg_blue . s:bg_none
  exec ' hi lessAmpersandChar'.s:fg_orange . s:bg_none
  exec ' hi lessFunction'.s:fg_yellow . s:bg_none
  "===============================================================
  " Javascript:
  " https://github.com/pangloss/vim-javascript
  exec 'hi jsThis' . s:fg_purple . s:bg_none
  exec 'hi jsUndefined' . s:fg_aqua . s:bg_none
  exec 'hi jsNull' . s:fg_aqua . s:bg_none
  exec 'hi jsNan' . s:fg_aqua . s:bg_none
  exec 'hi jsSuper' . s:fg_purple . s:bg_none
  exec 'hi jsPrototype' . s:fg_purple . s:bg_none
  exec 'hi jsFunction' . s:fg_red . s:bg_none . s:italic
  exec 'hi jsGlobalNodeObjects' . s:fg_purple . s:bg_none . s:italic
  exec 'hi jsGlobalObjects' . s:fg_yellow . s:bg_none
  exec 'hi jsArrowFunction' . s:fg_purple . s:bg_none
  exec 'hi jsArrowFuncArgs' . s:fg_blue . s:bg_none
  exec 'hi jsFuncArgs' . s:fg_blue . s:bg_none
  exec 'hi jsObjectProp' . s:fg_aqua . s:bg_none
  exec 'hi jsVariableDef' . s:fg_blue . s:bg_none
  exec 'hi jsObjectKey' . s:fg_aqua . s:bg_none
  exec 'hi jsParen' . s:fg_blue . s:bg_none
  exec 'hi jsParenIfElse' . s:fg_blue . s:bg_none
  exec 'hi jsParenRepeat' . s:fg_blue . s:bg_none
  exec 'hi jsParenSwitch' . s:fg_blue . s:bg_none
  exec 'hi jsParenCatch' . s:fg_blue . s:bg_none
  exec 'hi jsBracket' . s:fg_blue . s:bg_none
  exec 'hi jsBlockLabel' . s:fg_aqua . s:bg_none
  exec 'hi jsFunctionKey' . s:fg_green . s:bg_none . s:bold
  exec 'hi jsClassDefinition' . s:fg_yellow . s:bg_none
  exec 'hi jsDot' . s:fg_grey1 . s:bg_none
  exec 'hi jsDestructuringBlock' . s:fg_blue . s:bg_none
  exec 'hi jsSpreadExpression' . s:fg_purple . s:bg_none
  exec 'hi jsSpreadOperator' . s:fg_green . s:bg_none
  exec 'hi jsModuleKeyword' . s:fg_yellow . s:bg_none
  exec 'hi jsObjectValue' . s:fg_blue . s:bg_none
  exec 'hi jsTemplateExpression' . s:fg_yellow . s:bg_none
  exec 'hi jsTemplateBraces' . s:fg_yellow . s:bg_none
  exec 'hi jsClassMethodType'. s:fg_orange . s:bg_none
  " yajs: https://github.com/othree/yajs.vim
  exec 'hi javascriptEndColons' . s:fg_fg0 . s:bg_none
  exec 'hi javascriptOpSymbol' . s:fg_orange . s:bg_none
  exec 'hi javascriptOpSymbols' . s:fg_orange . s:bg_none
  exec 'hi javascriptIdentifierName' . s:fg_blue . s:bg_none
  exec 'hi javascriptVariable' . s:fg_orange . s:bg_none
  exec 'hi javascriptObjectLabel' . s:fg_aqua . s:bg_none
  exec 'hi javascriptObjectLabelColon' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptPropertyNameString' . s:fg_aqua . s:bg_none
  exec 'hi javascriptFuncArg' . s:fg_blue . s:bg_none
  exec 'hi javascriptIdentifier' . s:fg_purple . s:bg_none
  exec 'hi javascriptArrowFunc' . s:fg_purple . s:bg_none
  exec 'hi javascriptTemplate' . s:fg_yellow . s:bg_none
  exec 'hi javascriptTemplateSubstitution' . s:fg_yellow . s:bg_none
  exec 'hi javascriptTemplateSB' . s:fg_yellow . s:bg_none
  exec 'hi javascriptNodeGlobal' . s:fg_purple . s:bg_none . s:italic
  exec 'hi javascriptDocTags' . s:fg_purple . s:bg_none . s:italic
  exec 'hi javascriptDocNotation' . s:fg_purple . s:bg_none
  exec 'hi javascriptClassSuper' . s:fg_purple . s:bg_none
  exec 'hi javascriptClassName' . s:fg_yellow . s:bg_none
  exec 'hi javascriptClassSuperName' . s:fg_yellow . s:bg_none
  exec 'hi javascriptBrackets' . s:fg_fg0 . s:bg_none
  exec 'hi javascriptBraces' . s:fg_fg0 . s:bg_none
  exec 'hi javascriptLabel' . s:fg_purple . s:bg_none
  exec 'hi javascriptDotNotation' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalArrayDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalBigIntDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalDateDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalJSONDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalMathDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalNumberDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalObjectDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalPromiseDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalRegExpDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalStringDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalSymbolDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptGlobalURLDot' . s:fg_grey1 . s:bg_none
  exec 'hi javascriptMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptMethodName' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptObjectMethodName' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptGlobalMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMStorageMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptFileMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptFileReaderMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptFileListMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBlobMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptURLStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptNumberStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptNumberMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMNodeMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptES6BigIntStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBOMWindowMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptHeadersMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptRequestMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptResponseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptES6SetMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptReflectMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptPaymentMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptPaymentResponseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptTypedArrayStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptGeolocationMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptES6MapMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptServiceWorkerMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptCacheMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptFunctionMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptXHRMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBOMNavigatorMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptServiceWorkerMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMEventTargetMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMEventMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptIntlMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMDocMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptStringStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptStringMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptSymbolStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptRegExpMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptObjectStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptObjectMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBOMLocationMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptJSONStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptGeneratorMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptEncodingMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptPromiseStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptPromiseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBOMHistoryMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMFormMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptClipboardMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptTypedArrayStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptBroadcastMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDateStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDateMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptConsoleMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptArrayStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptArrayMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptMathStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptSubtleCryptoMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptCryptoMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBOMWindowProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptDOMStorageProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptFileReaderProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptURLUtilsProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptNumberStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptDOMNodeProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptRequestProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptResponseProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptES6SetProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptPaymentProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptPaymentResponseProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptPaymentAddressProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptPaymentShippingOptionProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptTypedArrayStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptServiceWorkerProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptES6MapProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptRegExpStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptRegExpProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptXHRProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBOMNavigatorProp' . s:fg_green . s:bg_none . s:bold
  exec 'hi javascriptDOMEventProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBOMNetworkProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptDOMDocProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptSymbolStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptSymbolProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBOMLocationProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptEncodingProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptCryptoProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBOMHistoryProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptDOMFormProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptDataViewProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptBroadcastProp' . s:fg_aqua . s:bg_none
  exec 'hi javascriptMathStaticProp' . s:fg_aqua . s:bg_none
  "===============================================================
  " JavaScript React:
  " vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty
  "===============================================================
  exec 'hi jsxTagName' . s:fg_orange . s:bg_none . s:italic
  exec 'hi jsxOpenPunct' . s:fg_green . s:bg_none
  exec 'hi jsxClosePunct' . s:fg_blue . s:bg_none
  exec 'hi jsxEscapeJs' . s:fg_blue . s:bg_none
  exec 'hi jsxAttrib' . s:fg_aqua . s:bg_none
  "===============================================================
  " TypeScript:
  " vim-typescript: https://github.com/leafgarland/typescript-vim {{{
  "===============================================================
  exec 'hi typescriptSource' . s:fg_purple . s:bg_none . s:italic
  exec 'hi typescriptMessage' . s:fg_yellow . s:bg_none
  exec 'hi typescriptGlobalObjects' . s:fg_aqua . s:bg_none
  exec 'hi typescriptInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi typescriptInterpolationDelimiter' . s:fg_yellow . s:bg_none
  exec 'hi typescriptBraces' . s:fg_fg0 . s:bg_none
  exec 'hi typescriptParens' . s:fg_fg0 . s:bg_none
  "===============================================================
  " Typescript:
  " yats: https:github.com/HerringtonDarkholme/yats.vim
  " But now builtin neovim vim
  "===============================================================
  exec 'hi typescriptMethodAccessor' . s:fg_orange . s:bg_none . s:italic
  exec 'hi typescriptVariable' . s:fg_orange . s:bg_none
  exec 'hi typescriptVariableDeclaration' . s:fg_blue . s:bg_none
  exec 'hi typescriptTypeReference' . s:fg_yellow . s:bg_none
  exec 'hi typescriptBraces' . s:fg_fg0 . s:bg_none
  exec 'hi typescriptEnumKeyword' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptEnum' . s:fg_yellow . s:bg_none
  exec 'hi typescriptIdentifierName' . s:fg_aqua . s:bg_none
  exec 'hi typescriptProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptCall' . s:fg_blue . s:bg_none
  exec 'hi typescriptInterfaceName' . s:fg_yellow . s:bg_none
  exec 'hi typescriptEndColons' . s:fg_fg0 . s:bg_none
  exec 'hi typescriptMember' . s:fg_aqua . s:bg_none
  exec 'hi typescriptMemberOptionality' . s:fg_orange . s:bg_none
  exec 'hi typescriptObjectLabel' . s:fg_aqua . s:bg_none
  exec 'hi typescriptArrowFunc' . s:fg_purple . s:bg_none
  exec 'hi typescriptAbstract' . s:fg_orange . s:bg_none
  exec 'hi typescriptObjectColon' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptTypeAnnotation' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptAssign' . s:fg_orange . s:bg_none
  exec 'hi typescriptBinaryOp' . s:fg_orange . s:bg_none
  exec 'hi typescriptUnaryOp' . s:fg_orange . s:bg_none
  exec 'hi typescriptFuncComma' . s:fg_fg0 . s:bg_none
  exec 'hi typescriptClassName' . s:fg_yellow . s:bg_none
  exec 'hi typescriptClassHeritage' . s:fg_yellow . s:bg_none
  exec 'hi typescriptInterfaceHeritage' . s:fg_yellow . s:bg_none
  exec 'hi typescriptIdentifier' . s:fg_purple . s:bg_none
  exec 'hi typescriptGlobal' . s:fg_purple . s:bg_none
  exec 'hi typescriptOperator' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptNodeGlobal' . s:fg_purple . s:bg_none . s:italic
  exec 'hi typescriptExport' . s:fg_purple . s:bg_none . s:italic
  exec 'hi typescriptDefaultParam' . s:fg_orange . s:bg_none
  exec 'hi typescriptImport' . s:fg_purple . s:bg_none . s:italic
  exec 'hi typescriptTypeParameter' . s:fg_yellow . s:bg_none
  exec 'hi typescriptReadonlyModifier' . s:fg_orange . s:bg_none
  exec 'hi typescriptAccessibilityModifier' . s:fg_orange . s:bg_none
  exec 'hi typescriptAmbientDeclaration' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptTemplateSubstitution' . s:fg_yellow . s:bg_none
  exec 'hi typescriptTemplateSB' . s:fg_yellow . s:bg_none
  exec 'hi typescriptExceptions' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptCastKeyword' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptOptionalMark' . s:fg_orange . s:bg_none
  exec 'hi typescriptNull' . s:fg_aqua . s:bg_none
  exec 'hi typescriptMappedIn' . s:fg_red . s:bg_none . s:italic
  exec 'hi typescriptFuncTypeArrow' . s:fg_purple . s:bg_none
  exec 'hi typescriptTernaryOp' . s:fg_orange . s:bg_none
  exec 'hi typescriptParenExp' . s:fg_blue . s:bg_none
  exec 'hi typescriptIndexExpr' . s:fg_blue . s:bg_none
  exec 'hi typescriptDotNotation' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalNumberDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalStringDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalArrayDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalObjectDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalSymbolDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalMathDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalDateDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalJSONDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalRegExpDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalPromiseDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalURLDot' . s:fg_grey1 . s:bg_none
  exec 'hi typescriptGlobalMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMStorageMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptFileMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptFileReaderMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptFileListMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptBlobMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptURLStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptNumberStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptNumberMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMNodeMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptPaymentMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptPaymentResponseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptHeadersMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptRequestMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptResponseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptES6SetMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptReflectMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptBOMWindowMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptGeolocationMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptServiceWorkerMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptCacheMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptES6MapMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptFunctionMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptRegExpMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptXHRMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptBOMNavigatorMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptServiceWorkerMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptIntlMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMEventTargetMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMEventMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMDocMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptStringStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptStringMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptSymbolStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptObjectStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptObjectMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptJSONStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptEncodingMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptBOMLocationMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptPromiseStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptPromiseMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptSubtleCryptoMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptCryptoMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptBOMHistoryMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDOMFormMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptConsoleMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDateStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptDateMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptArrayStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptArrayMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptMathStaticMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptStringProperty' . s:fg_aqua . s:bg_none
  exec 'hi typescriptDOMStorageProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptFileReaderProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptURLUtilsProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptNumberStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptDOMNodeProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptBOMWindowProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptRequestProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptResponseProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptPaymentProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptPaymentResponseProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptPaymentAddressProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptPaymentShippingOptionProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptES6SetProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptServiceWorkerProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptES6MapProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptRegExpStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptRegExpProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptBOMNavigatorProp' . s:fg_green . s:bg_none . s:bold
  exec 'hi typescriptXHRProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptDOMEventProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptDOMDocProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptBOMNetworkProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptSymbolStaticProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptEncodingProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptBOMLocationProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptCryptoProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptDOMFormProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptBOMHistoryProp' . s:fg_aqua . s:bg_none
  exec 'hi typescriptMathStaticProp' . s:fg_aqua . s:bg_none
  "===============================================================
  " Typescript React:
  " https://github.com/peitalin/vim-jsx-typescript
  "===============================================================
  exec 'hi tsxTagName' . s:fg_purple . s:bg_none
  exec 'hi tsxCloseTagName' . s:fg_orange . s:bg_none
  exec 'hi tsxEqual' . s:fg_aqua . s:bg_none
  exec 'hi tsxAttrib' . s:fg_yellow . s:bg_none
  "===============================================================
  " Dart:
  " dart-lang: https://github.com/dart-lang/dart-vim-plugin
  "===============================================================
  exec 'hi dartCoreClasses' . s:fg_aqua . s:bg_none
  exec 'hi dartTypeName' . s:fg_aqua . s:bg_none
  exec 'hi dartInterpolation' . s:fg_blue . s:bg_none
  exec 'hi dartTypeDef' . s:fg_red . s:bg_none . s:italic
  exec 'hi dartClassDecl' . s:fg_red . s:bg_none . s:italic
  exec 'hi dartLibrary' . s:fg_purple . s:bg_none . s:italic
  exec 'hi dartMetadata' . s:fg_blue . s:bg_none
  "===============================================================
  " CoffeeScript:
  " vim-coffee-script: https://github.com/kchmck/vim-coffee-script
  "===============================================================
  exec 'hi coffeeExtendedOp' . s:fg_orange . s:bg_none
  exec 'hi coffeeSpecialOp' . s:fg_fg0 . s:bg_none
  exec 'hi coffeeDotAccess' . s:fg_grey1 . s:bg_none
  exec 'hi coffeeCurly' . s:fg_fg0 . s:bg_none
  exec 'hi coffeeParen' . s:fg_fg0 . s:bg_none
  exec 'hi coffeeBracket' . s:fg_fg0 . s:bg_none
  exec 'hi coffeeParens' . s:fg_blue . s:bg_none
  exec 'hi coffeeBrackets' . s:fg_blue . s:bg_none
  exec 'hi coffeeCurlies' . s:fg_blue . s:bg_none
  exec 'hi coffeeOperator' . s:fg_red . s:bg_none . s:italic
  exec 'hi coffeeStatement' . s:fg_orange . s:bg_none
  exec 'hi coffeeSpecialIdent' . s:fg_purple . s:bg_none
  exec 'hi coffeeObject' . s:fg_purple . s:bg_none
  exec 'hi coffeeObjAssign' . s:fg_aqua . s:bg_none
  "===============================================================
  " PureScript:
  " purescript-vim: https://github.com/purescript-contrib/purescript-vim
  "===============================================================
  exec 'hi purescriptModuleKeyword' . s:fg_purple . s:bg_none . s:italic
  exec 'hi purescriptModule' . s:fg_aqua . s:bg_none
  exec 'hi purescriptModuleParams' . s:fg_blue . s:bg_none
  exec 'hi purescriptAsKeyword' . s:fg_orange . s:bg_none . s:italic
  exec 'hi purescriptHidingKeyword' . s:fg_orange . s:bg_none . s:italic
  exec 'hi purescriptWhere' . s:fg_orange . s:bg_none . s:italic
  exec 'hi purescriptIdentifier' . s:fg_blue . s:bg_none
  exec 'hi purescriptFunction' . s:fg_yellow . s:bg_none
  exec 'hi purescriptType' . s:fg_aqua . s:bg_none
  "===============================================================
  " C/C++
  " vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight
  "===============================================================
  exec 'hi cppSTLnamespace' . s:fg_purple . s:bg_none
  exec 'hi cppSTLtype' . s:fg_yellow . s:bg_none
  exec 'hi cppAccess' . s:fg_purple . s:bg_none . s:italic
  exec 'hi cppStructure' . s:fg_red . s:bg_none . s:italic
  exec 'hi cppSTLios' . s:fg_aqua . s:bg_none
  exec 'hi cppSTLiterator' . s:fg_purple . s:bg_none . s:italic
  exec 'hi cppSTLexception' . s:fg_purple . s:bg_none
  "===============================================================
  " vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern {{{
  "===============================================================
  exec 'hi cppSTLVariable' . s:fg_aqua . s:bg_none
  "===============================================================
  " chromatica: https://github.com/arakashic/chromatica.nvim {{{
  "===============================================================
  exec 'hi Member' . s:fg_aqua . s:bg_none
  exec 'hi Variable' . s:fg_blue . s:bg_none
  exec 'hi Namespace' . s:fg_purple . s:bg_none
  exec 'hi EnumConstant' . s:fg_aqua . s:bg_none
  exec 'hi chromaticaException' . s:fg_red . s:bg_none . s:italic
  exec 'hi chromaticaCast' . s:fg_orange . s:bg_none
  exec 'hi OperatorOverload' . s:fg_orange . s:bg_none
  exec 'hi AccessQual' . s:fg_orange . s:bg_none
  exec 'hi Linkage' . s:fg_orange . s:bg_none
  exec 'hi AutoType' . s:fg_yellow . s:bg_none
  "===============================================================
  " vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight {{{
  "===============================================================
  exec 'hi LspCxxHlSkippedRegion' . s:fg_grey1 . s:bg_none
  exec 'hi LspCxxHlSkippedRegionBeginEnd' . s:fg_purple . s:bg_none . s:italic
  exec 'hi LspCxxHlGroupEnumConstant' . s:fg_aqua . s:bg_none
  exec 'hi LspCxxHlGroupNamespace' . s:fg_purple . s:bg_none
  exec 'hi LspCxxHlGroupMemberVariable' . s:fg_aqua . s:bg_none
  "===============================================================
  " ObjectiveC
  "===============================================================
  exec 'hi objcModuleImport' . s:fg_purple . s:bg_none . s:italic
  exec 'hi objcException' . s:fg_red . s:bg_none . s:italic
  exec 'hi objcProtocolList' . s:fg_aqua . s:bg_none
  exec 'hi objcObjDef' . s:fg_purple . s:bg_none . s:italic
  exec 'hi objcDirective' . s:fg_red . s:bg_none . s:italic
  exec 'hi objcPropertyAttribute' . s:fg_orange . s:bg_none
  exec 'hi objcHiddenArgument' . s:fg_aqua . s:bg_none
  "===============================================================
  " C#:
  " https://github.com/nickspoons/vim-cs
  "===============================================================
  exec 'hi csUnspecifiedStatement' . s:fg_purple . s:bg_none . s:italic
  exec 'hi csStorage' . s:fg_red . s:bg_none . s:italic
  exec 'hi csClass' . s:fg_red . s:bg_none . s:italic
  exec 'hi csNewType' . s:fg_aqua . s:bg_none
  exec 'hi csContextualStatement' . s:fg_purple . s:bg_none . s:italic
  exec 'hi csInterpolationDelimiter' . s:fg_yellow . s:bg_none
  exec 'hi csInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi csEndColon' . s:fg_fg0 . s:bg_none
  "===============================================================
  " Python:
  "===============================================================
  exec 'hi pythonBuiltin' . s:fg_yellow . s:bg_none
  exec 'hi pythonExceptions' . s:fg_purple . s:bg_none
  exec 'hi pythonDecoratorName' . s:fg_blue . s:bg_none
  "===============================================================
  " python-syntax: https://github.com/vim-python/python-syntax
  "===============================================================
  exec 'hi pythonExClass' . s:fg_purple . s:bg_none
  exec 'hi pythonBuiltinType' . s:fg_yellow . s:bg_none
  exec 'hi pythonBuiltinObj' . s:fg_blue . s:bg_none
  exec 'hi pythonDottedName' . s:fg_purple . s:bg_none . s:italic
  exec 'hi pythonBuiltinFunc' . s:fg_green . s:bg_none . s:bold
  exec 'hi pythonFunction' . s:fg_aqua . s:bg_none . s:bold
  exec 'hi pythonDecorator' . s:fg_orange . s:bg_none
  exec 'hi pythonInclude'. s:fg_purple. s:bg_none. s:italic
  exec 'hi pythonImport'. s:fg_purple. s:bg_none. s:italic
  exec 'hi pythonRun' . s:fg_blue . s:bg_none
  exec 'hi pythonCoding' . s:fg_grey1 . s:bg_none
  exec 'hi pythonOperator' . s:fg_orange . s:bg_none
  exec 'hi pythonConditional' . s:fg_red . s:bg_none . s:italic
  exec 'hi pythonRepeat' . s:fg_red . s:bg_none . s:italic
  exec 'hi pythonException' . s:fg_red . s:bg_none . s:italic
  exec 'hi pythonNone' . s:fg_aqua . s:bg_none
  exec 'hi pythonDot' . s:fg_grey1 . s:bg_none
  "===============================================================
  " semshi: https://github.com/numirias/semshi
  "===============================================================
  exec 'hi semshiUnresolved' . s:fg_yellow. s:bg_none. s:undercurl
  exec 'hi semshiImported' . s:fg_purple . s:bg_none
  exec 'hi semshiParameter' . s:fg_blue . s:bg_none
  exec 'hi semshiParameterUnused' . s:fg_grey1 . s:bg_none
  exec 'hi semshiSelf' . s:fg_purple . s:bg_none . s:italic
  exec 'hi semshiGlobal' . s:fg_yellow . s:bg_none
  exec 'hi semshiBuiltin' . s:fg_yellow . s:bg_none
  exec 'hi semshiAttribute' . s:fg_aqua . s:bg_none
  exec 'hi semshiLocal' . s:fg_red . s:bg_none
  exec 'hi semshiFree' . s:fg_red . s:bg_none
  hi link  semshiSelected CocHighlightText
  exec 'hi semshiErrorSign' . s:fg_red . s:bg_none
  exec 'hi semshiErrorChar' . s:fg_red . s:bg_none
  "===============================================================
  " Lua:
  "===============================================================
  exec 'hi luaFunc' . s:fg_green . s:bg_none . s:bold
  exec 'hi luaFunction' . s:fg_aqua . s:bg_none
  exec 'hi luaTable' . s:fg_fg0 . s:bg_none
  exec 'hi luaIn' . s:fg_red . s:bg_none . s:italic
  " vim-lua: https://github.com/tbastos/vim-lua
  exec 'hi luaFuncCall' . s:fg_green . s:bg_none . s:bold
  exec 'hi luaLocal' . s:fg_orange . s:bg_none
  exec 'hi luaSpecialValue' . s:fg_green . s:bg_none . s:bold
  exec 'hi luaBraces' . s:fg_fg0 . s:bg_none
  exec 'hi luaBuiltIn' . s:fg_purple . s:bg_none
  exec 'hi luaNoise' . s:fg_grey1 . s:bg_none
  exec 'hi luaLabel' . s:fg_purple . s:bg_none
  exec 'hi luaFuncTable' . s:fg_yellow . s:bg_none
  exec 'hi luaFuncArgName' . s:fg_blue . s:bg_none
  exec 'hi luaEllipsis' . s:fg_orange . s:bg_none
  exec 'hi luaDocTag' . s:fg_green . s:bg_none
  "===============================================================
  " Java:
  "===============================================================
  exec 'hi javaClassDecl' . s:fg_red . s:bg_none . s:italic
  exec 'hi javaMethodDecl' . s:fg_red . s:bg_none . s:italic
  exec 'hi javaVarArg' . s:fg_green . s:bg_none
  exec 'hi javaAnnotation' . s:fg_blue . s:bg_none
  exec 'hi javaUserLabel' . s:fg_purple . s:bg_none
  exec 'hi javaTypedef' . s:fg_aqua . s:bg_none
  exec 'hi javaParen' . s:fg_fg0 . s:bg_none
  exec 'hi javaParen1' . s:fg_fg0 . s:bg_none
  exec 'hi javaParen2' . s:fg_fg0 . s:bg_none
  exec 'hi javaParen3' . s:fg_fg0 . s:bg_none
  exec 'hi javaParen4' . s:fg_fg0 . s:bg_none
  exec 'hi javaParen5' . s:fg_fg0 . s:bg_none
  "===============================================================
  " Kotlin:
  " kotlin-vim: https://github.com/udalov/kotlin-vim
  "===============================================================
  exec 'hi ktSimpleInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi ktComplexInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi ktComplexInterpolationBrace' . s:fg_yellow . s:bg_none
  exec 'hi ktStructure' . s:fg_red . s:bg_none . s:italic
  exec 'hi ktKeyword' . s:fg_aqua . s:bg_none
  "===============================================================
  " Scala:
  " builtin: https://github.com/derekwyatt/vim-scala
  "===============================================================
  exec 'hi scalaNameDefinition' . s:fg_aqua . s:bg_none
  exec 'hi scalaInterpolationBoundary' . s:fg_yellow . s:bg_none
  exec 'hi scalaInterpolation' . s:fg_blue . s:bg_none
  exec 'hi scalaTypeOperator' . s:fg_orange . s:bg_none
  exec 'hi scalaOperator' . s:fg_orange . s:bg_none
  exec 'hi scalaKeywordModifier' . s:fg_orange . s:bg_none
  "===============================================================
  " Go:
  "===============================================================
  exec 'hi goDirective' . s:fg_purple . s:bg_none . s:italic
  exec 'hi goConstants' . s:fg_aqua . s:bg_none
  exec 'hi goDeclType' . s:fg_orange . s:bg_none . s:italic
  exec 'hi goFunctionCall' . s:fg_yellow . s:bg_none . s:bold
  exec 'hi goSpaceError'. s:fg_grey1. s:bg_red
  exec 'hi goPackage' . s:fg_purple . s:bg_none . s:bold
  exec 'hi goImport' . s:fg_purple . s:bg_none . s:bold
  exec 'hi goVarArgs' . s:fg_blue . s:bg_none
  exec 'hi goBuiltins' . s:fg_green . s:bg_none . s:bold
  exec 'hi goPredefinedIdentifiers' . s:fg_aqua . s:bg_none
  exec 'hi goVar' . s:fg_orange . s:bg_none
  "===============================================================
  " Rust:
  " builtin: https://github.com/rust-lang/rust.vim
  "===============================================================
  exec 'hi rustStructure' . s:fg_orange . s:bg_none
  exec 'hi rustIdentifier' . s:fg_purple . s:bg_none
  exec 'hi rustModPath' . s:fg_orange . s:bg_none
  exec 'hi rustModPathSep' . s:fg_grey1 . s:bg_none
  exec 'hi rustSelf' . s:fg_blue . s:bg_none
  exec 'hi rustSuper' . s:fg_blue . s:bg_none
  exec 'hi rustDeriveTrait' . s:fg_purple . s:bg_none . s:italic
  exec 'hi rustEnumVariant' . s:fg_purple . s:bg_none
  exec 'hi rustMacroVariable' . s:fg_blue . s:bg_none
  exec 'hi rustAssert' . s:fg_aqua . s:bg_none
  exec 'hi rustPanic' . s:fg_aqua . s:bg_none
  exec 'hi rustPubScopeCrate' . s:fg_purple . s:bg_none . s:italic
  "===============================================================
  " Swift:
  " swift.vim: https://github.com/keith/swift.vim
  "===============================================================
  exec 'hi swiftInterpolatedWrapper' . s:fg_yellow . s:bg_none
  exec 'hi swiftInterpolatedString' . s:fg_blue . s:bg_none
  exec 'hi swiftProperty' . s:fg_aqua . s:bg_none
  exec 'hi swiftTypeDeclaration' . s:fg_orange . s:bg_none
  exec 'hi swiftClosureArgument' . s:fg_purple . s:bg_none
  "===============================================================
  " PHP:
  " builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD
  "===============================================================
  exec 'hi phpVarSelector' . s:fg_blue . s:bg_none
  exec 'hi phpDefine' . s:fg_orange . s:bg_none . s:italic
  exec 'hi phpStructure' . s:fg_red . s:bg_none . s:italic
  exec 'hi phpSpecialFunction' . s:fg_green . s:bg_none . s:bold
  exec 'hi phpInterpSimpleCurly' . s:fg_yellow . s:bg_none
  exec 'hi phpComparison' . s:fg_orange . s:bg_none
  exec 'hi phpMethodsVar' . s:fg_aqua . s:bg_none
  exec 'hi phpMemberSelector' . s:fg_green . s:bg_none
  " php.vim: https://github.com/StanAngeloff/php.vim
  exec 'hi phpParent' . s:fg_fg0 . s:bg_none
  exec 'hi phpNowDoc' . s:fg_green . s:bg_none
  exec 'hi phpFunction' . s:fg_green . s:bg_none . s:bold
  exec 'hi phpMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi phpClass' . s:fg_orange . s:bg_none
  exec 'hi phpSuperglobals' . s:fg_purple . s:bg_none
  "===============================================================
  " Ruby:
  " builtin: https://github.com/vim-ruby/vim-ruby
  "===============================================================
  exec 'hi rubyKeywordAsMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi rubyInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi rubyInterpolationDelimiter' . s:fg_yellow . s:bg_none
  exec 'hi rubyStringDelimiter' . s:fg_green . s:bg_none
  exec 'hi rubyBlockParameterList' . s:fg_blue . s:bg_none
  exec 'hi rubyDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi rubyModuleName' . s:fg_purple . s:bg_none
  exec 'hi rubyAccess' . s:fg_orange . s:bg_none
  exec 'hi rubyAttribute' . s:fg_yellow . s:bg_none
  exec 'hi rubyMacro' . s:fg_red . s:bg_none . s:italic
  "===============================================================
  " Haskell:
  " haskell-vim: https://github.com/neovimhaskell/haskell-vim
  "===============================================================
  exec 'hi haskellBrackets' . s:fg_blue . s:bg_none
  exec 'hi haskellIdentifier' . s:fg_yellow . s:bg_none
  exec 'hi haskellAssocType' . s:fg_aqua . s:bg_none
  exec 'hi haskellQuotedType' . s:fg_aqua . s:bg_none
  exec 'hi haskellType' . s:fg_aqua . s:bg_none
  exec 'hi haskellDeclKeyword' . s:fg_red . s:bg_none . s:italic
  exec 'hi haskellWhere' . s:fg_red . s:bg_none . s:italic
  exec 'hi haskellDeriving' . s:fg_purple . s:bg_none . s:italic
  exec 'hi haskellForeignKeywords' . s:fg_purple . s:bg_none . s:italic
  "===============================================================
  " Perl:
  " builtin: https://github.com/vim-perl/vim-perl
  "===============================================================
  exec 'hi perlStatementPackage' . s:fg_purple . s:bg_none . s:italic
  exec 'hi perlStatementInclude' . s:fg_purple . s:bg_none . s:italic
  exec 'hi perlStatementStorage' . s:fg_orange . s:bg_none
  exec 'hi perlStatementList' . s:fg_orange . s:bg_none
  exec 'hi perlMatchStartEnd' . s:fg_orange . s:bg_none
  exec 'hi perlVarSimpleMemberName' . s:fg_aqua . s:bg_none
  exec 'hi perlVarSimpleMember' . s:fg_fg0 . s:bg_none
  exec 'hi perlMethod' . s:fg_green . s:bg_none . s:bold
  exec 'hi podVerbatimLine' . s:fg_green . s:bg_none
  exec 'hi podCmdText' . s:fg_yellow . s:bg_none
  "===============================================================
  " OCaml:
  " builtin: https://github.com/rgrinberg/vim-ocaml
  "===============================================================
  exec 'hi ocamlArrow' . s:fg_orange . s:bg_none
  exec 'hi ocamlEqual' . s:fg_orange . s:bg_none
  exec 'hi ocamlOperator' . s:fg_orange . s:bg_none
  exec 'hi ocamlKeyChar' . s:fg_orange . s:bg_none
  exec 'hi ocamlModPath' . s:fg_green . s:bg_none
  exec 'hi ocamlFullMod' . s:fg_green . s:bg_none
  exec 'hi ocamlModule' . s:fg_purple . s:bg_none
  exec 'hi ocamlConstructor' . s:fg_aqua . s:bg_none
  exec 'hi ocamlFuncWith' . s:fg_yellow . s:bg_none
  exec 'hi ocamlWith' . s:fg_yellow . s:bg_none
  exec 'hi ocamlModParam' . s:fg_fg0 . s:bg_none
  exec 'hi ocamlModParam1' . s:fg_fg0 . s:bg_none
  exec 'hi ocamlAnyVar' . s:fg_blue . s:bg_none
  exec 'hi ocamlPpxEncl' . s:fg_orange . s:bg_none
  exec 'hi ocamlPpxIdentifier' . s:fg_blue . s:bg_none
  exec 'hi ocamlSigEncl' . s:fg_orange . s:bg_none
  exec 'hi ocamlStructEncl' . s:fg_aqua . s:bg_none
  exec 'hi ocamlModParam1' . s:fg_blue . s:bg_none
  "===============================================================
  " Erlang:
  " builtin: https://github.com/vim-erlang/vim-erlang-runtime
  "===============================================================
  exec 'hi erlangAtom' . s:fg_aqua . s:bg_none
  exec 'hi erlangLocalFuncRef' . s:fg_green . s:bg_none . s:bold
  exec 'hi erlangLocalFuncCall' . s:fg_green . s:bg_none . s:bold
  exec 'hi erlangGlobalFuncRef' . s:fg_green . s:bg_none . s:bold
  exec 'hi erlangGlobalFuncCall' . s:fg_green . s:bg_none . s:bold
  exec 'hi erlangAttribute' . s:fg_purple . s:bg_none . s:italic
  exec 'hi erlangPipe' . s:fg_orange . s:bg_none
  "===============================================================
  " Elixir:
  " vim-elixir: https://github.com/elixir-editors/vim-elixir
  "===============================================================
  exec 'hi elixirStringDelimiter' . s:fg_green . s:bg_none
  exec 'hi elixirKeyword' . s:fg_orange . s:bg_none
  exec 'hi elixirInterpolation' . s:fg_yellow . s:bg_none
  exec 'hi elixirInterpolationDelimiter' . s:fg_yellow . s:bg_none
  exec 'hi elixirSelf' . s:fg_purple . s:bg_none
  exec 'hi elixirPseudoVariable' . s:fg_purple . s:bg_none
  exec 'hi elixirModuleDefine' . s:fg_purple . s:bg_none . s:italic
  exec 'hi elixirBlockDefinition' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirPrivateDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirGuard' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirPrivateGuard' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirProtocolDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirImplDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirRecordDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirPrivateRecordDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirMacroDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirPrivateMacroDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirDelegateDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirOverridableDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirExceptionDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirCallbackDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirStructDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi elixirExUnitMacro' . s:fg_red . s:bg_none . s:italic
  "===============================================================
  " Clojure:
  " builtin: https://github.com/guns/vim-clojure-static
  "===============================================================
  exec 'hi clojureMacro' . s:fg_purple . s:bg_none . s:italic
  exec 'hi clojureFunc' . s:fg_aqua . s:bg_none . s:bold
  exec 'hi clojureConstant' . s:fg_yellow . s:bg_none
  exec 'hi clojureSpecial' . s:fg_red . s:bg_none . s:italic
  exec 'hi clojureDefine' . s:fg_red . s:bg_none . s:italic
  exec 'hi clojureKeyword' . s:fg_orange . s:bg_none
  exec 'hi clojureVariable' . s:fg_blue . s:bg_none
  exec 'hi clojureMeta' . s:fg_yellow . s:bg_none
  exec 'hi clojureDeref' . s:fg_yellow . s:bg_none
  "===============================================================
  " Matlab:
  "===============================================================
  exec 'hi matlabSemicolon' . s:fg_fg0 . s:bg_none
  exec 'hi matlabFunction' . s:fg_red . s:bg_none . s:italic
  exec 'hi matlabImplicit' . s:fg_green . s:bg_none . s:bold
  exec 'hi matlabDelimiter' . s:fg_fg0 . s:bg_none
  exec 'hi matlabOperator' . s:fg_green . s:bg_none . s:bold
  exec 'hi matlabArithmeticOperator' . s:fg_orange . s:bg_none
  exec 'hi matlabArithmeticOperator' . s:fg_orange . s:bg_none
  exec 'hi matlabRelationalOperator' . s:fg_orange . s:bg_none
  exec 'hi matlabRelationalOperator' . s:fg_orange . s:bg_none
  exec 'hi matlabLogicalOperator' . s:fg_orange . s:bg_none
  "===============================================================
  " Zsh:
  " builtin: https://github.com/chrisbra/vim-zsh
  "===============================================================
  exec 'hi zshOptStart' . s:fg_purple . s:bg_none . s:italic
  exec 'hi zshOption' . s:fg_blue . s:bg_none
  exec 'hi zshSubst' . s:fg_yellow . s:bg_none
  exec 'hi zshFunction' . s:fg_green . s:bg_none . s:bold
  exec 'hi zshDeref' . s:fg_blue . s:bg_none
  exec 'hi zshTypes' . s:fg_orange . s:bg_none
  exec 'hi zshVariableDef' . s:fg_blue . s:bg_none
  "===============================================================
  " Fish:
  " vim-fish: https://github.com/georgewitteman/vim-fish
  "===============================================================
  exec 'hi fishStatement' . s:fg_orange . s:bg_none
  exec 'hi fishLabel' . s:fg_red . s:bg_none . s:italic
  exec 'hi fishCommandSub' . s:fg_yellow . s:bg_none
  "===============================================================
  " PowerShell:
  " vim-ps1: https://github.com/PProvost/vim-ps1
  "===============================================================
  exec 'hi ps1FunctionInvocation' . s:fg_aqua . s:bg_none . s:bold
  exec 'hi ps1FunctionDeclaration' . s:fg_aqua . s:bg_none . s:bold
  exec 'hi ps1InterpolationDelimiter' . s:fg_yellow . s:bg_none
  exec 'hi ps1BuiltIn' . s:fg_yellow . s:bg_none
  "===============================================================
  " VimL:
  "===============================================================
  exec 'hi vimCommentTitle'. s:fg_grey1. s:bg_none. s:bold
  exec 'hi vimLet' . s:fg_orange . s:bg_none
  exec 'hi vimFunction' . s:fg_green . s:bg_none . s:bold
  exec 'hi vimIsCommand' . s:fg_fg0 . s:bg_none
  exec 'hi vimUserFunc' . s:fg_green . s:bg_none . s:bold
  exec 'hi vimFuncName' . s:fg_green . s:bg_none . s:bold
  exec 'hi vimMap' . s:fg_purple . s:bg_none . s:italic
  exec 'hi vimNotation' . s:fg_aqua . s:bg_none
  exec 'hi vimMapLhs' . s:fg_green . s:bg_none
  exec 'hi vimMapRhs' . s:fg_green . s:bg_none
  exec 'hi vimSetEqual' . s:fg_yellow . s:bg_none
  exec 'hi vimSetSep' . s:fg_fg0 . s:bg_none
  exec 'hi vimOption' . s:fg_aqua . s:bg_none
  exec 'hi vimUserAttrbKey' . s:fg_yellow . s:bg_none
  exec 'hi vimUserAttrb' . s:fg_green . s:bg_none
  exec 'hi vimAutoCmdSfxList' . s:fg_aqua . s:bg_none
  exec 'hi vimSynType' . s:fg_orange . s:bg_none
  exec 'hi vimHiBang' . s:fg_orange . s:bg_none
  exec 'hi vimSet' . s:fg_yellow . s:bg_none
  exec 'hi vimSetSep' . s:fg_grey1 . s:bg_none
  exec 'hi vimContinue' . s:fg_grey1 . s:bg_none
  "===============================================================
  " Makefile:
  "===============================================================
  exec 'hi makeIdent' . s:fg_aqua . s:bg_none
  exec 'hi makeSpecTarget' . s:fg_yellow . s:bg_none
  exec 'hi makeTarget' . s:fg_blue . s:bg_none
  exec 'hi makeCommands' . s:fg_orange . s:bg_none
  "===============================================================
  " Json:
  "===============================================================
  exec 'hi jsonKeyword' . s:fg_orange . s:bg_none
  exec 'hi jsonQuote' . s:fg_grey1 . s:bg_none
  exec 'hi jsonBraces' . s:fg_fg0 . s:bg_none
  "===============================================================
  " Yaml:
  "===============================================================
  exec 'hi yamlKey' . s:fg_orange . s:bg_none
  exec 'hi yamlConstant' . s:fg_purple . s:bg_none
  "===============================================================
  " Toml:
  "===============================================================
  exec 'hi tomlTable'. s:fg_purple. s:bg_none. s:bold
  exec 'hi tomlKey' . s:fg_orange . s:bg_none
  exec 'hi tomlBoolean' . s:fg_aqua . s:bg_none
  exec 'hi tomlTableArray'. s:fg_purple. s:bg_none. s:bold
  "===============================================================
  " Diff:
  "===============================================================
  exec 'hi diffAdded' . s:fg_green . s:bg_none
  exec 'hi diffRemoved' . s:fg_red . s:bg_none
  exec 'hi diffChanged' . s:fg_blue . s:bg_none
  exec 'hi diffOldFile' . s:fg_yellow . s:bg_none
  exec 'hi diffNewFile' . s:fg_orange . s:bg_none
  exec 'hi diffFile' . s:fg_aqua . s:bg_none
  exec 'hi diffLine' . s:fg_grey1 . s:bg_none
  exec 'hi diffIndexLine' . s:fg_purple . s:bg_none
  "===============================================================
  " Git Commit:
  "===============================================================
  exec 'hi gitcommitSummary' . s:fg_red . s:bg_none
  exec 'hi gitcommitUntracked' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitDiscarded' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitSelected' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitUnmerged' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitOnBranch' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitArrow' . s:fg_grey1 . s:bg_none
  exec 'hi gitcommitFile' . s:fg_green . s:bg_none
  "===============================================================
  "INI:
  "===============================================================
  exec 'hi dosiniHeader'. s:fg_red. s:bg_none. s:bold
  exec 'hi dosiniLabel' . s:fg_yellow . s:bg_none
  exec 'hi dosiniValue' . s:fg_green . s:bg_none
  exec 'hi dosiniNumber' . s:fg_green . s:bg_none
  "===============================================================
  exec 'hi cmakeCommand' . s:fg_orange . s:bg_none
  exec 'hi cmakeKWconfigure_package_config_file' . s:fg_yellow . s:bg_none
  exec 'hi cmakeKWwrite_basic_package_version_file' . s:fg_yellow . s:bg_none
  exec 'hi cmakeKWExternalProject' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_compile_definitions' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_compile_options' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_custom_command' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_custom_target' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_definitions' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_dependencies' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_executable' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_library' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_link_options' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_subdirectory' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWadd_test' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWbuild_command' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWcmake_host_system_information' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWcmake_minimum_required' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWcmake_parse_arguments' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWcmake_policy' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWconfigure_file' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWcreate_test_sourcelist' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_build' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_configure' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_coverage' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_memcheck' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_run_script' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_start' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_submit' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_test' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_update' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWctest_upload' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWdefine_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWdoxygen_add_docs' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWenable_language' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWenable_testing' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWexec_program' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWexecute_process' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWexport' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWexport_library_dependencies' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfile' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfind_file' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfind_library' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfind_package' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfind_path' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfind_program' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfltk_wrap_ui' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWforeach' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWfunction' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_cmake_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_directory_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_filename_component' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_source_file_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_target_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWget_test_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWif' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinclude' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinclude_directories' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinclude_external_msproject' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinclude_guard' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinstall' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinstall_files' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinstall_programs' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWinstall_targets' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWlink_directories' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWlist' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWload_cache' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWload_command' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWmacro' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWmark_as_advanced' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWmath' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWmessage' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWoption' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWproject' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWqt_wrap_cpp' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWqt_wrap_ui' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWremove' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWseparate_arguments' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset_directory_properties' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset_property' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset_source_files_properties' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset_target_properties' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWset_tests_properties' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWsource_group' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWstring' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWsubdirs' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_compile_definitions' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_compile_features' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_compile_options' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_include_directories' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_link_directories' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_link_libraries' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_link_options' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_precompile_headers' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtarget_sources' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtry_compile' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWtry_run' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWunset' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWuse_mangled_mesa' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWvariable_requires' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWvariable_watch' . s:fg_aqua . s:bg_none
  exec 'hi cmakeKWwrite_file' . s:fg_aqua . s:bg_none
  "===============================================================
  " neoclide/coc.nvim
  "===============================================================
  exec 'hi CocHoverRange'. s:fg_none. s:bg_none. s:bold . s:underline
  exec 'hi CocHintHighlight'. s:fg_none. s:bg_none. s:undercurl. s:sp_aqua
  exec 'hi CocErrorFloat'. s:fg_red. s:bg_bg3
  exec 'hi CocWarningFloat'. s:fg_yellow. s:bg_bg3
  exec 'hi CocInfoFloat'. s:fg_blue. s:bg_bg3
  exec 'hi CocHintFloat'. s:fg_aqua. s:bg_bg3
  exec 'hi CocHighlightText'. s:bg_fg3
  exec 'hi CocErrorSign' . s:fg_red . s:bg_none
  exec 'hi CocWarningSign' . s:fg_yellow . s:bg_none
  exec 'hi CocInfoSign' . s:fg_blue . s:bg_none
  exec 'hi CocHintSign' . s:fg_aqua . s:bg_none
  exec 'hi CocErrorHighlight' . s:fg_none . s:bg_none . s:undercurl . s:sp_red
  exec 'hi CocWarningHighlight' . s:fg_none . s:bg_none . s:undercurl . s:sp_yellow
  exec 'hi CocInfoHighlight' . s:fg_none . s:bg_none . s:undercurl . s:sp_blue
  exec 'hi CocWarningVirtualText' . s:fg_grey1 . s:bg_none
  exec 'hi CocErrorVirtualText' . s:fg_grey1 . s:bg_none
  exec 'hi CocInfoVirtualText' . s:fg_grey1 . s:bg_none
  exec 'hi CocHintVirtualText' . s:fg_grey1 . s:bg_none
  exec 'hi CocCodeLens' . s:fg_grey1 . s:bg_none
  exec 'hi HighlightedyankRegion'. s:fg_none. s:bg_none. s:reverse
  exec 'hi CocGitAddedSign' . s:fg_green . s:bg_none
  exec 'hi CocGitChangeRemovedSign' . s:fg_purple . s:bg_none
  exec 'hi CocGitChangedSign' . s:fg_blue . s:bg_none
  exec 'hi CocGitRemovedSign' . s:fg_red . s:bg_none
  exec 'hi CocGitTopRemovedSign' . s:fg_red . s:bg_none
  "===============================================================
  " dense-analysis/ale
  "===============================================================
  exec 'hi ALEError'. s:fg_none. s:bg_none. s:undercurl. s:sp_red
  exec 'hi ALEWarning'. s:fg_none. s:bg_none. s:undercurl. s:sp_yellow
  exec 'hi ALEInfo'. s:fg_none. s:bg_none. s:undercurl. s:sp_blue
  exec 'hi ALEErrorSign' . s:fg_red . s:bg_none
  exec 'hi ALEWarningSign' . s:fg_yellow . s:bg_none
  exec 'hi ALEInfoSign' . s:fg_blue . s:bg_none
  exec 'hi ALEVirtualTextError' . s:fg_grey1 . s:bg_none
  exec 'hi ALEVirtualTextWarning' . s:fg_grey1 . s:bg_none
  exec 'hi ALEVirtualTextInfo' . s:fg_grey1 . s:bg_none
  exec 'hi ALEVirtualTextStyleError' . s:fg_grey1 . s:bg_none
  exec 'hi ALEVirtualTextStyleWarning' . s:fg_grey1 . s:bg_none
  "===============================================================
  " neomake/neomake
  "===============================================================
  exec 'hi NeomakeError' . s:fg_none . s:bg_none . s:undercurl . s:sp_red
  exec 'hi NeomakeErrorSign' . s:fg_red . s:bg_none
  exec 'hi NeomakeWarning' . s:fg_none . s:bg_none . s:undercurl . s:sp_yellow
  exec 'hi NeomakeWarningSign' . s:fg_yellow . s:bg_none
  exec 'hi NeomakeInfo'. s:fg_none. s:bg_none. s:undercurl. s:sp_blue
  exec 'hi NeomakeInfoSign' . s:fg_blue . s:bg_none
  exec 'hi NeomakeMessage' . s:fg_aqua . s:bg_none
  exec 'hi NeomakeMessageSign' . s:fg_aqua . s:bg_none
  exec 'hi NeomakeVirtualtextError' . s:fg_grey1 . s:bg_none
  exec 'hi NeomakeVirtualtextWarning' . s:fg_grey1 . s:bg_none
  exec 'hi NeomakeVirtualtextInfo' . s:fg_grey1 . s:bg_none
  exec 'hi NeomakeVirtualtextMessag' . s:fg_grey1 . s:bg_none
  "===============================================================
  " vim-syntastic/syntastic
  "===============================================================
  exec 'hi SyntasticError' . s:fg_none . s:bg_none . s:undercurl . s:sp_red
  exec 'hi SyntasticWarning' . s:fg_none . s:bg_none . s:undercurl . s:sp_yellow
  exec 'hi SyntasticErrorSign' . s:fg_red . s:bg_none
  exec 'hi SyntasticWarningSign' . s:fg_yellow . s:bg_none
  "===============================================================
  " Shougo/denite.nvim
  "===============================================================
  exec 'hi deniteMatchedChar'. s:fg_green. s:bg_none. s:bold
  exec 'hi deniteMatchedRange'. s:fg_green. s:bg_none. s:bold.s:underline
  exec 'hi deniteInput'. s:fg_green. s:bg_bg4. s:bold
  exec 'hi deniteStatusLineNumber'. s:fg_purple. s:bg_bg4
  exec 'hi deniteStatusLinePath'. s:fg_fg0. s:bg_bg4
  exec 'hi deniteSelectedLin' . s:fg_green. s:bg_none
  "===============================================================
  " liuchengxu/vista.vim
  "===============================================================
  exec 'hi VistaBracket' . s:fg_grey1 . s:bg_none
  exec 'hi VistaChildrenNr' . s:fg_orange . s:bg_none
  exec 'hi VistaScope' . s:fg_red . s:bg_none
  exec 'hi VistaTag' . s:fg_green . s:bg_none
  exec 'hi VistaPrefix' . s:fg_grey1 . s:bg_none
  exec 'hi VistaColon' . s:fg_green . s:bg_none
  exec 'hi VistaIcon' . s:fg_purple . s:bg_none
  exec 'hi VistaLineNr' . s:fg_fg0 .s:bg_none
  "===============================================================
  " airblade/vim-gitgutter
  "===============================================================
  exec 'hi GitGutterAdd' . s:fg_green . s:bg_none . s:bold
  exec 'hi GitGutterChange' . s:fg_blue . s:bg_none . s:bold
  exec 'hi GitGutterDelete' . s:fg_red . s:bg_none . s:bold
  exec 'hi GitGutterChangeDelete' . s:fg_purple . s:bg_none .s:bold
  "===============================================================
  " mhinz/vim-signify
  "===============================================================
  exec 'hi SignifySignAdd' . s:fg_green . s:bg_none
  exec 'hi SignifySignChange' . s:fg_blue . s:bg_none
  exec 'hi SignifySignDelete' . s:fg_red . s:bg_none
  exec 'hi SignifySignChangeDelete' . s:fg_purple . s:bg_none
  "===============================================================
  " scrooloose/nerdtree
  "===============================================================
  exec 'hi NERDTreeDir' . s:fg_green . s:bg_none
  exec 'hi NERDTreeDirSlash' . s:fg_aqua . s:bg_none
  exec 'hi NERDTreeOpenable' . s:fg_orange . s:bg_none
  exec 'hi NERDTreeClosable' . s:fg_orange . s:bg_none
  exec 'hi NERDTreeFile' . s:fg_fg0 .s:bg_none
  exec 'hi NERDTreeExecFile' . s:fg_yellow . s:bg_none
  exec 'hi NERDTreeUp' . s:fg_grey1 . s:bg_none
  exec 'hi NERDTreeCWD' . s:fg_aqua . s:bg_none
  exec 'hi NERDTreeToggleOn' . s:fg_green . s:bg_none
  exec 'hi NERDTreeToggleOff' . s:fg_red . s:bg_none
  exec 'hi NERDTreeFlags' . s:fg_orange . s:bg_none
  exec 'hi NERDTreeLinkFile' . s:fg_grey1 . s:bg_none
  exec 'hi NERDTreeLinkTarget' . s:fg_green . s:bg_none
  "===============================================================
  " justinmk/vim-dirvish
  "===============================================================
  exec 'hi DirvishPathTail' . s:fg_aqua . s:bg_none
  exec 'hi DirvishArg' . s:fg_yellow . s:bg_none
  "===============================================================
  " andymass/vim-matchup
  "===============================================================
  exec 'hi MatchParenCur'. s:fg_none. s:bg_none. s:bold
  exec 'hi MatchWord'. s:fg_none. s:bg_none. s:underline
  exec 'hi MatchWordCur'. s:fg_none. s:bg_none. s:underline
  "===============================================================
  " easymotion/vim-easymotion
  "===============================================================
  exec 'hi EasyMotionTarget'. s:fg_bg0 . s:bg_green
  exec 'hi EasyMotionShade' . s:fg_grey1 . s:bg_none
  "===============================================================
  " justinmk/vim-sneak
  "===============================================================
  exec 'hi SneakLabelMask'. s:fg_bg_green. s:bg_bg_green
  exec 'hi Sneak' . s:fg_bg0. s:bg_bg_green
  exec 'hi SneakLabel' . s:fg_bg0. s:bg_bg_green
  exec 'hi SneakScope' . s:fg_bg0 . s:bg_fg0
  "===============================================================
  " terryma/vim-multiple-cursors
  exec 'hi multiple_cursors_cursor'. s:fg_none . s:bg_none . s:reverse
  exec 'hi multiple_cursors_visual'. s:fg_none. s:bg_none. s:reverse
  "===============================================================
  " dominikduda/vim_current_word {{{
  "===============================================================
  exec 'hi CursorWord'. s:bg_fg3
  exec 'hi CursorWordTwins'. s:bg_fg3
  "===============================================================
  " itchyny/vim-cursorword {{{
  "===============================================================
  exec 'hi CursorWord0'. s:bg_fg3
  exec 'hi CursorWord1'. s:bg_fg3
  "===============================================================
  " luochen1990/rainbow {{{
  if !exists('g:rbpt_colorpairs')
    let g:rbpt_colorpairs = [['blue', s:colors.blue[0]], ['magenta', s:colors.purple[0]],
          \ ['red', s:colors.red[0]], ['166', s:colors.orange[0]]]
  endif

  let g:rainbow_guifgs = [ s:colors.orange[0], s:colors.red[0], s:colors.purple[0], s:colors.blue[0] ]
  let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

  if !exists('g:rainbow_conf')
    let g:rainbow_conf = {}
  endif
  if !has_key(g:rainbow_conf, 'guifgs')
    let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
  endif
  if !has_key(g:rainbow_conf, 'ctermfgs')
    let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
  endif

  let g:niji_dark_colours = g:rbpt_colorpairs
  let g:niji_light_colours = g:rbpt_colorpairs
  "===============================================================
  " mhinz/vim-startify
  "===============================================================
  exec 'hi StartifyBracket' . s:fg_grey1 . s:bg_none
  exec 'hi StartifyFile' . s:fg_fg0 . s:bg_none
  exec 'hi StartifyNumber' . s:fg_red . s:bg_none
  exec 'hi StartifyPath' . s:fg_green . s:bg_none
  exec 'hi StartifySlash' . s:fg_green . s:bg_none
  exec 'hi StartifySection' . s:fg_blue . s:bg_none
  exec 'hi StartifyHeader' . s:fg_orange . s:bg_none
  exec 'hi StartifySpecial' . s:fg_grey1 . s:bg_none
  exec 'hi StartifyFooter' . s:fg_grey1 . s:bg_none
  "===============================================================
  " liuchengxu/vim-which-key
  "===============================================================
  exec 'hi WhichKey' . s:fg_red . s:bg_none
  exec 'hi WhichKeySeperator' . s:fg_green . s:bg_none
  exec 'hi WhichKeyGroup' . s:fg_yellow . s:bg_none
  exec 'hi WhichKeyDesc' . s:fg_blue . s:bg_none
  "===============================================================
  " cohama/agit.vim
  "===============================================================
  exec 'hi agitTree' . s:fg_grey1 . s:bg_none
  exec 'hi agitDate' . s:fg_green . s:bg_none
  exec 'hi agitRemote' . s:fg_red . s:bg_none
  exec 'hi agitHead' . s:fg_orange . s:bg_none
  exec 'hi agitRef' . s:fg_aqua . s:bg_none
  exec 'hi agitTag' . s:fg_orange . s:bg_none
  exec 'hi agitStatFile' . s:fg_blue . s:bg_none
  exec 'hi agitStatRemoved' . s:fg_red . s:bg_none
  exec 'hi agitStatAdded' . s:fg_green . s:bg_none
  exec 'hi agitStatMessage' . s:fg_orange . s:bg_none
  exec 'hi agitDiffRemove' . s:fg_red . s:bg_none
  exec 'hi agitDiffAdd' . s:fg_green . s:bg_none
  exec 'hi agitDiffHeader' . s:fg_purple . s:bg_none
  "===============================================================
  " machakann/vim-sandwich
  "===============================================================
  exec 'hi OperatorSandwichChange' .s:fg_fg0 . s:bg_darkgreen
endfunction

command! -nargs=0 OceanicMaterial :call g:OceanicMaterial()

call s:set_color_variables()
call s:apply_syntax_highlightings()

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
