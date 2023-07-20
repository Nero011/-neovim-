local packer = require("packer")
packer.startup({
  function(use)
    --Packer can manage itself
    use 'wbthomason/packer.nvim'
    --theme
    use 'glepnir/zephyr-nvim'
    use("folke/tokyonight.nvim")
    --nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    --bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine 
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    --lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  end,





















  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- 使用ssh连接
      default_url_format = "git@github.com:%s",
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

