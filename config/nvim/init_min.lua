-- [[ OPTIONS ]]
vim.g.mapleader = " "
vim.g.termguicolors = true
vim.o.path = "**"
vim.o.nu = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.wrap = false
vim.o.undofile = true
vim.o.list = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.winborder = 'rounded'
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.g.gutentags_cache_dir = os.getenv("HOME") .. "/.cache/nvim/tags"
vim.opt.clipboard = "unnamedplus"
vim.o.completeopt = 'menuone,noselect'
vim.cmd(":colorscheme retrobox")
vim.api.nvim_create_autocmd("BufEnter", { pattern = "term://*", callback = function() vim.cmd("startinsert") end })

-- [[ PLUGINS ]]
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/tribela/transparent.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})
require("fzf-lua").setup()
require('nvim-treesitter.configs').setup({highlight = { enable = true }})

-- [[ MAPPINGS ]]
local map = vim.keymap.set
map("n", '<Esc>', '<Cmd>noh<CR><Esc>', { silent = true })
map("t", "<ESC><ESC>", "<C-\\><C-n>")
map({"t", "n"}, "<C-h>", "<C-\\><C-n><C-w><C-h>")
map({"t", "n"}, "<C-j>", "<C-\\><C-n><C-w><C-j>")
map({"t", "n"}, "<C-k>", "<C-\\><C-n><C-w><C-k>")
map({"t", "n"}, "<C-l>", "<C-\\><C-n><C-w><C-l>")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<S-Tab>", "<gv")
map("v", "<Tab>"  , ">gv")
map({"i", "n"}, "<C- >", "<C-x><C-o>")
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>p", "<cmd>b#<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>ff", ":lua FzfLua.files()<CR>")
map("n", "<leader>fo", ":lua FzfLua.buffers()<CR>")
map("n", "<leader>fp",  ":lua FzfLua.lsp_document_diagnostics()<CR>")
map("n", "<leader>fa",  ":lua FzfLua.lsp_code_actions()<CR>")
map("n", "<leader>sp", ":lua FzfLua.grep_project()<CR>")
map("n", "<leader>sf", ":lua FzfLua.grep_curbuf()<CR>")
map("n", "<leader>sw", ":lua FzfLua.grep_cword()<CR>")
map("n", "<leader>sh",  ":lua FzfLua.help_tags()<CR>")
map("n", "<leader>1",  ":vsplit | vertical resize 95 | terminal<CR>a")
map("n", "<leader>2",  ":split  | horizontal resize 25 | terminal<CR>a")

-- [[ LSP ]]
vim.lsp.enable({ "gopls", "gdscript" })

-- [[ GODOT ]]
local cwd = vim.fn.getcwd()
for _, path in ipairs({ cwd, cwd .. '/..' }) do
    if vim.uv.fs_stat(path .. '/project.godot') and not vim.uv.fs_stat(path .. '/server.pipe') then
        vim.fn.serverstart(path .. '/server.pipe')
        break
    end
end
