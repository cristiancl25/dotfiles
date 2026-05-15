return {
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.yamlls = opts.servers.yamlls or {}
      opts.servers.yamlls.settings = opts.servers.yamlls.settings or {}
      opts.servers.yamlls.settings.yaml = opts.servers.yamlls.settings.yaml or {}
      local schemas = opts.servers.yamlls.settings.yaml.schemas or {}
      schemas["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_yml_files-latest.json"] = {
        "**/models/**/*.yml",
        "**/seeds/**/*.yml",
        "**/snapshots/**/*.yml",
      }
      schemas["https://raw.githubusercontent.com/dbt-labs/dbt-jsonschema/main/schemas/dbt_project-latest.json"] = "dbt_project.yml"
      opts.servers.yamlls.settings.yaml.schemas = schemas
    end,
  },
}
