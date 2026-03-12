require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lemminx" }
vim.lsp.enable(servers)

local nvlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

local lsp_on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "<leader>lh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", function()
    require("actions-preview").code_actions()
  end, { desc = "Actions" })
end

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = lsp_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.config.ts_ls = {
  on_attach = lsp_on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
vim.lsp.enable "ts_ls"

vim.lsp.config.pyright = {
  on_attach = lsp_on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}
vim.lsp.enable "pyright"
