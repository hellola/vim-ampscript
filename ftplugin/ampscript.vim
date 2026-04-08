" Vim filetype plugin file for AMPscript

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Set comment format for AMPscript (block comments only)
setlocal comments=s:/*,m:*,ex:*/
setlocal commentstring=/*%s*/

" Set format options
setlocal formatoptions-=t
setlocal formatoptions+=croql

" HTML and AMPscript indentation
setlocal autoindent
setlocal smartindent

" Note: AMPscript uses multi-character delimiters (%%[ ]%%)
" which cannot be added to matchpairs (single chars only)

" Define keywords for navigation
setlocal iskeyword+=@-@

let b:undo_ftplugin = "setlocal comments< formatoptions< iskeyword<"
