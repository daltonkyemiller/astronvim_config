return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = function(_, opts)
    opts.filesystem.filtered_items = {
      visible = true
    }
    opts.default_source = "filesystem"
    -- opts.window.position = "float"

    return opts
  end
}
