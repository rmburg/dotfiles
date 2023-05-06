local function git_co_authors()
	-- Get all author names and keep unique ones
	local authors = {}
	local seen_authors = {}
	local all_authors = vim.api.nvim_call_function("system", { 'git log --format="%aN <%aE>"' })
	for _, author in ipairs(vim.split(all_authors, "\n", {})) do
		if not seen_authors[author] then
			seen_authors[author] = true
			authors[#authors + 1] = author
		end
	end
	-- Select co-author using telescope and insert it at current line
	vim.ui.select(authors, { prompt = "Co-Authors" }, function(author, _)
		if author then
			local msg = "Co-authored-by: " .. author
			local line = vim.api.nvim_win_get_cursor(0)[1]
			vim.api.nvim_buf_set_lines(0, line, line, true, { msg })
			vim.api.nvim_win_set_cursor(0, { line + 1, 0 })
		end
	end)
end

local config = {
	options = {
		g = {
			vimtex_view_method = "zathura",
		},
		opt = {
			wrap = true,                -- wrap long lines
			whichwrap = "b,s,<,>,h,l,[,]", -- cursor wrap
		},
	},
	colorscheme = "catppuccin",
	plugins = {
		{
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("catppuccin").setup({
					flavour = "macchiato",
				})
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		{ "lervag/vimtex" },
		{
			"declancm/cinnamon.nvim",
			config = function()
				require("cinnamon").setup()
			end,
		},
		{ "simrat39/rust-tools.nvim" },
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "rust_analyzer", "clangd" },
			},
		},
		{ "p00f/clangd_extensions.nvim" },
		-- {
		-- 	"hrsh7th/nvim-cmp",
		-- 	opts = function(_, opts)
		-- 		local cmp = require("cmp")
		-- 		opts.sources = cmp.config.sources({
		-- 			{
		-- 				name = "buffer",
		-- 				option = {
		-- 					-- Fix buffer autocompletion treating äöüß as non-word characters
		-- 					keyword_pattern = [[\K\k*]],
		-- 				},
		-- 			},
		-- 		})
		-- 	end,
		-- },
	},
	lsp = {
		formatting = {
			disabled = {
				"pylsp",
			},
		},
		setup_handlers = {
			rust_analyzer = function(_, opts)
				require("rust-tools").setup({ server = opts })
			end,
			clangd = function(_, opts)
				require("clangd_extensions").setup({ server = opts })
			end,
		},
		config = {
			clangd = {
				capabilities = {
					offsetEncoding = "utf-8",
				},
			},
			rust_analyzer = {
				on_attach = function(_, bufnr)
					local rt = require("rust-tools")
					-- Hover actions
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
				end,
			},
		},
	},
	mappings = {
		n = {
			-- Adding git co-authors to commit
			["<leader>ga"] = {
				function()
					git_co_authors()
				end,
				desc = "Add git co-authors",
			},
		},
	},
}

return config
