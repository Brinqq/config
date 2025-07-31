local dap = require('dap')
local repl = require('dap.repl')


function A()
  repl.execute('memory read $sp')
end

function B()
end


repl.commands = vim.tbl_extend("force", repl.commands, {
  custom_commands = {
    ['mri'] = function(text)
      repl.execute(string.format("memory read --format d --size 4 --count 1 %s", text));
      end,

    ['mrf'] = function(text)
      repl.execute(string.format("memory read --format f --size 4 --count 1 %s", text));
      end,

    ['mrl'] = function(text)
      repl.execute(string.format("memory read --format d --size 8 --count 1 %s", text));
      end,

    ['mrd'] = function(text)
      repl.execute(string.format("memory read --format f --size 8 --count 1 %s", text));
      end,

    ['mrp'] = function(text)
      repl.execute(string.format("memory read --format h --size 8 --count 1 %s", text));
      end,
  }


})


