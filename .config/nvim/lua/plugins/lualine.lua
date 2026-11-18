return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_a = {
        {
          "mode",
          color = function()
            local mode = vim.fn.mode()

            if mode:sub(1, 1) == "i" then
              return {
                fg = "#1C211D",
                bg = "#A9C9AD",
                gui = "bold",
              }
            end

            return {
              fg = "#D0D0D0",
              bg = "#444444",
              gui = "bold",
            }
          end,
        },
      }
    end,
  },
}
