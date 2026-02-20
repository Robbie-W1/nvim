return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require 'FTerm'
      vim.keymap.set('n', '<leader>tt', function()
        if vim.bo.modified then
          vim.cmd 'write'
        end
        fterm:toggle()
      end, { desc = '[T]oggle [T]erminal' })

      vim.keymap.set('t', '<leader>tt', function()
        fterm:toggle()
      end, { desc = '[T]oggle [T]erminal' })
    end,

    vim.api.nvim_create_user_command('CargoRun', function()
      require('FTerm').scratch { cmd = { 'cargo', 'run' } }
    end, { bang = true }),

    vim.api.nvim_create_user_command('CargoBuild', function()
      require('FTerm').scratch { cmd = { 'cargo', 'build' } }
    end, { bang = true }),

    vim.keymap.set('n', '<leader>cr', '<cmd>CargoRun<cr>', { desc = '[C]argo [R]un' }),
    vim.keymap.set('n', '<leader>cb', '<cmd>CargoBuild<cr>', { desc = '[C]argo [B]uild' }),
  },
}
