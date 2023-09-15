local null_ls = require("null-ls")

-- I don't want eslint to throw errors saying it can't find the config file if I am in a project that doesn't use eslint.
local function has_eslint_file(utils)
  return utils.root_has_file({ '.eslintrc', '.eslintrc.json', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml',
    '.eslintrc.yml', '.eslintrc.ts' })
end

-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = { "tsserver", "lua_ls", "emmet_ls", "tailwindcss", "astro", "cssls", "html",
        "prismals", "sqlls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = { "prettierd", },
      handlers = {
        function() end, -- disables automatic setup of all null-ls sources
        eslint_d = function(source_name, methods)
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslint_file }))
          null_ls.register(null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_file }))
        end

      }
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    disable = true,

    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
