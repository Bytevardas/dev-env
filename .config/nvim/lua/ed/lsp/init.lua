return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    local mason_registry = require("mason-registry")
    local ensure_installed = { "prettier", "gofumpt", "goimports", "stylua", "sqlfluff" }
    -- On first launch the registry is not downloaded yet and get_package throws.
    mason_registry.refresh(function()
      for _, tool in ipairs(ensure_installed) do
        local pkg = mason_registry.get_package(tool)
        if not pkg:is_installed() then
          pkg:install()
        end
      end
    end)

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("zls", {
      root_markers = { ".git", "build.zig", "zls.json" },
      settings = {
        zls = {
          enable_inlay_hints = true,
          enable_snippets = true,
          warn_style = true,
        },
      },
    })
    vim.g.zig_fmt_parse_errors = 0
    vim.g.zig_fmt_autosave = 0

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "Lua 5.1" },
          diagnostics = {
            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
          },
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "ts_ls",
        "zls",
      },
      automatic_enable = true,
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end,
}
