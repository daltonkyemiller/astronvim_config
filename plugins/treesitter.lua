return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context'
  },
  config = function(plugin, opts)
    opts.ensure_installed = { "lua", "javascript", "typescript", "tsx", "astro", "prisma" }
    opts.highlight.additional_vim_regex_highlighting = true
    opts.indent.enable = false
    require('plugins.configs.nvim-treesitter')(plugin, opts)
    require('treesitter-context').setup()
  end
}
