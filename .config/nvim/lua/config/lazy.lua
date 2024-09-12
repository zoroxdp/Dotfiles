local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "TobinPalmer/rayso.nvim",
      cmd = { "Rayso" },
      config = function()
        require("rayso").setup({
          base_url = "https://ray.so/",
          open_cmd = "io.github.zen_browser.zen",
          options = {
            background = true,
            dark_mode = true,
            logging_path = "",
            logging_file = "rayso",
            logging_enabled = false,
            padding = 32,
            ---@diagnostic disable-next-line: assign-type-mismatch
            theme = "tailwind",
            title = "Untitled",
          },
        })
      end,
    },
    { "matbme/JABS.nvim" },
    {
      "xeluxee/competitest.nvim",
      dependencies = "MunifTanjim/nui.nvim",
      config = function()
        require("competitest").setup()
      end,
    },
    {
      "nvimdev/lspsaga.nvim",
      config = function()
        require("lspsaga").setup({
          ui = {
            code_action = "",
          },
        })
      end,
    },
    { "ggandor/leap.nvim" },
    {
      "kawre/leetcode.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      opts = {},
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end,
    },
    { "CRAG666/code_runner.nvim", config = true },
    { "numToStr/comment.nvim" },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
    },
    {
      "chrisgrieser/nvim-scissors",
      dependencies = { "garymjr/nvim-snippets" },
      opts = {
        snippetDir = "/home/dp/.config/nvim/lua/snippet/",
      },
    },
    {
      "folke/noice.nvim",
      opts = {
        presets = {
          lsp_doc_border = true,
        },
      },
    },
    { "brenoprata10/nvim-highlight-colors" },
    {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      enabled = false,
    },
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
