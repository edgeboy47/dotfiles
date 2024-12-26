-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
    opts = {

    }
  },
}
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  -- return server ~= "biome"
  return server ~= "eslint"
end, lvim.lsp.automatic_configuration.skipped_servers)

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { name = "biome" },
  -- { name = "ruff" }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { name = "ruff" }
}
vim.cmd.set('expandtab')
vim.filetype.add({
  extension = {
    mdx = "mdx"
  }
})
