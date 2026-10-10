return {
  "github/copilot.vim",
  init = function()
    -- The default `npx` launch hits the npm registry on every start; false selects the server bundled with the plugin.
    vim.g.copilot_version = false
  end,
}
