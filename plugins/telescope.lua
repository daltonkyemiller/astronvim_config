return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-live-grep-args.nvim',
    'debugloop/telescope-undo.nvim'

  },
  config = function(plugin, opts)
    opts.defaults.layout_strategy = 'flex'
    opts.defaults.layout_config = {
      vertical = { width = 0.9 }
    }
    opts.defaults.file_ignore_patterns = { "node_modules", ".git", "dist", "^DEPRECATED", "^deprecated" }
    require('plugins.configs.telescope')(plugin, opts)
    local telescope = require('telescope')
    telescope.load_extension('live_grep_args')
    telescope.load_extension('undo')
  end
}
