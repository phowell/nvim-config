-- Settings for Telescope
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        color_devicons = true,
        winblend = 20,
		file_ignore_patterns = {"*.git/*", "./target/*"},
    }
}

vim.api.nvim_set_keymap('n','<leader>ff',":lua require('telescope.builtin').find_files()<CR>",	{noremap = true, silent = true})
