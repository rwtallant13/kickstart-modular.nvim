-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/noice.nvim',
    event = 'VimEnter',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  -- stylua: ignore
  keys = {
    { "<leader>sn", "", desc = "+noice"},
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == 'lazy' then
        vim.cmd [[messages clear]]
      end
      require('noice').setup(opts)
    end,
  },

  {
    'gbprod/yanky.nvim',
    event = 'VeryLazy',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)'),
      vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)'),
      vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)'),
      vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)'),
      vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)'),
      vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)'),
    },
  },

  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
      { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    },
  },

  {
    'echasnovski/mini.move',
    event = 'VeryLazy',
    version = '*',
    config = function()
      require('mini.move').setup()
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'catppuccin'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'folke/snacks.nvim',
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      dashboard = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = {},
      words = { enabled = true },
    },
  },
}
