return {
    {
        "folke/persistence.nvim",
        opts = {}
    },
    {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = false,
        },
        config = function()
            require("project_nvim").setup()
        end,
    }
}
