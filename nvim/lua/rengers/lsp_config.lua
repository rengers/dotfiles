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

	-- native inlay hints (Neovim 0.11+)
	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

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
vim.lsp.config("pyright", {
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
vim.lsp.config("ts_ls", {
	on_attach = custom_attach,
})

-- yaml
vim.lsp.config("yamlls", {
	on_attach = custom_attach,
})

-- bash
vim.lsp.config("bashls", {
	on_attach = custom_attach,
})

-- nix
vim.lsp.config("nil_l", {
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
vim.lsp.config("dockerls", {})

-- docker-compose
vim.lsp.config("docker_compose", {})

-- ruby
vim.lsp.config("solargraph", {})

-- toml
vim.lsp.config("taplo", {})

-- latex
vim.lsp.config("texlab", {
	on_attach = custom_attach,
})

-- c clangd
vim.lsp.config("clangd", {
	on_attach = custom_attach,
	arguments = { "-Wall" },
})

-- lua
vim.lsp.config("lua_ls", {
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
vim.lsp.config("gopls", {
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

-- rust is handled by rustaceanvim (auto-configures rust-analyzer)

-- kotlin
vim.lsp.config("kotlin_language_server", {})

return {
	lsp_filetypes = lsp_filetypes,
}
