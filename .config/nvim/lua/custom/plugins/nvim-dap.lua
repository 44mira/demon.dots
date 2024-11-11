return {
  'mfussenegger/nvim-dap',
  config = function()
    vim.keymap.set('n', '<F5>', require('dap').continue)
    vim.keymap.set('n', '<F10>', require('dap').step_over)
    vim.keymap.set('n', '<F11>', require('dap').step_into)
    vim.keymap.set('n', '<F12>', require('dap').step_out)
    vim.keymap.set('n', '<leader>bp', require('dap').toggle_breakpoint)
  end,
}
