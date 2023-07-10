require("plugins")

local cmp = require("cmp")
local toggleterm = require("toggleterm")
local builtin = require('telescope.builtin')
local wk = require("which-key")

local opt = vim.opt
local opt_g = vim.opt_global
local opt_l = vim.opt_local

local cmd = vim.cmd

vim.g.mapleader = ' '

-- plugin setup
cmp.setup({
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

toggleterm.setup{}

vim.o.timeout = true
vim.o.timeoutlen = 300
wk.setup{}

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>fm', ':Telescope man_pages<CR>')


opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.termguicolors = true
cmd("colorscheme darcula")

-- mapping
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', '<Leader>e', ':NeoTreeFocusToggle<CR>')
vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<M-t>', ':ToggleTerm<CR>')
