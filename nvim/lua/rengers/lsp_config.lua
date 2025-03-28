local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local lsp_filetypes = {
	"bash",
	"c",
	"cpp",
	"go",
	"java",
	"javascript",
	"json",
	"kotlin",
	"lua",
	"perl",
	"python",
	"ruby",
	"rust",
	"typescript",
	"yaml",
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

-- Give floating windows borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Configure diagnostic display
vim.diagnostic.config({
	severity_sort = true,
	signs = true,
	virtual_text = {
		-- Only display warn and above with virtual text
		severity = vim.diagnostic.severity.WARN,
		-- Prepend with diagnostic source if there is more than one attached to the buffer
		-- (e.g. (eslint) Error: blah blah blah)
		source = "if_many",
		prefix = "",
		format = function(diagnostic)
			local diag_to_format = {
				[vim.diagnostic.severity.ERROR] = { " ", "LspDiagnosticsDefaultError" },
				[vim.diagnostic.severity.WARN] = { " ", "LspDiagnosticsDefaultWarning" },
				[vim.diagnostic.severity.INFO] = { "󰋼 ", "LspDiagnosticsDefaultInfo" },
				[vim.diagnostic.severity.HINT] = { "󰛩 ", "LspDiagnosticsDefaultHint" },
				--[vim.diagnostic.severity.ERROR] = { " ", "LspDiagnosticsDefaultError" },
				--[vim.diagnostic.severity.WARN] = { " ", "LspDiagnosticsDefaultWarning" },
				--[vim.diagnostic.severity.INFO] = { " ", "LspDiagnosticsDefaultInfo" },
				--[vim.diagnostic.severity.HINT] = { "󰌶 ", "LspDiagnosticsDefaultHint" },
			}
			local res = diag_to_format[diagnostic.severity]
			return string.format("%s %s", res[1], diagnostic.message)
		end,
	},
	float = {
		severity_sort = true,
		source = "if_many",
		border = "rounded",
		--header = {
		--  "",
		--  "LspDiagnosticsDefaultWarning",
		--},
		prefix = function(diagnostic)
			local diag_to_format = {
				--[vim.diagnostic.severity.ERROR] = { "Error", "LspDiagnosticsDefaultError" },
				--[vim.diagnostic.severity.WARN] = { "Warning", "LspDiagnosticsDefaultWarning" },
				--[vim.diagnostic.severity.INFO] = { "Info", "LspDiagnosticsDefaultInfo" },
				--[vim.diagnostic.severity.HINT] = { "Hint", "LspDiagnosticsDefaultHint" },
				[vim.diagnostic.severity.ERROR] = { " ", "LspDiagnosticsDefaultError" },
				[vim.diagnostic.severity.WARN] = { " ", "LspDiagnosticsDefaultWarning" },
				[vim.diagnostic.severity.INFO] = { "󰋼 ", "LspDiagnosticsDefaultInfo" },
				[vim.diagnostic.severity.HINT] = { "󰛩 ", "LspDiagnosticsDefaultHint" },
			}
			local res = diag_to_format[diagnostic.severity]
			return string.format("(%s) ", res[1]), res[2]
		end,
	},
})

local custom_attach = function(client, bufnr)
	local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
	-- LSP mappings (only apply when LSP client attached)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
	vim.keymap.set("n", "T", vim.diagnostic.open_float, keymap_opts)
	vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, keymap_opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, keymap_opts)

	-- diagnostics
	--vim.keymap.set("n", "<leader>dk", vim.diagnostic.open_float, keymap_opts) -- diagnostic(s) on current line
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, keymap_opts) -- move to next diagnostic in buffer
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, keymap_opts) -- move to prev diagnostic in buffer
	vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, keymap_opts) -- show all buffer diagnostics in qflist
	--vim.keymap.set("n", "H", vim.lsp.buf.code_action, keymap_opts) -- code actions (handled by telescope-ui-select)
	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, keymap_opts) -- manual formatting, because sometimes they just decide to stop working

	-- use omnifunc
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr"

	-- format on save
	--local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
	--vim.api.nvim_create_autocmd("BufWritePre", {
	--    group = augroup,
	--    buffer = bufnr,
	--    callback = function()
	--        vim.lsp.buf.format({
	--            filter = function(this_client)
	--                local lang = vim.opt.filetype:get()
	--                if lang == "typescript" then return this_client.name ~= "tsserver" end -- disable tsserver formatting, it doesn't respect eslintrc
	--            end,
	--        })
	--    end,
	--})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- python
