-- init.lua: Entry point for Neovim configuration 

-- Set leader key
vim.g.mapleader = " " 

-- Editor options
vim.opt.number = true           -- Show line numbers
vim.opt.tabstop = 4             -- 4 spaces per tab
vim.opt.shiftwidth = 4          -- 4 spaces for indentation
vim.opt.expandtab = true        -- Convert tabs to spaces 
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors 
vim.opt.cursorline = true       -- Highlight current line
vim.opt.wrap = false            -- Disable line wrapping

-- File encoding and backup
vim.opt.encoding = "utf-8"
vim.opt.backup = false
vim.opt.swapfile = false

-- Custom key bindings

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Event-driven settings

-- Auto-save on buffer change
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost"}, {
    pattern = "*",
    callback = function()
        vim.cmd("silent! update")
    end,
    desc = "Auto-save on buffer leave or focus lost",
})

-- Load modules
require("config.lazy")

-- Verify configuration
vim.notify("Neovim configuration loaded", vim.log.levels.INFO)

