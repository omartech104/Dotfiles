return {
  -- Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },

  -- Mason-LSP
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ts_ls", "html", "cssls", "jdtls", "lua_ls", "bashls", "omnisharp", "clangd"},
        automatic_installation = true,
      })
    end
  },

  -- Mason-null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua", "black", "isort", "prettier", "vint", "google-java-format"
        },
        automatic_installation = true,
      })
    end,
  },

  -- nvim-cmp + snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
  },

  -- LSP config
  {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Example: override defaults for a server
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      --- you can add other server-specific opts here
    })

    -- Enable the server
    vim.lsp.enable("lua_ls")

    -- Do this for all other servers
    local servers = {
      "pyright", "cssls", "html", "ts_ls", "bashls", "omnisharp",
    }
    for _, srv in ipairs(servers) do
      vim.lsp.enable(srv)
      vim.lsp.config(srv, { capabilities = capabilities })
    end

    -- For Java, special case
    vim.lsp.config("jdtls", {
      cmd = { "jdtls", "-data", "/home/omartech/Personal_Projects/Java_Course" },
      root_dir = require("lspconfig.util").root_pattern(".git", "pom.xml", "build.gradle"),
      capabilities = capabilities,
    })
    vim.lsp.enable("jdtls")

    -- Keymaps (same as before)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  end
}
  }
