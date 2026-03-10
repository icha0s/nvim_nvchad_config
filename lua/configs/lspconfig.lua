require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "clangd", "GitHub Copilot", "pyright", "lemminx", }
vim.lsp.enable(servers)

local nvlsp = require "nvchad.configs.lspconfig"

local map = vim.keymap.set

local lsp_on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  -- map("n", "gd", "<cmd> Telescope lsp_definitions <cr>", opts "Go to definition")
  -- map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map({ "n", "v" }, "<leader>ca", function()
    require("actions-preview").code_actions()
  end, { desc = "Actions" })
  -- map("n", "gr", "<cmd> Telescope lsp_references <cr>", opts "Show references")
end

local make_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

  -- Position encoding fix
  capabilities.general = capabilities.general or {}
  capabilities.general.positionEncodings = { "utf-16", "utf-8" }

  return capabilities
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = lsp_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- vim.lsp.config("*", { on_init = nvlsp.on_init, capabilities = make_capabilities() })

-- configuring single server, example: typescript
vim.lsp.config.ts_ls = {
  on_attach = lsp_on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- vim.lsp.config.pyrefly = {
--   on_attach = lsp_on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "python" },
--   -- root_dir = lspconfig.utils.root_pattern("app")
-- }
-- vim.lsp.config.pyrefly = {
--   -- on_attach = lsp_on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
--   settings = {
--     pyrefly = {
--       diagnostics = {
--         mode = "openFilesOnly",
--       },
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--       },
--       typeChecking = {
--         enabled = false,
--       },
--     },
--   },
-- }
-- vim.lsp.enable "pyrefly"

vim.lsp.config.pyright = {
  on_attach = lsp_on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  -- root_dir = lspconfig.utils.root_pattern("app")
}

-- read :h vim.lsp.config for changing options of lsp servers 
