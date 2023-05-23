local types = require('cmp.types')
local function deprioritize_snippet(entry1, entry2)
  print("ENTRY 1")
  print(vim.inspect(entry1:get_kind()))
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
end

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
      i = function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end
    })
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp",  priority = 100 },
      { name = "ultisnips", priority = 75 },
      { name = "luasnip",   priority = 50 },
      { name = "buffer",    priority = 25 },
      { name = "path",      priority = 0 },
    }

    opts.sorting = {
      priority_weight = 2,
      comparators = {
        -- deprioritize_snippet,
        -- the rest of the comparators are pretty much the defaults
        cmp.config.compare.exact,
        cmp.config.compare.offset,
        cmp.config.compare.scopes,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },

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
