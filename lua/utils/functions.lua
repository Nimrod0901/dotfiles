local M = {}

M.cmd = function(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts)
end

M.autocmd = function(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

return M
