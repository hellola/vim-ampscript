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

" Match pairs specific to AMPscript
setlocal matchpairs+=%%[:]

" Define keywords for navigation
setlocal iskeyword+=@-@

let b:undo_ftplugin = "setlocal comments< formatoptions< matchpairs< iskeyword<"
