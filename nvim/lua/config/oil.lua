local telescope = require"telescope.builtin"

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

require("oil").setup({
  delete_to_trash = true,
  view_options= {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>ec", "<cmd>Oil <cr>", {silent=true, noremap=true})
