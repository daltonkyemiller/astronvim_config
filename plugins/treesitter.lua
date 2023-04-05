return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context'
  },
  config = function(plugin, opts)
    opts.ensure_installed = { "lua", "javascript", "typescript", "tsx", "astro" }
    require('plugins.configs.nvim-treesitter')(plugin, opts)
    require('treesitter-context').setup()
  end
}
