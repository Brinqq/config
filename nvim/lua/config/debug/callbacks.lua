local dap = require("dap")

dap.listeners.after['event_scopes'] = function(session, body)
  vim.print("here");
end
