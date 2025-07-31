local ui = require("dapui")


local uiconfig = {
    layouts = {

      {
        elements = {{id = "scopes", size = 0.5}, {id = "stacks", size = 0.5}},
        position = "right",
        size = 60,
      },


    }

}



ui.setup(uiconfig)


