-- Called after everything just before setting a default colorscheme
-- Configure you own bindings or other preferences. e.g.:
--
-- vim.opt.number = false -- No line numbers
-- require('utils').map('n', 's', ':MultipleCursorsFind<cr>')
-- vim.cmd[[colorscheme hybrid]]
-- ...
--

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

require("lualine").setup({ options = { section_separators = { left = '', right = '' } } })

vim.cmd([[
    nnoremap <leader>nn :NvimTreeToggle<CR>
    nnoremap \ :NvimTreeToggle<CR>

    :map <C-P> :Telescope find_files<CR>
]])

vim.g.lualine_theme = "gruvbox-material"
vim.cmd [[colorscheme gruvbox-material]]
