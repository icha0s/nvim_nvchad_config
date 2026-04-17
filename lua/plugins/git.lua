return {
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
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
