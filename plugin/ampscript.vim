" vim-ampscript - AMPscript language support for Vim/Neovim
" Maintainer:   vim-ampscript contributors
" Version:      1.0.0

if exists('g:loaded_ampscript')
  finish
endif
let g:loaded_ampscript = 1

" Guard to prevent loading if filetype not supported
if !has('autocmd')
  finish
endif

" Ensure the plugin is only loaded once
augroup ampscript_plugin
  autocmd!
augroup END
