require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself

    "neovim/nvim-lspconfig",

    { "lervag/vimtex", opt = true }, -- Use braces when passing options

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    { "rose-pine/neovim", as = "rose-pine" },

    {'vonheikemen/lsp-zero.nvim', branch = 'v3.x'},

    --- uncomment the two plugins below if you want to manage the language servers from neovim    -- {'williamboman/mason.nvim'};
    -- {'williamboman/mason-lspconfig.nvim'};

    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'l3mon4d3/luasnip'},

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
}

-- Set rosepine color scheme
require('theme_setup')

-- Enable line numbers
vim.opt.number = true

-- Set tab and shift width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Scrolling remaps
vim.api.nvim_set_keymap('n', '<C-j>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-d>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-u>', { noremap = true, silent = true })

-- Insert mode mapping for Ctrl-f
vim.api.nvim_set_keymap('i', '<C-f>', '{<CR>}<Esc>O', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', 'i{<CR>}<Esc>O', { noremap = true, silent = true })

-- Enable clipboard support
vim.opt.clipboard = "unnamedplus"

require('lsp')
