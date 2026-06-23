local telescope = require("telescope")

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
})
