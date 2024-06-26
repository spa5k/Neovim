return {
    "goolord/alpha-nvim",
    enabled = true,
    event = "VimEnter",
    lazy = true,
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        local logo = [[
                                                        
                 ████ ██████           █████      ██
                ███████████             █████ 
                █████████ ███████████████████ ███   ███████████
               █████████  ███    █████████████ █████ ██████████████
              █████████ ██████████ █████████ █████ █████ ████ █████
            ███████████ ███    ███ █████████ █████ █████ ████ █████
           ██████  █████████████████████ ████ █████ █████ ████ ██████
        ]]

        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
            -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("r", " " .. " Restore session", ":lua require('persistence').load()<CR>"),
            dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
            dashboard.button("s", " " .. " Search projects", ":Telescope projects <CR>"),
            dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
            -- mason
            dashboard.button("m", " " .. " Mason", ":Mason<CR>"),
            dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 8
        return dashboard
    end,
    config = function(_, dashboard)
        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
