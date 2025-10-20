return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "diff",
        "http",
        "html",
        "css",
        "scss",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "graphql",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "astro",
        "fish",
        "gitignore",
        "rust",
        "go",
        "java",
        "php",
        "sql",
        "svelte",
        "vue",
        "prisma",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
  -- nvim-treesitter-textobjects configuration
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function(_, opts)
      opts.move = vim.tbl_deep_extend("force", opts.move or {}, {
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
      })
      return opts
    end,
  },
  -- MDX filetype support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
      return opts
    end,
  },
}
