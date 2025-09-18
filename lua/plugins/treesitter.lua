return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
    config = function()
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    require('nvim-treesitter.configs').setup{
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      additional_vim_regex_highlighting = false,
      ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "rust",
    },
    }
  end
}
