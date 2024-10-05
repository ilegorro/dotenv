if vim.loader then
	vim.loader.enable()
end

require("configs.core")
require("configs.keymaps")
require("configs.lazy")
