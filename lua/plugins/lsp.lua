return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- lua stuff
                "lua-language-server",
                "stylua",

                -- web dev stuff
                "css-lsp",
                "html-lsp",
                "typescript-language-server",
                "prettier",
                "eslint-lsp",

                -- c/cpp stuff
                "clangd",
                "clang-format",

                -- markdown
                "markdown-oxide",

                -- python
                "pyright",
                "ruff",
                "isort",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },
    {
        "aznhe21/actions-preview.nvim",
        keys = {
            {
                "gf",
                function()
                    require("actions-preview").code_actions()
                end,
                mode = { "v", "n" },
                desc = "Code actions preview",
            },
        },
    },
}
