local cmd = vim.cmd --- to execute string as vim command
local g = vim.g      -- to access global variables
local opt = vim.opt  -- to set options

require('plugins')
require('telescope-setup')
require('treesitter-setup')
require('bufferline-setup')
require('lualine-setup')
require('nerdtree-setup')
require('lsp-setup')
require('cmp-setup')
require('term-setup')

opt.number = true
opt.cursorline = true
opt.splitright = true
opt.termguicolors = true
opt.cursorline = true
opt.visualbell = true
opt.smartcase = true
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.clipboard = 'unnamed'
opt.mouse = 'a'
opt.laststatus = 3
opt.shiftwidth = 4
opt.list = true
-- opt.listchars:append "eol:↵" -- other options( ↩ , ↴ , ↵ )
opt.listchars:append "trail:·"
opt.breakindent = true
opt.linebreak = true
g.mapleader = ','
g.maplocalleader = '\\'

-- Theme
local theme = 'onedark'
cmd(string.format([[colorscheme %s]], theme))

-- tmux nav
cmd([[let g:tmux_navigator_disable_when_zoomed = 1]])

local map = require('helpers').map

--General 
map({'n', 'v'}, ';', ':')
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-s>', '<cmd>w<cr>')
map('n', '<C-c>', '<cmd>checktime<cr>')

-- Moving
-- TODO: test the '{' and '}'
map({'n', 'v'}, 'J', '<C-f>')
map({'n', 'v'}, 'K', '<C-b>')

-- Buffer control
map('n', '<Tab><Tab>', '<esc><C-w><C-w>')
map('n', '<Tab>l', '<Esc><cmd>bn<cr>')
map('n', '<Tab>h', '<Esc><cmd>bp<cr>')
map('n', '<Tab>d', '<Esc><cmd>bnext<bar>bd#<cr>')
map('n', '<Tab>dd', '<Esc><cmd>bdelete<cr>')
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>')

-- NvimTree
map({'n', 'v'}, '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>')
map({'n', 'v'}, '<leader>d', '<cmd>NvimTreeToggle<cr>')

-- Telescope
map('n', '<leader>t', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>o', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>lg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>h', '<cmd>Telescope builtin<cr>')
map('n', '<leader>r', '<cmd>Telescope registers<cr>')
map('n', '<leader>bg', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>j', '<cmd>Telescope jumplist<cr>')
map('n', '<leader>s', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>km', '<cmd>Telescope keymaps<cr>')

map('n', 'gi', '<cmd>Telescope lsp_incoming_calls<cr>')
map('n', 'go', '<cmd>Telescope lsp_outgoing_calls<cr>')
map('n', 'gr', '<cmd>Telescope lsp_references<cr>')
map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
map('n', 'gq', '<cmd>Telescope quickfix<cr>')

-- Terminal
map({'n', 't'}, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map( 't', ';q', '<cmd>ToggleTerm size=40<cr>')
