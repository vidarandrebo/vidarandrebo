require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "go"
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})

-- Neovim 0.12 can pass capture lists to directive handlers.
-- Some plugin code still calls vim.treesitter helpers with a single-node assumption.
do
    local ts = vim.treesitter
    if not ts._list_capture_compat then
        local original_get_range = ts.get_range
        local original_get_node_text = ts.get_node_text

        local function first_capture_node(node_or_nodes)
            if type(node_or_nodes) == "table" then
                return node_or_nodes[1]
            end
            return node_or_nodes
        end

        ts.get_range = function(node, source, metadata)
            local normalized_node = first_capture_node(node)
            if not normalized_node then
                return { 0, 0, 0, 0, 0, 0 }
            end
            return original_get_range(normalized_node, source, metadata)
        end

        ts.get_node_text = function(node, source, opts)
            local normalized_node = first_capture_node(node)
            if not normalized_node then
                return ""
            end
            return original_get_node_text(normalized_node, source, opts)
        end

        ts._list_capture_compat = true
    end
end
