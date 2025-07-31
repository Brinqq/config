local dap = require("dap")
local ui = require('dapui')
local repl = require('dap.repl')


-- TODO:fix this before i merge with macos version
local mason_bin = vim.fn.stdpath('data') .. '\\mason\\bin\\codelldb.cmd'
local custom_dap_bin = nil;

local debugger_settings = {
 project_root = vim.fn.getcwd(),
 program = nil,
 compile = nil,
 env = {},
 scripts = {},
};

local debug_config_exist = false;
local debug_config_name = ".debugconfig"

function Get_debug_settings()
  local ret = debugger_settings;
  return ret
end

local function parse_config_file()
  local file = io.open(debug_config_name, "r")
  if(file ~= nil) then
    debug_config_exist = true;
    for line in file:lines() do
      if(string.find(line, "program = ") ~= nil) then
        debugger_settings.program = line:match(".*%s(.*)$")
        goto continue;
      end
      if(string.find(line, "compile = ") ~= nil) then
        debugger_settings.compile = line:match("=%s*(.*)")
        goto continue;
      end
      if(string.find(line, "env = ") ~= nil) then
        table.insert(debugger_settings.env, line:match(".*%s(.*)$"))
        goto continue
      end
      if(string.find(line, "scripts = ") ~= nil) then
        table.insert(debugger_settings.scripts, line:match(".*%s(.*)$"))
        goto continue
      end
      ::continue::
    end
    io.close(file)
  end
end

parse_config_file()

if G_isWindows then

dap.adapters.codelldb = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",  -- placeholder replaced at runtime
  executable = {
    command = mason_bin,
    args = {"--port", "${port}"},
    detached = false,  -- required on Windows
  },
}

dap.adapters.gdb = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",  -- placeholder replaced at runtime
  executable = {
    command = "gdb",
    args = {"--port", "${port}"},
    detached = false,  -- required on Windows
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
        return (debugger_settings.program ~= nil) and debugger_settings.program or vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  }
}

end



if G_isUnix then

dap.adapters.lldb = {
    type = "executable",
    command = vim.fn.exepath("codelldb"),
    name = "lldb"
}


dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
        return (debugger_settings.program ~= nil) and debugger_settings.program or vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',

    stdout = function(text)
      -- repl.append(text);
    end,

    env = {
      DYLD_LIBRARY_PATH=vim.fn.expand("~").. "/programming/vulkan/macOS/lib",
      VK_ICD_FILENAMES=vim.fn.expand("~").. "/programming/vulkan/macOS/share/vulkan/icd.d/MoltenVK_icd.json",
      VK_LAYER_PATH=vim.fn.expand("~").. "/programming/vulkan/macOS/share/vulkan/explicit_layer.d",
    },

},

}



end

dap.configurations.rust ={
  {},

}

dap.configurations.asm = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
        return (debugger_settings.program ~= nil) and debugger_settings.program or vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
  },
}
