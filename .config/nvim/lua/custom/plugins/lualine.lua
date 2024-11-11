local function lualine_name()
  return [[sharmaigne  ]]
end

local copilot = {
  'copilot',
  symbols = {
    status = {
      icons = {
        sleep = ' ', -- BUG: auto-trigger disabled
        enabled = ' ', -- BUG: auto-trigger disabled
        disabled = ' ',
        warning = ' ',
        unknown = ' ',
      },
      hl = {
        sleep = '#82CFB6', -- BUG: auto-trigger disabled
        enabled = '#6272A4', -- BUG: auto-trigger disabled
        disabled = '#6272A4',
        warning = '#FFB86C',
        unknown = '#FF5555',
      },
    },
  },
  show_colors = true,
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
  opts = {
    options = {
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = ')', right = '(' },
      section_separators = { left = '', right = '' },
      component_separators = '\\',
      disabled_filetypes = {
        statusline = {
          'dapui_scopes',
          'dapui_breakpoints',
          'dapui_stacks',
        },
      },
    },
    sections = {
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'diff', copilot, 'diagnostics' },
      lualine_y = { 'filetype' },
      lualine_z = { lualine_name },
    },
    extensions = {
      'lazy',
      'neo-tree',
      'oil',
    },
  },
}
