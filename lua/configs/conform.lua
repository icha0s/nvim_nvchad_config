local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "isort", "ruff" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
    },

    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
}

return options
