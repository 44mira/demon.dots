-- code screenshots

return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  opts = {
    font = 'FantasqueSansM Nerd Font=20',
    theme = 'Sublime Snazzy',
    background = '#3c3163',
    -- background_image = '/home/tyrael/Pictures/wallpaper.png',
    line_offset = function(args)
      -- get current line number as offset
      return args.line1
    end,
    tab_width = 2,
    line_pad = 1,
    no_window_controls = true,
    to_clipboard = true,
    no_line_number = false,
    no_round_corner = true,
    shadow_color = '#000000',
    window_title = function()
      -- get current buffer as title
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
    end,
  },
}
