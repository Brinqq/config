Km_opts = {noremap = true, silent = true}
Km = vim.keymap.set

Working_directory = vim.fn.getcwd() .. "/"
Home_directory = vim.fn.getenv('HOME') .. "/"
Data_directory = Home_directory .. ".local/share/nvim/"

G_isWindows = vim.loop.os_uname().sysname:find('Windows');
G_isUnix = vim.loop.os_uname().sysname == 'Darwin' or vim.loop.os_uname().sysname == 'Linux';

