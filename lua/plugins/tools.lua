return {
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
