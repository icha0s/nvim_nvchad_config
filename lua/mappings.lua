require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "hh", "<ESC>")
map("i", "lll", "<ESC>")

-- common
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find word under cursor" })
map("n", "|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>ds", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Go to reference" })
map(
  "n",
  "<leader>ic",
  "<cmd>Telescope lsp_incoming_calls<cr>",
  { desc = "Lists LSP incoming calls for word under the cursor" }
)
map(
  "n",
  "<leader>oc",
  "<cmd>Telescope lsp_outgoing_calls<cr>",
  { desc = "Lists LSP outgoing calls for word under the cursor" }
)
map("n", "<leader>ts", "<cmd>Telescope treesitter<cr>", { desc = "Lists Function names, variables" })

map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Down" })

-- Git mappings
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gl", "<cmd>Flog<CR>", { desc = "Git Log" })
map("n", "<leader>gf", "<cmd>DiffviewFileHistory<CR>", { desc = "Git File History" })
map("n", "<leader>gc", "<cmd>DiffviewOpen HEAD~1<CR>", { desc = "Git Last Commit" })
map("n", "<leader>ga", "<cmd>Telescope git_commits<cr>", { desc = "Lists git commits with diff preview" })
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", { desc = "Lists git status" })

-- Tabs
map("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Tab - close" })
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Tab - new" })
map("n", "<leader>tt", "<cmd>tabnext<CR>", { desc = "Tab - next" })

map("v", ">", ">gv", { desc = "indent" })
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })

map({ "n", "t" }, "<F7>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating term" })

map("n", "]g", function()
  require("gitsigns").next_hunk()
end, { desc = "Next Git hunk" })
map("n", "[g", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous Git hunk" })
map("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "View Git blame" })
map("n", "<leader>gB", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "View Full Git blame" })
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview Git hunk" })
map("n", "<leader>gh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset Git hunk" })
map("n", "<leader>gr", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset Git buffer" })
map("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage Git hunk" })
map("n", "<leader>gS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage Git buffer" })
map("n", "<leader>gu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Unstage Git hunk" })
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "View Git diff" })
