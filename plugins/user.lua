return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    {
      'olimorris/onedarkpro.nvim',
      config = function()
        require("onedarkpro").setup({
          options = {
            transparency = true
          }
        })
      end
    },
    {
      'onsails/lspkind-nvim',
      opts = function(_, opts)
        opts.preset = "codicons"
        return opts
      end
    },
  }
}
