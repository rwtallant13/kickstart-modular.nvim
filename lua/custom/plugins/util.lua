return {
  {
    'luukvbaal/nnn.nvim',
    opts = {
      vim.keymap.set({ 'n', 't' }, '<leader>n', '<cmd>NnnExplorer<CR>'),
      vim.keymap.set({ 'n', 't' }, '<leader>p', '<cmd>NnnPicker<CR>'),
    },
  },

  {
    'gbprod/yanky.nvim',
    event = 'VeryLazy',
    opts = {
      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)'),
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)'),
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)'),
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)'),
      vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)'),
      vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)'),
    },
  },

  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {},
  },

  {
    'jghauser/mkdir.nvim',
  },
}
