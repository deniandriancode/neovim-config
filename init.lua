require("plugins")

local cmp = require("cmp")
local toggleterm = require("toggleterm")
local builtin = require('telescope.builtin')
local wk = require("which-key")
local ts = require("nvim-treesitter.configs")
local comment = require("Comment")
local onedark = require("onedark")

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

comment.setup{}

ts.setup {
    ensure_installed = { "c", "cpp", "python", "java", "lua", "html", "css", "javascript" },
    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
   },
}

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>fm', ':Telescope man_pages<CR>')


vim.g.user_emmet_install_global = 0
vim.g.user_emmet_leader_key = ','
vim.g.svelte_indent_script = 0
vim.g.svelte_indent_style = 0
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"html", "css", "xml", "jsp", "svelte"},
    command = "EmmetInstall"
})

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

opt.number = true
opt.relativenumber = true

opt.clipboard = 'unnamedplus'

opt.cursorline = true
opt.termguicolors = true
-- cmd("colorscheme darcula")
onedark.setup{
    style = "deep"
}
onedark.load()
cmd("set nowrap")

-- mapping
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', '<Leader>e', ':NeoTreeFocusToggle<CR>')
vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<M-t>', ':ToggleTerm<CR>')
