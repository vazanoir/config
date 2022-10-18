local function keymap(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

local telescope = require('telescope.builtin')
keymap('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fF', telescope.find_files, { silent = true })
-- keymap('n', '<leader>fF', ":Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>")
keymap('n', '<leader>fg', telescope.live_grep)
keymap('n', '<leader>fb', telescope.buffers)
keymap('n', '<leader>fh', telescope.help_tags)

keymap('n', '<leader>pi', "<cmd>PackerInstall<cr>")
keymap('n', '<leader>pu', "<cmd>PackerUpdate<cr>")
keymap('n', '<leader>pc', "<cmd>PackerClear<cr>")
keymap('n', '<leader>ps', "<cmd>PackerSync<cr>")

keymap('n', '<leader>lr', "<cmd>lua vim.lsp.buf.rename()<cr>")

keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")
