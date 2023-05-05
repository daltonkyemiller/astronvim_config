return {
  'pavanbhat1999/figlet.nvim',
  event = "VeryLazy",
  config = function()
    require('figlet').Config {
      font = '3d',
    }
  end
}
