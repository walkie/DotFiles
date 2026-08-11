-- Early disable of built-in file browser plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap plugin manager (https://github.com/folke/lazy.nvim)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
  local result = vim.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  }, { text = true }):wait()
  if result.code ~= 0 then
    error("Failed to clone lazy.nvim: " .. vim.trim(result.stderr or result.stdout or "unknown error"))
  end
end
vim.opt.runtimepath:prepend(lazy_path)

local lazy_opts = {
  -- None of the configured plugins use LuaRocks.
  rocks = { enabled = false },

  -- Disable some of the less useful built-in plugins
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin", -- clashes with nvim-tree
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

local plugins = {
  -- File tree explorer (T in normal mode to open)
  { "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {{ "T", "<cmd>NvimTreeToggle<cr>", desc = "Open file tree explorer" }},
    config = function()
      require("walkie/plugin/nvim-tree")
    end
  },

  -- Fuzzy file finder
  -- "ctrlpvim/ctrlp.vim",

  -- Manual completion with visible sources (LSP, path, buffer)
  { "saghen/blink.cmp",
    version = "1.*",
    config = function()
      require("walkie/plugin/blink")
    end,
  },

  -- Nicer window/pane switching, integrating with tmux
  { "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      require("walkie/plugin/vim-tmux-navigator")
    end
  },

  -- QoL collection (picker, ui.input/select, notifications)
  { "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("walkie/plugin/snacks")
    end,
  },

  -- Highlight and search TODO-style comments
  { "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    opts = {},
  },

  -- Keybinding popup (press `<leader>` / Space)
  { "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("walkie/plugin/which-key")
    end,
  },

  -- Nicer file system and Git integration
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  { "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Configure and extend built-in LSP support
  { "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("walkie/plugin/nvim-lspconfig")
    end,
  },

  -- Haskell syntax highlighting
  { "raichoo/haskell-vim",
    config = function()
      vim.g.haskell_enable_quantification = 1  -- highlight `forall`
      vim.g.haskell_enable_recursivedo = 1     -- highlight `mdo` and `rec`
      vim.g.haskell_enable_arrowsyntax = 1     -- highlight `proc`
      vim.g.haskell_indent_disable = 1
      vim.g.cabal_indent_section = 2
    end,
    ft = "haskell",
  },

  -- Rust is configured via built-in LSP (see `walkie/plugin/nvim-lspconfig.lua`).

  -- Other language-specific plugins
  -- Coqtail includes its own ftdetect/syntax/indent for Rocq/Coq.
  { "whonore/Coqtail",
    ft = "coq",
    build = ":UpdateRemotePlugins",
    init = function()
      require("walkie/plugin/coqtail").init()
    end,
  },
  { "habamax/vim-godot",       ft = "gdscript" },
  { "idris-hackers/idris-vim", ft = "idris" },
  { "vim-scripts/mips.vim",    ft = "mips" },
  { "tsung-ju/ott-vim",        ft = "ott" },
  { "walkie/twelf-vim",        ft = "twelf" },

  -- General utilities
  "salsifis/vim-transpose",
  "godlygeek/tabular",

  -- Highlight and auto-trim trailing whitespace
  -- Manually trim with :StripWhitespace
  -- See README for excluded filetypes and how to extend that list:
  -- https://github.com/ntpeters/vim-better-whitespace
  { "ntpeters/vim-better-whitespace",
    config = function()
      vim.g.strip_only_modified_lines = 0
      vim.g.strip_whitelines_at_eof = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.strip_whitespace_on_save = 1
    end
  }

  -- Alternate colorscheme
  -- { "morhetz/gruvbox",
  --   config = function()
  --     vim.g.gruvbox_contrast_dark = "hard"
  --     vim.g.gruvbox_contrast_light = "hard"
  --   end
  -- }
}

require("lazy").setup(plugins, lazy_opts)
