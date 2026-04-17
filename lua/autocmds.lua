require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = augroup("highlightyank", { clear = true }),
    pattern = "*",
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})
