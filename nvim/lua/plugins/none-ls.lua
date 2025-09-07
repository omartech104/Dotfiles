return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- 🔵 Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }),

        -- 🐍 Python
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length", "100" },
        }),
        null_ls.builtins.formatting.isort.with({
          extra_args = { "--profile", "black" },
        }),

        -- 🌐 HTML / CSS / JS / etc.
        null_ls.builtins.formatting.prettier.with({
          extra_args = {
            "--print-width", "100",
            "--tab-width", "2",
            "--single-quote", "true",
          },
          filetypes = { "javascript", "typescript", "html", "css", "json", "yaml", "markdown" },
        }),

        -- 🧪 Vimscript
        null_ls.builtins.diagnostics.vint,

        -- 🧱 C / C++
        null_ls.builtins.formatting.clang_format,
        
	-- Java
	null_ls.builtins.formatting.google_java_format,

        -- 🟣 C# using CSharpier
        null_ls.builtins.formatting.csharpier.with({
          command = "csharpier", -- ensure this is installed via: `dotnet tool install -g csharpier`
          args = { "--write-stdout", "$FILENAME" },
          stdin = true,
        }),
      },
    })

    -- 🔧 Format with <leader>gf or :Format
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with null-ls", noremap = true, silent = true })

    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}