lspconfig.pyright.setup({
	on_attach = function(client, bufnr)
		custom_attach(client, bufnr)
		-- 'Organize imports' keymap for pyright only
		vim.keymap.set("n", "<Leader>ii", "<cmd>PyrightOrganizeImports<CR>", {
			buffer = bufnr,
			silent = true,
			noremap = true,
		})
	end,
	settings = {
		pyright = {
			disableOrganizeImports = false,
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				autoImportCompletions = true,
			},
		},
	},
})

-- typescript
lspconfig.ts_ls.setup({
	on_attach = function(client, bufnr)
		local ts_utils = require("nvim-lsp-ts-utils")
		ts_utils.setup({
			update_imports_on_move = false,
			enable_import_on_completion = true,
			auto_inlay_hints = false, -- doesn't _quite_ work
			inlay_hints_highlight = "Comment",
			inlay_hints_format = {
				Type = {
					highlight = "Comment",
					text = function(text)
						return "->" .. text
					end,
				},
				Parameter = {
					highlight = "Comment",
				},
				Enum = {
					highlight = "Comment",
				},
			},
		})

		ts_utils.setup_client(client)

		-- TS specific mappings
		vim.keymap.set("n", "<Leader>ii", "<cmd>TSLspOrganize<CR>", { buffer = bufnr, silent = true, noremap = true }) -- organize imports
		vim.keymap.set("n", "<Leader>R", "<cmd>TSLspRenameFile<CR>", { buffer = bufnr, silent = true, noremap = true }) -- rename file AND update references to it

		custom_attach(client, bufnr)
	end,
})

-- yaml
lspconfig.yamlls.setup({
	on_attach = custom_attach,
})

-- bash
lspconfig.bashls.setup({
	on_attach = custom_attach,
})

-- nix
lspconfig.nil_ls.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	settings = {
		["nil"] = {
			nix = {
				autoArchive = true, -- Automatically fetch flake inputs
			},
		},
	},
})

-- dockerfile
lspconfig.dockerls.setup({})

-- docker-compose
lspconfig.docker_compose_language_service.setup({})

-- ruby
lspconfig.solargraph.setup({})

-- toml
lspconfig.taplo.setup({})

-- latex
lspconfig.texlab.setup({
	on_attach = custom_attach,
})

-- c clangd
lspconfig.clangd.setup({
	on_attach = custom_attach,
	arguments = { "-Wall" },
})

-- lua
lspconfig.lua_ls.setup({
	on_attach = custom_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				--library = vim.api.nvim_get_runtime_file("", true), -- don't think this is needed anymore
				checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

---- json w/ common schemas
--lspconfig.jsonls.setup({
--    on_attach = custom_attach,
--    settings = {
--        json = {
--            schemas = require("schemastore").json.schemas(),
--            validate = { enable = true },
--        },
--    },
--})

-- Go
lspconfig.gopls.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

-- rust
local rust_opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "=>",
			other_hints_prefix = "",
		},
	},
	server = {
		on_attach = custom_attach,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					-- default: `cargo check`
					command = "clippy",
				},
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = true,
				},
				inlayHints = {
					lifetimeElisionHints = {
						enable = true,
						useParameterNames = true,
					},
				},
				workspace = {
					symbol = {
						search = {
							kind = "all_symbols",
						},
					},
				},
			},
		},
	},
}
require("rust-tools").setup(rust_opts)

-- kotlin
lspconfig.kotlin_language_server.setup({})

return {
	lsp_filetypes = lsp_filetypes,
}
