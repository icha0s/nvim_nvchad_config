return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
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
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
}
