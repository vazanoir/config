local function keymap(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

keymap('n', '<leader>ff', ":Telescope find_files<cr>")
keymap('n', '<leader>fF', ":Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>")
keymap('n', '<leader>fg', ":Telescope live_grep<cr>")
keymap('n', '<leader>fb', ":Telescope buffers<cr>")
keymap('n', '<leader>fh', ":Telescope help_tags<cr>")

keymap('n', '<leader>pi', "<cmd>PackerInstall<cr>")
keymap('n', '<leader>pu', "<cmd>PackerUpdate<cr>")
keymap('n', '<leader>pc', "<cmd>PackerClear<cr>")
keymap('n', '<leader>ps', "<cmd>PackerSync<cr>")

keymap('n', '<leader>lr', "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap('n', '<leader>ld', "<cmd>lua vim.diagnostic.open_float()<cr>")

keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")
