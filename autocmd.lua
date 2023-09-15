local neo_tree_events = require "neo-tree.events"

return {
  setup = function()
    -- vim.api.nvim_create_autocmd({"BufUnload"}, {
    --   pattern = {"*"},
    --   callback = function ()
    --     vim.lsp.buf.format()
    --
    --   end
    -- })

    -- prevent comment on new line
    vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

    neo_tree_events.subscribe {
      event = neo_tree_events.FILE_ADDED,
      --- @param file_path string
      handler = function(file_path)
        if vim.endswith(file_path, ".tsx") then
          local component_name = vim.fn.fnamemodify(file_path, ":t:r")
          component_name = component_name:gsub("^%l", string.upper)

          local file = io.open(file_path, "r+")

          if not file then return end

          local content = file:read "*a"

          if not content or content == "" then
            local str = string.format(
              [[
type %sProps = {

}

export function %s(props: %sProps) {
  const { } = props;

  return (
    <div>
      
    </div>
  );
}]],
              component_name,
              component_name,
              component_name
            )
            file:write(str)
            file:close()
          end
        end
      end,
    }
    -- vim.api.nvim_create_autocmd("BufNewFile", {
    --   pattern = {"*.tsx"},
    --   callback = function ()
    --     local file_name = vim.fn.expand("%:t")
    --     vim.notify("new file")
    --     -- vim.notify("file_name: " .. file_name)
    --
    --
    --
    --
    --   end
    --
    -- })
  end,
}
