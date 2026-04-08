# vim-ampscript

AMPscript language support for Vim and Neovim. Provides syntax highlighting, indentation, and filetype detection for Salesforce Marketing Cloud's AMPscript language.

## Features

- **Syntax highlighting** for AMPscript blocks (`%%[ ]%%`, `%%= =%%`)
- **Function highlighting** for all AMPscript functions
- **Variable highlighting** for `@varname` and `[fieldname]` syntax
- **Control structure support** for `if/else/endif`, `for/next`, `do`, `var`, `set`
- **String highlighting** with escape sequence support (`""` and `''`)
- **Block comment** support (`/* */`)
- **Smart indentation** for control structures
- **Auto-pairing** for AMPscript delimiters, brackets, and quotes

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended for Neovim)

```lua
-- In your lazy.nvim configuration (e.g., lua/plugins/ampscript.lua)
return {
  'yourusername/vim-ampscript',
  ft = { 'ampscript' },
  config = function()
    -- Optional: custom configuration
    vim.g.ampscript_highlight_functions = 1
  end
}
```

Or inline in your main config:

```lua
require('lazy').setup({
  'yourusername/vim-ampscript',
  ft = 'ampscript',
})
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'yourusername/vim-ampscript',
  ft = { 'ampscript' }
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
" In your .vimrc or init.vim
Plug 'yourusername/vim-ampscript'
```

Then run:
```vim
:PlugInstall
```

### Using [dein.vim](https://github.com/Shougo/dein.vim)

```vim
call dein#add('yourusername/vim-ampscript')
```

### Using [minpac](https://github.com/k-takata/minpac)

```vim
call minpac#add('yourusername/vim-ampscript')
```

### Manual Installation

For Vim:
```bash
# Clone the repository
git clone https://github.com/yourusername/vim-ampscript.git ~/.vim/pack/plugins/start/vim-ampscript
```

For Neovim:
```bash
# Clone the repository
git clone https://github.com/yourusername/vim-ampscript.git ~/.config/nvim/pack/plugins/start/vim-ampscript
```

## Usage

Files with the `.amp` extension are automatically detected as AMPscript files.

Example AMPscript:
```ampscript
%%[
  SET @firstName = AttributeValue("FirstName")
  SET @email = AttributeValue("EmailAddress")
  
  IF NOT Empty(@firstName) THEN
    SET @greeting = CONCAT("Hello ", @firstName)
  ELSE
    SET @greeting = "Hello Friend"
  ENDIF
]%%

<h1>%%=v(@greeting)=%%</h1>
<p>Your email: %%=v(@email)=%%</p>
```

## File Structure

```
.
├── ftdetect/ampscript.vim    " Filetype detection
├── syntax/ampscript.vim      " Syntax highlighting rules
├── ftplugin/ampscript.vim    " Filetype-specific settings
├── indent/ampscript.vim      " Indentation rules
└── plugin/ampscript.vim      " Plugin entry point
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see LICENSE file for details.

## Credits

- Syntax definitions based on the VSCode AMPscript extension
- Inspired by Salesforce Marketing Cloud AMPscript documentation
