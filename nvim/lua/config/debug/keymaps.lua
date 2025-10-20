local km = vim.keymap.set
local opts = {noremap = true, silent = true}

local ui = require("dapui")
local dap = require("dap")
local server = require("config.debug.servers")

km("n", "<M-;>", function() ui.toggle() end)

km('n', '<M-r>', function() dap.continue() end, opts)
km('n', '<M-p>', function() dap.pause() end, opts)
km('n', '<M-->', function() dap.disconnect() end, opts)

km('n', '<M-j>', function() dap.run_to_cursor() end, opts)
km('n', '<M-h>', function() ui.eval() end, opts)
km("n", "<M-l>", function() dap.toggle_breakpoint() end)

km('n', '<M-o>', function() dap.step_over() end, opts)
km('n', '<M-i>', function() dap.step_into() end, opts)
km('n', '<M-u>', function() dap.step_out() end, opts)

km('n', '<M-b>', function() dap.up() end, opts)
km('n', '<M-n>', function() dap.down() end, opts)

km('n', '<M-y>', function() ui.float_element("breakpoints", {width = 160, height = 30, enter = true, position = "center", border = "rounded"}) end, opts)
km('n', '<M-g>', function() ui.float_element("console",     {width = 160, height = 30, enter = true, position = "center", border = "rounded"}) end, opts)
km('n', '<M-t>', function() ui.float_element("repl",        {width = 160, height = 50, enter = true, position = "center", border = "rounded"}) end, opts)
km('n', '<M-w>', function() ui.float_element("watches",     {width = 140, height = 30, enter = true, position = "center", border = "rounded"}) end, opts)
km('n', '<M-s>', function() ui.float_element("scopes",      {width = 160, height = 30, enter = true, position = "center", border = "rounded"}) end, opts)
km('n', '<M-f>', function() ui.float_element("stacks",      {width = 140, height = 30, enter = true, position = "center", border = "rounded"}) end, opts)



km('n', '<M-c>', function()
  local compile = Get_debug_settings().compile
    if(compile ~= nil) then
      vim.fn.system(compile)
      if(vim.v.shell_error ~= 0) then
        print("compilation error!")
        goto skip;
      end
      dap.continue()
    else 
      print("Compile Script = nil")
    end
    ::skip::
  end, opts)




km('n', '<M-d>', function()
  dap.repl.execute("disassemble")
  ui.float_element("repl", {width = 160, height = 50, enter = true, position = "center", border = "rounded"})
end, opts)













