local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<S-t>', vim.cmd.NvimTreeToggle)
    vim.keymap.set('n', '<S-p>', api.tree.change_root_to_parent)
    vim.keymap.set('n', '<S-n>', api.tree.change_root_to_node)
    vim.keymap.set('n', '?', api.tree.toggle_help)
end

require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = my_on_attach,
}
