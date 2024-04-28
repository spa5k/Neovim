return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_next = "<c-j>",
                        jump_prev = "<c-k>",
                        accept = "<c-y>",
                        refresh = "r",
                        open = "<M-CR>",
                    },
                    layout = {
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<c-y>",
                        accept_word = false,
                        accept_line = false,
                        next = "<c-n>",
                        prev = "<c-N>",
                        dismiss = "<C-e>",
                    },
                },
            })
        end,
    },
}
