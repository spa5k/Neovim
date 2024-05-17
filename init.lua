if vim.g.vscode ~= true then
    require("config.config")
    require("config.autocmds")
    require("config.keymaps")
    require("config.lazy")

    vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
end
