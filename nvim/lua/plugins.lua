vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You add plugins here  
  
  require('rose-pine').setup({
     --- @usage 'main' | 'moon'
     dark_variant = 'main',
     bold_vert_split = true,
     dim_nc_background = false,
     disable_background = false,
     disable_float_background = false,
     disable_italics = false,

     groups = {
       -- use a slight offset from base to get non-transparent bg
       background = '#191725',
     }
  })
  
  -- set colorscheme after options
  vim.cmd('colorscheme rose-pine')
end)

