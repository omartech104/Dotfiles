return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "The One True Text Editor",
      main_image = "neovim", -- "neovim" or "file"
      buttons = true,
      show_time = true,
    })
  end,
}

