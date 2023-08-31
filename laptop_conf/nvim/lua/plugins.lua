vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
- use "nvim-lualine/lualine.nvim"

  -- You add plugins here  
end)
