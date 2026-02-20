return {
  'kdheepak/lazygit.nvim',
  lazy = false,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>lg',
      '<cmd>LazyGit<cr>',
      desc = 'Open [L]azy[G]it',
    },
  },
  config = function()
    require('telescope').load_extension 'lazygit'
  end,
}
