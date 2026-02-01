local M = {}

-- Shim for mason-lspconfig versions that don't provide this module.
-- LazyVim expects get_mason_map().lspconfig_to_package.
function M.get_mason_map()
  local server = require("mason-lspconfig.mappings.server")
  local filetype = require("mason-lspconfig.mappings.filetype")
  local language = require("mason-lspconfig.mappings.language")
  return {
    lspconfig_to_package = server.lspconfig_to_package,
    filetype = filetype,
    language = language,
  }
end

return M
