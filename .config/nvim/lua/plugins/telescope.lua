return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          size = {
            width = "95%",
            height = "95%",
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
    },
  },
}
