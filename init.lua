if vim.g.vscode ~= true then
    require("config.config")
    require("config.autocmds")
    require("config.lazy")
    require("config.keymaps")

    vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
end
