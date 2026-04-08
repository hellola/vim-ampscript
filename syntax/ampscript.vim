" Vim syntax file for AMPscript
" Language: AMPscript (Salesforce Marketing Cloud)

if exists("b:current_syntax")
  finish
endif

" Load HTML syntax as base (AMPscript is embedded in HTML)
if !exists('main_syntax')
  let main_syntax = 'ampscript'
endif

runtime! syntax/html.vim
unlet b:current_syntax

" AMPscript block delimiters
syntax region ampBlock matchgroup=ampDelimiter start=/%%\[/ end=/\]%%/ contains=@ampScriptInner,ampComment,ampFunction,ampKeyword,ampVariable,ampString,ampNumber,ampConstant,ampOperator keepend
syntax region ampInline matchgroup=ampDelimiter start=/%%=/ end=/=%%/ contains=@ampScriptInner,ampComment,ampFunction,ampKeyword,ampVariable,ampString,ampNumber,ampConstant,ampOperator keepend

" Comments
syntax region ampComment start=/\/\*/ end=/\*\// contained contains=ampTodo
syntax keyword ampTodo TODO FIXME XXX NOTE contained

" Functions
syntax keyword ampFunction beginimpressionregion endimpressionregion beginassetblock endassetblock contentarea contentareabyname contentblockbyname contentblockbyid contentblockbykey treatascontent treatascontentarea lookup lookuprows lookuprowscs rowcount row field now datediff dateparse redirectto random add subtract multiply divide mod concat indexof char empty propercase substring length lowercase uppercase trim regexmatch replace replacelist format iif isnull output outputline v attributevalue contained

" Language elements
syntax keyword ampKeyword do else elseif for if endif next then to downto contained
syntax keyword ampStorage var set contained
syntax keyword ampLogic and or not contained

" Variables
syntax match ampVariable /\@[a-zA-Z0-9_]\+/ contained
syntax match ampVariable /\[[a-zA-Z0-9_]\+\]/ contained

" Operators
syntax match ampOperator /==\|!=\|>\|<\|>=\|<=\|=/ contained

" Strings
syntax region ampString start=/"/ end=/"/ contained contains=ampEscapeDouble
syntax region ampString start=/'/ end=/'/ contained contains=ampEscapeSingle
syntax match ampEscapeDouble /""/ contained
syntax match ampEscapeSingle /''/ contained

" Numbers
syntax match ampNumber /\b\(0\(x\|X\)[0-9a-fA-F]\+\)\b/ contained
syntax match ampNumber /\b\([0-9]\+\(\.[0-9]\+\)\?\)\b/ contained

" Constants
syntax keyword ampConstant true false null contained

" Define highlighting
highlight default link ampDelimiter Keyword
highlight default link ampComment Comment
highlight default link ampTodo Todo
highlight default link ampFunction Function
highlight default link ampKeyword Conditional
highlight default link ampStorage StorageClass
highlight default link ampLogic Operator
highlight default link ampVariable Identifier
highlight default link ampOperator Operator
highlight default link ampString String
highlight default link ampEscapeDouble SpecialChar
highlight default link ampEscapeSingle SpecialChar
highlight default link ampNumber Number
highlight default link ampConstant Constant

let b:current_syntax = "ampscript"
