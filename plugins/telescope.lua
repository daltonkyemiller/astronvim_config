return {
  'nvim-telescope/telescope.nvim',
  config = function(plugin, opts)
    opts.defaults.layout_strategy = 'vertical'
    opts.defaults.layout_config = {
      vertical = { width = 0.9 }
    }
    opts.defaults.file_ignore_patterns = { "node_modules", ".git", "dist" }
    require('plugins.configs.telescope')(plugin, opts)
  end
}
