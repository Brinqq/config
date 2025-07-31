require "config.core.global"
local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"


telescope.setup{
  pickers = {
    fd = {
            find_command = { "fd", "--type", "d" }, -- Use fd to find only directories
    },

    find_files= {
      no_ignore = true,
      hidden =  true,
    },

    colorscheme = {
      ignore_builtins =  true,
    },
  },

  mappings = {
    i = {
      ["<ESC>"] = actions.close,
    },
  },

}

require("telescope.actions.state").get_selected_entry()

Km("n", "<leader>fg", "<cmd> Telescope git_files <cr>", Km_opts)
Km("n", "<leader>ff", "<cmd> Telescope find_files <cr>",  Km_opts)
Km("n", "<leader>fk", "<cmd> Telescope keymaps <cr>", Km_opts)
Km("n", "<leader>fs", "<cmd> Telescope live_grep <cr>", Km_opts)
Km("n", "<leader>fc", "<cmd> Telescope colorscheme <cr>", Km_opts)
Km("n", "<leader>fd", "<cmd> Telescope fd <cr>", Km_opts)

Km("n", "gr", "<cmd> Telescope lsp_references<cr>", Km_opts)
Km("n", "ge", "<cmd> Telescope diagnostics<cr>", Km_opts)

