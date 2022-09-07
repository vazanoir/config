local config = {
  mappings = {
    v = {
      ["J"] = { ":m '>+1<CR>gv=gv" },
      ["K"] = { ":m '<-2<CR>gv=gv" }
    }
  },
  plugins = {
    init = {
      { "editorconfig/editorconfig-vim" },
      ["akinsho/bufferline.nvim"] = { disable = true },
      ["akinsho/toggleterm.nvim"] = { disable = true },
    },
    ["show-key"] = {
      show_help = false,
    }
  }
}

return config;
