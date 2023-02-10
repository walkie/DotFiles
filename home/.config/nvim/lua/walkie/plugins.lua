-- Early disable of built-in file browser plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap plugin manager (https://github.com/folke/lazy.nvim)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  })
end
vim.opt.runtimepath:prepend(lazy_path)

local lazy_opts = {
  -- Disable some of the less useful built-in plugins
  disabled_plugins = {
    "gzip",
    "netrwPlugin", -- clashes with nvim-tree
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
  }
}

local plugins = {
  -- Buffer explorer (B in normal mode to open)
  { "jlanzarotta/bufexplorer",
    config = function()
      require("walkie/plugin/bufexplorer")
    end
  },

  -- File tree explorer (T in normal mode to open)
  { "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {{ "T", "<cmd>NvimTreeToggle<cr>", desc = "Open file tree explorer" }},
    config = function()
      require("walkie/plugin/nvim-tree")
    end
  },

  -- Fuzzy file finder
  "ctrlpvim/ctrlp.vim",

  -- Tab completion
  { "ervandew/supertab",
    config = function()
      require("walkie/plugin/supertab")
    end
  },

  -- Nicer window/pane switching, integrating with tmux
  { "christoomey/vim-tmux-navigator",
    config = function()
      require("walkie/plugin/vim-tmux-navigator")
    end
  },

  -- Nicer file system and Git integration
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  { "mhinz/vim-signify",
    config = function()
      vim.g.signify_priority = 1
      vim.g.signify_sign_show_count = 0
    end
  },

  -- Configure and extend built-in LSP support
  "folke/lsp-colors.nvim",
  { "neovim/nvim-lspconfig",
    config = function()
      require("walkie/plugin/nvim-lspconfig")
    end,
    ft = { "haskell", "rust" },
  },

  -- Haskell (install HLS with ghcup)
  { "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    ft = "haskell",
  },
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

  -- Neovim Lua (not working... possibly due to symlinked directory)
  -- { "folke/neodev.nvim",
  --   priority = 100, -- higher than nvim-lspconfig
  --   config = function()
  --     require("neodev").setup({})
  --   end,
  -- },

  -- Rust (install rust-analyzer with rustup)
  { "simrat39/rust-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap"
    },
    ft = "rust",
  },

  -- Other language-specific plugins
  { "vim-scripts/coq-syntax",  ft = "coq" },
  { "habamax/vim-godot",       ft = "gdscript" },
  { "idris-hackers/idris-vim", ft = "idris" },
  { "groenewege/vim-less",     ft = "less" },
  { "tpope/vim-markdown",      ft = "markdown" },
  { "vim-scripts/mips.vim",    ft = "mips" },
  { "derekwyatt/vim-scala",    ft = "scala" },
  { "cespare/vim-toml",        ft = "toml" },
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
