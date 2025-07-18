return {
    {
        "sainnhe/gruvbox-material",
        enabled = true,
        priority = 1000,
        config = function()
          vim.g.gruvbox_material_transparent_background = 0
          vim.g.gruvbox_material_foreground = "mix"
          vim.g.gruvbox_material_background = "hard"
          vim.g.gruvbox_material_ui_contrast = "high"
          vim.g.gruvbox_material_float_style = "bright"
          vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
          vim.g.gruvbox_material_cursor = "auto"

          vim.cmd.colorscheme("gruvbox-material")
        end,
      },
}

