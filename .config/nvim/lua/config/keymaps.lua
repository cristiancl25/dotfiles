-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>fg",
  require("telescope.builtin").git_files,
  { noremap = true, silent = true, desc = "Find Git Files" }
)
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { noremap = true, silent = true, desc = "Git diff" })
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<CR>", { noremap = true, silent = true, desc = "Neogit" })
vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
vim.keymap.set("n", "Q", ":q<enter>", { noremap = false, silent = true })
vim.keymap.set("n", "QQ", ":qall!<enter>", { noremap = false, silent = true })
vim.g.copilot_no_tab_map = true
