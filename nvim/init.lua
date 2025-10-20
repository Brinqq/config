if vim.fn.has('nvim-0.11') == false then
	print("Minimum supported neovim version 0.11")
  return
end

require "config.internals"
require "config.plugins"

require "config.core"
require "config.ui"
require "config.debug"
require "config.lsp"

-- require "config.nvimtree"
require "config.telescope"
require "config.treesitter"
require "config.autopairs"
require "config.harpoon"
require "config.comment"
require "config.leetcode"
require "config.marks"
require "config.latex"
require "config.oil"
