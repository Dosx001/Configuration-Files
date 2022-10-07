require("indent_blankline").setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
})

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "−", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChangeDelete",
			text = "~−",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		disable = { "vim" },
		custom_captures = {
			-- ["<capture group>"] = "<hi group>",
			--["field"] = "TSComment",
			--["property"] = "TSComment",
			["tag.attribute"] = "TSType",
			["tag.delimiter"] = "TSParameter",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-,>",
			scope_incremental = "<C-.>",
			node_incremental = "<A-.>",
			node_decremental = "<A-,>",
		},
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also hi non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#b30000",
			"#ca5900",
			"#bcbc00",
			"#00b300",
			"#00b3b3",
			"Blue",
			"#b300b3",
		},
		-- termcolors = {} -- table of colour name strings
	},
	textobjects = {
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]l"] = "@loop.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]L"] = "@loop.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[l"] = "@loop.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[L"] = "@loop.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["aA"] = "@conditional.outer",
				["iA"] = "@conditional.inner",
			},
		},
	},
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	trim_scope = "outer",
	patterns = {
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
	},
	zindex = 20,
	mode = "cursor",
})

local null_ls = require("null-ls")
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
null_ls.setup({
	sources = {
		actions.eslint_d,
		actions.shellcheck,
		actions.gitsigns,
		-- actions.proselint,
		diagnostics.cppcheck,
		diagnostics.tidy,
		-- diagnostics.stylelint,
		diagnostics.pylint,
		diagnostics.flake8,
		diagnostics.eslint_d,
		diagnostics.shellcheck,
		diagnostics.markdownlint,
		diagnostics.selene,
		-- diagnostics.proselint,
		formatting.stylua,
		formatting.black,
		formatting.isort,
		formatting.prettier,
		formatting.shfmt,
		formatting.rustfmt,
	},
})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case", default "smart_case"
		},
	},
})

require("telescope").load_extension("fzf")

local ls = require("luasnip")
local types = require("luasnip.util.types")
-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " <- Current Choice", "NonTest" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<A-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- require("cmp_commit").setup({
-- 	set = true,
-- 	format = { "<<= ", " =>>" },
-- 	length = 5,
-- 	block = { "node_modules", "__pycache__" },
-- 	word_list = "~/cmpcommit.json",
-- 	repo_list = {
-- 		{ "cmp-commit", "~/git.json" },
-- 	},
-- })

local cmp = require("cmp")

cmp.setup({
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			ls.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
		["<A-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<A-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<A-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<A-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "vsnip" }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "buffer" },
		{ name = "path" },
		{ name = "dap" },
	}),
})

-- cmp.setup.filetype("gitcommit", {
-- 	sources = {
-- 		{ name = "commit" },
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 	},
-- })

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("?", {
	sources = {
		{ name = "buffer" },
	},
})

local cmdline
if vim.fn.systemlist("uname -r | grep WSL") then
	cmdline = { name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] }
else
	cmdline = { name = "cmdline" }
end

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		cmdline,
	}),
})

local function contain(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.colorProvider = {
	dynamicRegistration = true,
}
local servers = { "bashls", "clangd", "cssls", "html", "jsonls", "prismals", "pyright", "tailwindcss", "tsserver" }
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		capabilities = capabilities,
		on_attach = function(client)
			if contain({ "html", "jsonls", "tsserver" }, client.name) then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
			end
			if client.server_capabilities.colorProvider then
				require("document-color").buf_attach(bufnr)
			end
		end,
	})
end

local sumneko_binary_path = vim.fn.exepath("lua-language-server")
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
	end,
	cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
	end,
	settings = {
		["rust-analyzer"] = {
			-- assist = {
			--   importMergeBehavior = "last",
			--   importPrefix = "by_self",
			-- },
			-- diagnostics = {
			--   disabled = { "unresolved-import" }
			-- },
			-- cargo = {
			--     loadOutDirsFromCheck = true
			-- },
			-- procMacro = {
			--     enable = true
			-- },
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local augend = require("dial.augend")
require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.constant.alias.alpha,
		augend.constant.alias.Alpha,
		augend.date.alias["%Y/%m/%d"],
		augend.date.alias["%m/%d/%Y"],
		augend.constant.alias.bool,
		augend.constant.new({
			elements = { "True", "False" },
		}),
		augend.constant.new({
			elements = { "and", "or" },
		}),
		augend.constant.new({
			elements = { "&&", "||" },
			word = false,
		}),
		augend.constant.new({
			elements = { "==", "!=" },
			word = false,
		}),
		augend.constant.new({
			elements = { "<=", ">=" },
			word = false,
		}),
		augend.constant.new({
			elements = { "<", ">" },
			word = false,
		}),
	},
})

require("nvim-dap-virtual-text").setup({})
require("dap-python").setup()

local dap, dapui = require("dap"), require("dapui")

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dapui.setup({
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"console",
				"repl",
			},
			size = 0.25,
			position = "bottom",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",

		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

local Hydra = require("hydra")

local dap_hydra = Hydra({
	name = "DAP",
	mode = { "n", "x" },
	body = "<Leader>d",
	heads = {
		-- 	-- 	dap.set_breakpoint(vim.fn.input("[Condition] > "))
		-- 	-- 	return "<Ignore>"
		-- 	-- "c",
		-- 	-- end,
		-- 	-- function()
		-- 	-- { expr = true },
		-- {
		-- { "i", dap.step_into, { silent = true } },
		-- { "o", dap.step_out, { silent = true } },
		-- { "p", dap.pause, { silent = true } },
		-- { "s", dap.step_over, { silent = true } },
		-- { "t", dap.terminate, { silent = true } },
		-- },
		{ "<Enter>", dap.session, { silent = true } },
		{ "<Esc>", nil, { exit = true, nowait = true } },
		{ "B", dap.toggle_breakpoint, { silent = true } },
		{ "C", dap.clear_breakpoints, { silent = true } },
		{ "J", dap.down, { silent = true } },
		{ "K", dap.up, { silent = true } },
		{ "R", dap.run_last, { silent = true } },
		{ "b", dap.set_breakpoint, { silent = true } },
		{ "j", "j" },
		{ "k", "k" },
		{ "r", dap.run_to_cursor, { silent = true } },
		{ "u", dapui.toggle, { silent = true } },
	},
})

Hydra.spawn = function(head)
	if head == "dap-hydra" then
		dap_hydra:activate()
	end
end

require("colorizer").setup({
	filetypes = {
		"*",
		"!typescriptreact",
	},
})
require("Comment").setup()
-- require("lsp_signature").setup()
