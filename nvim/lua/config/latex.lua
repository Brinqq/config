require "config.core.global"

local output_dir = Data_directory .. "latex/"
local compile_dir = output_dir .. "compiled/"

function Latex_init()
  vim.g.vimtex_completor_enabled = 0
  vim.g.vimtex_view_method = 'zathura'
  vim.g.vimtex_compiler_method = 'latexmk'
  vim.g.vimtex_view_general_viewer = 'zathura'

  vim.g.vimtex_compiler_latexmk = {
    out_dir = compile_dir,
    build_dir = compile_dir,
    aux_dir = compile_dir,
  }

end

Km("n", "<leader>lc", function() vim.cmd("VimtexCompile") end, Km_opts)
Km("n", "<leader>lv", string.format(":!zathura %s%s.pdf &<cr>", compile_dir, vim.fn.expand("%:r")), Km_opts)


