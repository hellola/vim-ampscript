" Vim indent file for AMPscript

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetAMPscriptIndent()
setlocal indentkeys=!^F,o,O,0=else,0=elseif,0=endif,0=next,0=do,0=%%[

if exists("*GetAMPscriptIndent")
  finish
endif

function! GetAMPscriptIndent()
  let line = getline(v:lnum)
  let prevline = getline(v:lnum - 1)

  " Start of AMPscript block
  if line =~ '^\s*%%\['
    return 0
  endif

  " End of AMPscript block
  if line =~ '^\s*\]%%'
    return 0
  endif

  " Inline AMPscript
  if line =~ '^\s*%%='
    return 0
  endif
  if line =~ '^\s*=%%'
    return 0
  endif

  " Check for control structures
  let ind = indent(v:lnum - 1)

  " Increase indent after if, for, do
  if prevline =~ '\c^\s*\(if\|for\|do\)\>'
    let ind = ind + &shiftwidth
  endif

  " Decrease indent for else, elseif, endif, next
  if line =~ '\c^\s*\(else\|elseif\|endif\|next\)\>'
    let ind = ind - &shiftwidth
  endif

  " Decrease indent after closing structures
  if prevline =~ '\c^\s*\(endif\|next\)\>'
    let ind = ind - &shiftwidth
  endif

  return ind
endfunction

let b:undo_indent = "setlocal indentexpr< indentkeys<"
