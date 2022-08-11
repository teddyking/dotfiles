local M = {}

M.plugins = function(use)
    -- Add your own plugins
    -- use 'kyazdani42/nvim-tree.lua'
    -- use '~/my-prototype-plugin'
    -- see :help packer for more options
    use 'christoomey/vim-tmux-navigator'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
end

return M
