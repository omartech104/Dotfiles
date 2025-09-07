-- File: lua/buffer_tabs_panes.lua
-- Purpose: Manage buffers, tabs, and panes in Neovim

-- BUFFERLINE for buffer tabs
require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "sloped",
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = true,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", padding = 1 }
    },
  }
})

-- KEYMAPS ------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffers
map("n", "<Tab>", "<cmd>bnext<CR>", opts)
map("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<CR>", opts)
map("n", "<leader>tc", "<cmd>tabclose<CR>", opts)
map("n", "<leader>to", "<cmd>tabonly<CR>", opts)
map("n", "<leader>tl", "<cmd>tabnext<CR>", opts)
map("n", "<leader>th", "<cmd>tabprevious<CR>", opts)

-- Panes / Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
map("n", "<leader>sh", "<cmd>split<CR>", opts)
map("n", "<leader>sc", "<C-w>c", opts)
map("n", "<leader>so", "<C-w>o", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Optional: Move splits
map("n", "<A-h>", "<C-w>H", opts)
map("n", "<A-l>", "<C-w>L", opts)
map("n", "<A-j>", "<C-w>J", opts)
map("n", "<A-k>", "<C-w>K", opts)

-- FUNCTIONAL HELP -----------------
-- <Tab> / <S-Tab> to cycle buffers
-- <leader>tn / tc / to to manage tabs
-- <leader>sv / sh to split window
-- Ctrl + hjkl to move between splits
-- Alt + hjkl to rearrange splits

