return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "c",
                "markdown",
                "markdown_inline",
                "python",
                "http",
                "json",
            },
            indent = {
                enable = true,
            },
        },
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

                -- python
                "pyright",
                "ruff",
                "isort",
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            git = {
                enable = true,
            },

            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "rbong/vim-flog",
        dependencies = { "tpope/vim-fugitive" },
        cmd = { "Flog", "Flogsplit" },
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>qx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>qX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>ql",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>qq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "abidibo/nvim-httpyac",
        cmd = { "NvimHttpYac", "NvimHttpYacAll", "NvimHttpYacPicker", "NvimHttpYacEnv", "NvimHttpYacEnvClear" },
        keys = {
            { "<Leader>rq", "<cmd>NvimHttpYac<CR>", desc = "Run request" },
            { "<Leader>rr", "<cmd>NvimHttpYacAll<CR>", desc = "Run all requests" },
            { "<Leader>rp", "<cmd>NvimHttpYacPicker<CR>", desc = "Run named request" },
            { "<Leader>re", "<cmd>NvimHttpYacEnv<CR>", desc = "Select environment" },
            { "<Leader>rc", "<cmd>NvimHttpYacEnvClear<CR>", desc = "Clear environment" },
        },
        opts = {
            output_view = "vertical",
        },
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
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
}
