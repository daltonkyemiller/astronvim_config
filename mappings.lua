-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- go to beginning and end of line to , and . respectively
    ["H"] = "^",
    ["L"] = "$",
    -- keeps the cursor in the middle of the screen when scrolling
    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",
    ["<leader>fw"] = {
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      desc = "Live Grep With Args"
    },
    ["<leader>lo"] = {
      function()
        vim.lsp.buf.execute_command({ command = "typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
      end,
      desc = "Organize Imports",
    },
    ["<leader>fu"] = {
      function()
        require("telescope").extensions.undo.undo()
      end,
      desc = "Telescope Undo Tree",
    }
  },
  v = {
    -- remapping go to beginning and end of line to , and . respectively
    ["H"] = "^",
    ["L"] = "$",
    -- Hop Config
    ["<Leader><Leader>t"] = "<cmd>HopPattern<CR>",
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
