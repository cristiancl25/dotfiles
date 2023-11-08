return {
  "andythigpen/nvim-coverage",
  dependencies = {
    "nvim-lua/plenary.nvim",
    init = function()
      require("coverage").setup()
    end,
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>tcl",
        function()
          local cov = require("coverage")
          cov.load()
        end,
        desc = "Load Coverage"
      },
      {
        "<leader>tcs",
        function()
          local cov = require("coverage")
          cov.summary()
        end,
        desc = "Print Coverage Summary",
      },
      {
        "<leader>tct",
        function()
          local cov = require("coverage")
          cov.toggle()
        end,
        desc = "Toggle Coverage",
      },
    },
  },
}
