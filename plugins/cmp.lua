return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'mlaursen/vim-react-snippets',

  },
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.mapping['<A-Space>'] = cmp.mapping({
      i = cmp.mapping.complete({})
    })
    opts.sources = cmp.config.sources {
      { name = "ultisnips", priority = 1000 },
      { name = "nvim_lsp",  priority = 750 },
      { name = "luasnip",   priority = 500 },
      { name = "buffer",    priority = 250 },
      { name = "path",      priority = 0 },
    }


    opts.formatting.fields = { "abbr", "kind", "menu" }

    opts.formatting.format = function(entry, vim_item)
      vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]

      -- vim_item.menu = ({
      --   nvim_lsp = "[LSP]",
      --   buffer = "[BUF]",
      --   path = "[PATH]",
      --   nvim_lua = "[LUA]",
      --   luasnip = "[SNIP]",
      --   cmp_nvim_ultisnips = "[US]",
      --
      -- })[entry.source.name]

      vim_item.menu = '(' .. entry.source.name .. ')'
      return vim_item
    end
    return opts
  end
}
