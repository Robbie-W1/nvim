return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require 'FTerm'
      local last_cmd = nil

      vim.keymap.set('n', '<leader>tt', function()
        if vim.bo.modified then
          vim.cmd 'write'
        end
        fterm:toggle()
      end, { desc = '[T]oggle [T]erminal' })

      vim.keymap.set('t', '<leader>tt', function()
        fterm:toggle()
      end, { desc = '[T]oggle [T]erminal' })

      vim.api.nvim_create_user_command('RunLastCommand', function()
        if vim.bo.modified then
          vim.cmd 'write'
        end
        if last_cmd == nil then
          vim.ui.input({ prompt = 'Command to run: ' }, function(input)
            if input and input ~= '' then
              last_cmd = vim.split(input, ' ')
              fterm.scratch { cmd = last_cmd }
            end
          end)
        else
          fterm.scratch { cmd = last_cmd }
        end
      end, { bang = true })

      vim.api.nvim_create_user_command('RedefineCommand', function()
        if vim.bo.modified then
          vim.cmd 'write'
        end
        vim.ui.input({ prompt = 'Command to run: ' }, function(input)
          if input and input ~= '' then
            last_cmd = vim.split(input, ' ')
            fterm.scratch { cmd = last_cmd }
          end
        end)
      end, { bang = true })

      vim.keymap.set('n', '<leader>r', '<cmd>RunLastCommand<cr>', { desc = '[R]un Last Command' })
      vim.keymap.set('n', '<leader>rr', '<cmd>RedefineCommand<cr>', { desc = '[R]edefine Command' })
    end,
  },
}
