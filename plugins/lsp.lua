return {
  'neovim/nvim-lspconfig',
  config = function(plugin, opts)
    require("plugins.configs.lspconfig")(plugin, opts)

    -- Tailwind CSS enabled for clsx
    require('lspconfig').tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "clsx\\(([^)]*)\\)"
            }
          }
        }
      }
    })
  end,
}
