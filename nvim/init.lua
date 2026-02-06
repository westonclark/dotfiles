-------------------------------------------------------------------
-- OPTIONS --
-------------------------------------------------------------------
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2

-------------------------------------------------------------------
-- KEYMAPS --
-------------------------------------------------------------------
-- Save on esc and clear search highlights
vim.keymap.set({ "i", "x", "n", "s" }, "<Esc>", "<Esc>:noh | silent! w<CR>", { noremap = true, silent = true })

-- Close buffer
vim.keymap.set("n", "<Leader>w", "<Cmd>bdelete!<CR>", { noremap = true, silent = true })

-- Quit
vim.keymap.set("n", "<Leader>q", "<Cmd>:quit<CR>", { noremap = true, silent = true })

-- Normal mode: move lines
vim.keymap.set("n", "K", ":move -2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "J", ":move +1<cr>", { noremap = true, silent = true })

-- Visual mode: move lines and maintain visual selection
vim.keymap.set("v", "K", ":move '<-2<cr>gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":move '>+1<cr>gv", { noremap = true, silent = true })

-- Keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Page down, stay centered
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Page up, stay centered
vim.keymap.set("n", "n", "nzzzv")       -- Next search, stay centered
vim.keymap.set("n", "N", "Nzzzv")       -- Prev search, stay centered

-------------------------------------------------------------------
-- COLORSCHEME --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
})
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-------------------------------------------------------------------
-- INDENT BLANKLINE (SCOPE LINES) --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})
require("ibl").setup({
	indent = {
		char = "│",
	},
	scope = {
		enabled = false,
		show_start = false,
		show_end = false,
	},
})

-------------------------------------------------------------------
-- LSP --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Configure lua_ls for Neovim
vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false
			},
		}
	}
}

vim.lsp.enable({
	"lua_ls", -- Lua
	"clangd", -- C/C++
	"ts_ls",  -- TypeScript/JavaScript
	"rust_analyzer", -- Rust
	"gopls",  -- Go
	"marksman", -- Markdown
	"pyright", -- Python
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		vim.keymap.set("n", "H", vim.lsp.buf.hover, { noremap = true, silent = true })
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, noremap = true, silent = true })
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf })
		vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
		-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf })
		-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = ev.buf })
	end,
})

-------------------------------------------------------------------
-- BLINK LSP AUTOCOMPLETE --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v0.7.6" }
})
require('blink.cmp').setup({
	keymap = {
		['<Tab>'] = { 'accept', 'fallback' },
	},
	completion = {
		ghost_text = { enabled = true },
		menu = { enabled = false },
		documentation = { enabled = false },
	},
})

-------------------------------------------------------------------
-- MINI PICK FILE SEARCH --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.pick" },
})
require('mini.pick').setup({
	mappings = {
		move_down = '<C-j>',
		move_up = '<C-k>',
	},
	window = {
		config = function()
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)
			return {
				anchor = 'NW',
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end,
	},
})
vim.keymap.set("n", "<Leader><space>", "<Cmd>:Pick files<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', require('mini.pick').builtin.buffers)
vim.keymap.set("n", "<Leader>/", require('mini.pick').builtin.grep_live)

------------------------------------------------------------------
-- OIL FILE EXPLORER--
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})
vim.keymap.set("n", "<Leader>e", "<Cmd>Oil --float<CR>", { noremap = true, silent = true })
require("oil").setup({
	float = {
		padding = 2,
		max_width = math.floor(0.618 * vim.o.columns),
		max_height = math.floor(0.618 * vim.o.lines),
		border = "rounded",
	},
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<Esc>"] = "actions.close",
		["l"] = "actions.select",
		["h"] = "actions.parent",
		["H"] = "actions.toggle_hidden",
	},
})

-------------------------------------------------------------------
-- GITSIGNS --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require('gitsigns').setup()

-------------------------------------------------------------------
-- LAZYGIT --
-------------------------------------------------------------------
vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})
vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", { noremap = true, silent = true })
--
--
-------------------------------------------------------------------
-- DEPENDENCIES (for clean install) --
-------------------------------------------------------------------
-- brew install neovim --HEAD              # Neovim 0.12+
-- brew install lazygit                    # Git TUI
-- brew install ripgrep                    # Fast grep (for mini.pick)
-- brew install fd                         # Fast file search (optional)
--
-- LSP Servers:
-- brew install lua-language-server        # lua_ls
-- brew install typescript-language-server # ts_ls
-- brew install rust-analyzer              # rust_analyzer
-- brew install gopls                      # gopls
-- brew install marksman                   # marksman
-- brew install pyright                    # pyright
-- xcode-select --install                  # clangd (comes with Xcode CLI tools)
--
-- Languages:
-- brew install node
-- brew install cargo
-- brew install go
-- brew install python
-- brew install typescript
-- brew install typst
-- curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
--
-- Utilities
-- brew install starship
