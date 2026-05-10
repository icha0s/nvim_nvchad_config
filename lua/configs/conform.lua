local util = require "conform.util"

local python_root = util.root_file { "pyproject.toml", "ruff.toml", ".ruff.toml" }

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        python = { "isort", "ruff" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
    },

    formatters = {
        ruff = {
            require_cwd = true,
            cwd = python_root,
        },
        isort = {
            require_cwd = true,
            cwd = python_root,
        },
    },

    format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
    },
}

return options
