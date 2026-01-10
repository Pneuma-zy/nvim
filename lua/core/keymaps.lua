local keymap = vim.keymap.set

-- leader 键
vim.g.mapleader = " "

-- 保存
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- 退出
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Telescope模糊查找
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })

-- Filetree文件树
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File tree" })

