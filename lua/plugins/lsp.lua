return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rust-analyzer",
        "typescript-language-server",
        "zls",
        "clangd",
      })
    end,
  },
}
