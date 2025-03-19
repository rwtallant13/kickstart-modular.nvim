return {
  {
    'luukvbaal/nnn.nvim',
    opts = {
      vim.keymap.set({ 'n', 't' }, '<leader>n', '<cmd>NnnExplorer<CR>'),
      vim.keymap.set({ 'n', 't' }, '<leader>p', '<cmd>NnnPicker<CR>'),
    },
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
  },

  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {},
  },

  {
    'lambdalisue/vim-suda',
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },

  {
    'jghauser/mkdir.nvim',
  },
}
