if vim.g.vscode ~= true then
    require("config.config")
    require("config.autocmds")
    require("config.keymaps")
    require("config.lazy")
end
