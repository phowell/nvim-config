vim.o.completeopt ="menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. 'c'
local lsp = require('lspconfig')
local completion = require('completion')

local mapper = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_attach = function()
	completion.on_attach()
	mapper('n', '<leader>gD', 'vim.lsp.buf.declaration()')
	mapper('n', '<leader>gd', 'vim.lsp.buf.definition()')
	mapper('n', '<leader>K', 'vim.lsp.buf.hover()')
	mapper('n', '<leader>gi', 'vim.lsp.buf.implementation()')
	mapper('n', '<leader>k', 'vim.lsp.buf.signature_help()')
	mapper('n', '<leader>wa', 'vim.lsp.buf.add_workspace_folder()')
	mapper('n', '<leader>wr', 'vim.lsp.buf.remove_workspace_folder()')
	mapper('n', '<leader>wl', 'vim.lsp.buf.print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
	mapper('n', '<leader>D', 'vim.lsp.buf.type_definition()')
	mapper('n', '<leader>rn', 'vim.lsp.buf.rename()')
	mapper('n', '<leader>gr', 'vim.lsp.buf.references()')
	mapper('n', '<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
	mapper('n', '<leader>di', 'vim.lsp.diagnostic.goto_prev()')
	mapper('n', '<leader>DI', 'vim.lsp.diagnostic.goto_next()')
	mapper('n', '<leader>gq', 'vim.lsp.diagnostic.set_loclist()')
	mapper('n', '<leader>fo', 'vim.lsp.buf.formatting()')
end

-- Enable Diagnostics
vim.lsp.handlers["textDocuments/PublishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virual_text = true,
		signs = true,
		update_in_insert = true,
	}
)

-- Inlay Hints
vim.cmd[[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix='',highlight='comment', enabled={'TypeHint', 'ChainingHint', 'ParameterHint'} }]]

-- Snippets
vim.g.completion_enable_snippet = 'snippets.nvim'

-- Rust
lsp.rust_analyzer.setup({on_attach = custom_attach})

-- Python
lsp.pyls.setup({on_attach = custom_attach})

-- Lua
lsp.sumneko_lua.setup({
	cmd = { "/usr/bin/lua-language-server",
		"-E",
		"/home/peterh/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua"
	},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			completion = {keywordSnippet = "Disable"},
			diagnostics = {enable = true, globals = {"vim", "use", "describe", "it", "before_each", "after_each"}},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				}
			}
		}
	},
	on_attach = custom_attach,
})

lsp.efm.setup( {
	init_options = {documentFormatting = true},
	filetypes = {"lua"},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			lua = {
				formatCommand = "lua-format -i",
                formatStdin = true
			}
		}
	},
})
