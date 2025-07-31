--short map
local o = vim.opt

o.termguicolors = true  -- Sets term gui colors
o.number = true         -- Sets numbers on
o.relativenumber = true -- Sets relative line number
o.tabstop = 2           -- Sets tab jump width
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.cmdheight = 3
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.numberwidth = 4
o.wrap = false
o.scrolloff = 10

o.foldmethod = "manual" -- without this options neovim will hang when a another program interacts with the current neovim file/buffer (Windows)

vim.cmd"set matchpairs="
