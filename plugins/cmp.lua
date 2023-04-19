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
      { name = "nvim_lsp",  priority = 100 },
      { name = "ultisnips", priority = 75 },
      { name = "luasnip",   priority = 50 },
      { name = "buffer",    priority = 25 },
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
