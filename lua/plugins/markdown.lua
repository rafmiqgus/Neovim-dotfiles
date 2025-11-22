return {
  {
    enabled = false;
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    ft = { "markdown", "rmd", "quarto", "mdx" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      heading = { enabled = true },  -- hides ### and renders headings nicely
      bullet = { enabled = true },
      checkbox = { enabled = true },
      code = { enabled = true },
      table = { enabled = true },
    },
  },
}

