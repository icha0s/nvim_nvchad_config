require "nvchad.options"

-- add yours here!
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufEnter", {
  pattern = "*",
  command = "set tw=0",
})

vim.opt.colorcolumn = "120"
vim.opt.relativenumber = true

-- highlight yanked text for 200ms using the "IncSearch" highlight group
autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
