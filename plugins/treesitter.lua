return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'andymass/vim-matchup'
  },
  config = function(plugin, opts)
    opts.highlight.additional_vim_regex_highlighting = true
    opts.indent.enable = true
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "lua", "javascript", "typescript", "tsx", "astro", "prisma" },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer", desc = "around a function" },
            ["if"] = { query = "@function.inner", desc = "inner part of a function" },
            ["ac"] = { query = "@class.outer", desc = "around a class" },
            ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
            ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
            ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
            ["al"] = { query = "@loop.outer", desc = "around a loop" },
            ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
            ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
            ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
          },
          selection_modes = {
            ["@parameter.outer"] = "v",     -- charwise
            ["@parameter.inner"] = "v",     -- charwise
            ["@function.outer"] = "v",      -- charwise
            ["@conditional.outer"] = "V",   -- linewise
            ["@loop.outer"] = "V",          -- linewise
            ["@class.outer"] = "<c-v>",     -- blockwise
          },
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },

        }
      },
      matchup = {
        enable = true,
      },
    })

    require('plugins.configs.nvim-treesitter')(plugin, opts)
    require('treesitter-context').setup()
  end
}
