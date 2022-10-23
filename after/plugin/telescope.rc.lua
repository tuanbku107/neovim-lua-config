local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = telescope.extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["C-c"] = fb_actions.create,
        ["C-r"] = fb_actions.rename,
        ["C-d"] = fb_actions.remove,
      },
      i = {
        ["<Tab>"] = actions.close,
      },
    },
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.95 }
      -- other layout configuration here
    },
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
      hidden = true
    }
  },
}


vim.keymap.set('n', 'ff',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', 'fg', function()
  builtin.live_grep({
    no_ignore = false,
    hidden = true
  })
end)
vim.keymap.set('n', 'fb', function()
  builtin.buffers()
end)
vim.keymap.set('n', 'ft', function()
  builtin.help_tags()
end)
vim.keymap.set('n', 'sh', function()
  builtin.search_history()
end)
vim.keymap.set('n', 'gc', function()
  builtin.git_commits()
end)
vim.keymap.set('n', 'gs', function()
  builtin.git_status()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

telescope.load_extension "file_browser"
