return {
  -- Disable markdownlint-cli2 in nvim-lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- Remove markdown linters
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
      opts.linters_by_ft["markdown.mdx"] = {}
      return opts
    end,
  },

  -- Disable markdownlint in none-ls if you have it
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.tbl_filter(function(source)
        return not (source._opts and source._opts.command == "markdownlint-cli2")
      end, opts.sources or {})
      return opts
    end,
  },

  -- Disable markdownlint-cli2 in conform.nvim (formatter)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Remove markdownlint-cli2 from markdown formatters
      if opts.formatters_by_ft.markdown then
        opts.formatters_by_ft.markdown = vim.tbl_filter(function(formatter)
          return formatter ~= "markdownlint-cli2"
        end, opts.formatters_by_ft.markdown)
      end
      if opts.formatters_by_ft["markdown.mdx"] then
        opts.formatters_by_ft["markdown.mdx"] = vim.tbl_filter(function(formatter)
          return formatter ~= "markdownlint-cli2"
        end, opts.formatters_by_ft["markdown.mdx"])
      end
      return opts
    end,
  },
}