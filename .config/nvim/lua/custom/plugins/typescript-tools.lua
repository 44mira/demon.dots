return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup {
      settings = {
        tsserver_max_memory = 2500,
        tsserver_file_preferences = {
          importModuleSpecifierPreference = 'shortest',
        },
      },
    }
  end,
}
