return {
  'hrsh7th/nvim-cmp',
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.mapping['<A-Space>'] = cmp.mapping({
      i = cmp.mapping.complete({})
    })
    return opts
  end
}
