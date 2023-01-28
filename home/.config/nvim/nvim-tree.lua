-- Config for the nvim-tree.lua file tree plugin

local function change_root_to_directory(node)
  local api = require("nvim-tree.api")
  api.tree.change_root_to_node(node)
  api.node.navigate.parent()
end

local MAX_WIDTH = 50
local MAX_HEIGHT = 30
require('nvim-tree').setup({
  sync_root_with_cwd = true,
  hijack_cursor = true,
  view = {
    -- adaptive_size = true,
    -- float = { enable = true },
    -- To create a centered floating window, replace above line with:
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = math.min(screen_w - 4, MAX_WIDTH)
        local window_h = math.min(screen_h - 4, MAX_HEIGHT)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w,
          height = window_h,
        }
        end
    },
    width = function()
      return math.min(vim.opt.columns:get() - 4, MAX_WIDTH)
    end,
    mappings = {
      list = {
        -- remove edit in place (not good with floating window)
        { key = "<C-e>", action = "" },
        -- add 'u' for
        -- change root to directory
        { key = "O",
          action = "change root to the directory under the cursor",
          action_cb = change_root_to_directory,
        }
      }
    }
  },
  renderer = {
    special_files = {},
    icons = {
      show = { modified = false },
      git_placement = "signcolumn",
      glyphs = {
        git = {
          staged = "＊",
          unstaged = "＊",
          renamed = "﹥",
          untracked = "＋",
          deleted = "ｘ",
          ignored = "・"
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = { enable = false }
    }
  },
})
