return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  config = function()
    -- First set up catppuccin globally with bufferline integration
    require("catppuccin").setup({
      integrations = {
        bufferline = true, -- this enables automatic bufferline highlights
      },
      transparent_background = true,
    })

    -- Then set up bufferline normally
    require("bufferline").setup({
      options = {
        separator_style = "sloped", -- "thin" | "thick" | "slant"
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })
  end,
}

