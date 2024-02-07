-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

keymap.set("n", "+", "<C-a")
keymap.set("n", "-", "C-x")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Buffer
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<C-x>", ":bd<CR>")
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Split windows
keymap.set("n", "vs", ":vsplit<CR>", {})
keymap.set("n", "sh", ":split<CR>", {})

-- Window navigation
keymap.set("n", "<leader>h", "<C-w>h", {}) -- left
keymap.set("n", "<leader>l", "<C-w>l", {}) -- right
keymap.set("n", "<leader>j", "<C-w>j", {}) -- down
keymap.set("n", "<leader>k", "<C-w>k", {}) -- up

-- Down Up movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Search for contributions
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move lines
keymap.set("n", "<A-j>", ":m +1<CR>", {}) -- moves down 1 line
keymap.set("n", "<A-Down>", ":m +1<CR>", {}) -- moves down 1 line
keymap.set("n", "<A-k>", ":m -2<CR>", {}) -- moves up 1 line
keymap.set("n", "<A-Up>", ":m -2<CR>", {}) -- moves up 1 line
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- moves up block of code
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- moves down block of code
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- moves up block of code
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- moves down block of code

-- Press ss fast to save
keymap.set("n", "ss", ":w<CR>", {})

-- Press jk fast to espace insert mode
keymap.set("i", "jk", "<ESC>", {})

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Toggle Terminal
keymap.set("n", "<leader>v", ":ToggleTerm<CR>", {})
