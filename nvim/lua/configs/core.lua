local opt = vim.opt

opt.autoindent = true -- Copy indent from current line when starting a new line
opt.clipboard = "unnamedplus" -- Use clipboard register '+'. See :h clipboard-unnamedplus
opt.cmdheight = 2 -- Shows better messages
opt.completeopt = "menu,menuone,noselect,noinsert" -- Let the user decide about the autocomplete
opt.conceallevel = 1 -- The way to show concealed text
opt.cursorline = true -- Highlight the current cursor line
opt.encoding = "utf-8"
opt.expandtab = true -- Use appropriate number of spaces
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"
opt.guicursor = "r-i-ci:hor5" -- The cursor appearance in different modes
opt.hidden = true -- Allow multple buffers
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Search ignoring case
opt.laststatus = 3 -- Status line in last window
opt.list = true -- Turn on hidden chars visibility
opt.mouse = "a" -- Enable mouse for all modes
opt.mousemodel = "popup" -- right click opens popup menu
opt.number = true -- Show numbers on the left
opt.scrolloff = 8 -- Start scrolling before achieving edges
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
opt.showmatch = true -- Highlights the matching parenthesis
opt.sidescrolloff = 8 -- Start scrolling before achieving edges
opt.signcolumn = "yes" -- Always show the signcolumn
opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.softtabstop = 4 -- On insert use 4 spaces for tab
opt.splitbelow = true -- New horizontal splits, like `:help`, are on the bottom window
opt.splitright = true -- New vert splits are on the right
opt.swapfile = false -- Do not leave any backup files
opt.tabstop = 4 -- Tab size of 4 spaces
opt.textwidth = 0 -- Don't break lines automatically
opt.ttimeoutlen = 100 -- Wait for a key code sequence to complete
opt.title = true -- Set window title
opt.updatetime = 300 -- Delay before write to disk
opt.wrap = false -- Prevent wrap lines visually
opt.cmdheight = 0

vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "term://*",
	command = "startinsert",
})
