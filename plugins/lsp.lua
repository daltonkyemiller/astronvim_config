return {
  'neovim/nvim-lspconfig',
  event = "VeryLazy",
  config = function(plugin, opts)
    require("plugins.configs.lspconfig")(plugin, opts)
    local lspconfig = require('lspconfig')

    -- Tailwind CSS enabled for clsx
    lspconfig.tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = { "*(?:(clsx|cn))\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
              "*(?:Class|class|classes)?=\\s*(?:\"|'|{`)([^(?:\"|'|`})]*)" }
          }
        }
      }
    })

    -- lspconfig.sqlls.setup({
    --   root_dir = lspconfig.util.root_pattern(".git")
    -- })



    -- local util = require 'lspconfig.util'
    -- lspconfig.vtsls.setup {
    --   root_dir = util.root_pattern(".git")
    --
    -- }


    lspconfig.sourcekit.setup {}
  end,
}
