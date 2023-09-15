return {
  n = {
    ["<leader>lf"] = {
      function ()
        vim.lsp.buf.format()
        vim.cmd("w!")
      end,
      desc = "Format and save"
    }
  }
}
