local opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "D", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("i", "jj", "<Esc>l", opts)
keymap("n", "<M-a>", "ggVG", opts)
keymap("n", "<ESC>", ":nohlsearch<CR>", opts)
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "jj", "<C-\\><C-n>", opts)
keymap(
	"x",
	"<cr>",
	'*y:silent! let searchTerm = "\\V".substitute(escape(@*, "\\/"), "\\n", "\\\n", "g") <bar> let @/ = searchTerm <bar> echo "/".@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>',
	opts
)

-- Write all keymaps to a file
-- :redir! > vim_keys.txt
-- :silent verbose map
-- :redir END

-- Check keymap conflicts
-- :checkhealth which-key

-- plugin hotkeys
-- fp - telescope yank history
-- gc - region linewise comment
-- gcc - current line linewise comment
-- gb - region blockwise comment
-- gbc - current line blockwise comment
-- gbb - insert blockwise comment
-- gnn - select inner block
-- gD - select inner word
-- C-u - scroll up
-- C-d - scroll down
-- C-y - scroll screen up
-- C-e - scroll screen down
-- <Leader>j - doing opposite of J - join-line of arguments
-- <Leader>ca - show available code actions for a line
-- <Leader>rn - rename
-- <Leader>a - add mark
-- <Leader>e - toggle a menu of marks
-- <Leader>w - toggle a menu of keys
-- <leader><leader>t - toggle term
-- <Leader>xd - document diagnostics
-- <Leader>xw - workspace diagnostics
-- <C-s> - signature help
-- D - signature help

-- tree
-- a - create file or directory
-- d - delete
-- e - rename
-- g-? - list all actions

-- Telescope
-- <leader>ff - frecency
-- <leader>fn - notify
-- <leader>fg - egrepify
-- <leader>fb - buffers
-- <leader>fh - help_tags
-- <leader>ft - treesitter
-- <leader>fc - commands
-- <leader>fr - resume
-- <leader>cs - spell suggestion
-- <leader>fy - yank_history
-- gr - lsp_references
-- gd - lsp_definitions
-- gi - lsp_implementations

-- :Telescope notify - open notification history
