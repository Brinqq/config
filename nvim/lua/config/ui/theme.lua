require("dap")

--Preallocate 10 slots
local colors = {{}, {}, {}, {}, {}, {}, '',};

 local function get_colors()
   colors[1] = vim.api.nvim_get_hl(0, {name = "Normal", link = false, create = false})
   colors[2] = vim.api.nvim_get_hl(0, {name = "@keyword", link = false, create = false})
   colors[3] = vim.api.nvim_get_hl(0, {name = "@number", link = false, create = false})
   colors[4] = vim.api.nvim_get_hl(0, {name = "@variable.member", link = false, create = false})
   colors[5] = vim.api.nvim_get_hl(0, {name = "@function", link = false, create = false})
   colors[6] = vim.api.nvim_get_hl(0, {name = "@type.builtin", link = false, create = false})
   colors[7] = "#ebdbb2"
 end

function ECC()
 get_colors();

  --Core Theme
  
  vim.api.nvim_set_hl(0, 'LineNr', {fg = colors[2].fg, bold = true})
  vim.api.nvim_set_hl(0, 'Comment', {fg = "#a7a7a7", italic = true})

  --Debugger Theme
  
  vim.api.nvim_set_hl(0, 'DapUIDecoration', {fg = colors[2].fg})
  vim.api.nvim_set_hl(0, 'DapUIScope', {fg = colors[2].fg})
  vim.api.nvim_set_hl(0, 'DapUIType', {fg = colors[2].fg})
  vim.api.nvim_set_hl(0, 'DapUISource', {fg = colors[2].fg})
  vim.api.nvim_set_hl(0, 'DapUIVariable', {fg = colors[6].fg})
  vim.api.nvim_set_hl(0, 'DapUICurrentFrameName', {fg = colors[5].fg})
  vim.api.nvim_set_hl(0, 'DapUIModifiedValue', {fg = colors[5].fg})
  vim.api.nvim_set_hl(0, 'DapUIThread', {fg = colors[5].fg})
  vim.api.nvim_set_hl(0, 'DapBreakpointStoppedSymbol', {fg = colors[6].fg, bold=true})
  vim.api.nvim_set_hl(0, 'DapBreakpoint', {fg = colors[6].fg, bold=true})
  vim.api.nvim_set_hl(0, 'DapUIFloatBorder', {fg = colors[2].fg,})
  vim.api.nvim_set_hl(0, 'DapUIFloatNormal', {bg = colors[1].bg,})
  vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { fg = colors[4].fg, italic=true})
  vim.api.nvim_set_hl(0, 'DapUIBreakpointsLine', { fg = colors[3].fg, bg = colors[2].bg})
  vim.cmd(string.format("exe 'highlight DapUIValue guifg=%s'", colors[7]))
  vim.cmd(string.format("exe 'highlight DapUIStoppedThread guifg=%s'", colors[7]))
  vim.cmd(string.format("exe 'highlight DapUILineNumber guifg=%s'", colors[7]))
  vim.cmd(string.format("exe 'highlight DapUIFrameName guifg=%s'", colors[7]))

  local sign = vim.fn.sign_define
  sign('DapStopped', { text='', texthl='DapBreakpointStoppedSymbol', linehl='', numhl=''})
  sign('DapBreakpoint', {text= "B", texthl='DapBreakpoint',})


  --tmp
  vim.api.nvim_set_hl(0, 'Visual', {bg = "#111211"})
  vim.api.nvim_set_hl(0, 'pmenu', {bg = "#0c0d0c"})
end

vim.cmd("colorscheme nes")
require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText', 'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',},
  extra_groups = {},
  exclude_groups = {},
  on_clear = function() ECC() end,
})
