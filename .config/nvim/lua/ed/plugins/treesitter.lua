local parsers_installed_at_startup = {
  "vimdoc", "javascript", "typescript", "c", "lua", "rust",
  "jsdoc", "bash", "templ",
}

local languages_without_treesitter_highlighting = { html = true }
local languages_keeping_regex_syntax_highlighting = { markdown = true }
local maximum_highlighted_file_size_in_bytes = 100 * 1024

local function is_tree_sitter_cli_installed()
  return vim.fn.executable("tree-sitter") == 1
end

local function install_startup_parsers()
  if not is_tree_sitter_cli_installed() then
    vim.notify(
      "tree-sitter CLI not found, parsers cannot be installed",
      vim.log.levels.WARN,
      { title = "Treesitter" }
    )
    return
  end

  require("nvim-treesitter").install(parsers_installed_at_startup)
end

local function is_file_too_large_to_highlight(buffer)
  local file_stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buffer))
  return file_stats ~= nil and file_stats.size > maximum_highlighted_file_size_in_bytes
end

local function enable_highlighting(buffer, language)
  if languages_without_treesitter_highlighting[language] then
    return
  end

  if is_file_too_large_to_highlight(buffer) then
    vim.notify(
      "File larger than 100KB treesitter disabled for performance",
      vim.log.levels.WARN,
      { title = "Treesitter" }
    )
    -- Neovim's bundled ftplugins (lua, markdown, help, query) start treesitter on their own.
    vim.treesitter.stop(buffer)
    return
  end

  vim.treesitter.start(buffer, language)

  if languages_keeping_regex_syntax_highlighting[language] then
    vim.bo[buffer].syntax = "ON"
  end
end

local function enable_indentation(buffer, language)
  if not vim.treesitter.query.get(language, "indents") then
    return
  end

  vim.bo[buffer].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

local function enable_treesitter_features(buffer, language)
  enable_highlighting(buffer, language)
  enable_indentation(buffer, language)
end

local function install_parser_then_enable_treesitter_features(buffer, language)
  if not is_tree_sitter_cli_installed() then
    return
  end

  local nvim_treesitter = require("nvim-treesitter")
  if not vim.list_contains(nvim_treesitter.get_available(), language) then
    return
  end

  nvim_treesitter.install(language):await(function()
    if not vim.api.nvim_buf_is_valid(buffer) then
      return
    end
    if not vim.treesitter.language.add(language) then
      return
    end

    enable_treesitter_features(buffer, language)
  end)
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- The main branch does not support lazy-loading.
  lazy = false,
  build = ":TSUpdate",
  config = function()
    install_startup_parsers()

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterFeatures", {}),
      callback = function(event)
        local language = vim.treesitter.language.get_lang(event.match)
        if not language then
          return
        end

        if vim.treesitter.language.add(language) then
          enable_treesitter_features(event.buf, language)
          return
        end

        install_parser_then_enable_treesitter_features(event.buf, language)
      end,
    })
  end,
}
