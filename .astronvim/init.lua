local config = {
  mappings = {
    v = {
      ["J"] = { ":m '>+1<CR>gv=gv" },
      ["K"] = { ":m '<-2<CR>gv=gv" }
    },
    n = {
      ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>" },
    }
  },
  plugins = {
    init = {
      { "editorconfig/editorconfig-vim" },
      ["akinsho/bufferline.nvim"] = { disable = true },
      ["akinsho/toggleterm.nvim"] = { disable = true },
      ["declancm/cinnamon.nvim"] = { disable = true },
    },
  },
  default_theme = {
    colors = {
      bg = "#1d1f21"
    }
  }
}

return config;
