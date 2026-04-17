require "nvchad.options"

vim.opt.textwidth = 0

-- add yours here!
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

vim.diagnostic.config {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
}

vim.opt.colorcolumn = "120"
vim.opt.relativenumber = true
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
