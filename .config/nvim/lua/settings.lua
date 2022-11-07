local g = vim.g
local o = vim.o
local opt = vim.opt

o.scrolloff = 8

o.clipboard = 'unnamedplus'

o.number = true
o.numberwidth = 2
o.relativenumber = true
o.cursorline = true

o.history = 1000

o.splitright = true
o.splitbelow = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 0
o.expandtab = true

g.mapleader = ' '
g.maplocalleader = ' '

opt.completeopt = { 'menu', 'menuone', 'noselect' }

opt.hlsearch = false

opt.wrap = true

opt.termguicolors = true

opt.undofile = true
