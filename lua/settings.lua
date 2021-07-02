-- General Settings for NeoVim

-- Utils
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then scopes['o'][key] = value end
end


-- Basic Look And Feel
vim.g.gruvbox_bold = true
vim.g.gruvbox_italics = true
vim.cmd('colorscheme gruvbox8')
opt('o', 'termguicolors', true)
vim.cmd 'hi Normal ctermbg=NONE guibg=NONE'
--vim.cmd 'highlight NonText ctermbg=NONE'

-- Neovide
vim.api.nvim_set_option('guifont', 'FuraCode Nerd Font,NotoSans Nerd Font Mono,Unifont:h20')
vim.api.nvim_set_option('guifontwide', 'FuraCode Nerd Font,NotoSans Nerd Font Mono,Unifont:h20')
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_transparency = 0.95
vim.g.neovide_cursor_antialiasing= "true"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 7.0

-- General Settings
-- vim.g.nvim_set_option('encoding', 'UTF-8')
vim.g.loaded_python_provider=0
vim.g.loaded_perl_provider=0
vim.g.python_host_prog=''
vim.g.python3_host_prog='~/.venv/neovim3/bin/python'

vim.g.syntax_on = true
vim.g.syntax_enable = true
vim.g.mouse = 'a'
vim.g.ruler = true
vim.g.hidden = true
opt('o', 'cursorline', true)
opt('w', 'list', true)
vim.api.nvim_set_option('listchars', 'tab:▸ ,eol:¬')


opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'signcolumn', 'yes')

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Make indenting make sense
local indent = 4
opt('b', 'expandtab',false)
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', indent)
opt('b', 'softtabstop', indent)
vim.o.smartindent = true

-- TreeSitter
require('settings.treesitter_cfg')

-- LSP
require('settings.lsp_cfg')

-- Telescope
require('settings.telescope_cfg')

-- Status Line
require('settings.statusline_cfg')
