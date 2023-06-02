return {
  'neovim/nvim-lspconfig',
  config = function(plugin, opts)
    require("plugins.configs.lspconfig")(plugin, opts)
    -- require('lspconfig').cssmodules_ls.setup {}

    -- Tailwind CSS enabled for clsx
    require('lspconfig').tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = { "(clsx|cn)\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" }
          }
        }
      }
    })

    -- require("lspconfig").vtsls.setup {
    --   handlers = {
    --     ["textDocument/publishDiagnostics"] = vim.lsp.with(
    --       vim.lsp.diagnostic.on_publish_diagnostics, {
    --         -- Enable signs
    --         signs = true,
    --       }
    --     )
    --   }
    -- }
  end,
}
