return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>tcl", function() require("coverage").load() end, desc = "Load Coverage" },
    { "<leader>tcs", function() require("coverage").summary() end, desc = "Print Coverage Summary" },
    { "<leader>tct", function() require("coverage").toggle() end, desc = "Toggle Coverage" },
  },
}
