local config = {
  options = {
    g = {
      vimtex_view_method = "zathura"
    },
    opt = {
      wrap = true, -- wrap long lines
      whichwrap = "b,s,<,>,h,l,[,]", -- cursor wrap
    },
  },
  colorscheme = "catppuccin",
  plugins = {
    init = {
      ["catppuccin/nvim"] = {
        as = "catppuccin",
        config = function()
          require("catppuccin").setup({
            flavour = "macchiato"
          })
        end,
      },
      ["iamcco/markdown-preview.nvim"] = {
        run = function()
          vim.fn["mkdp#util#install"]()
        end,
      },
      ["lervag/vimtex"] = {},
      ["declancm/cinnamon.nvim"] = {
        config = function()
          require("cinnamon").setup()
        end,
      },
      ["simrat39/rust-tools.nvim"] = {}
    },
    cmp = {
      sources = {
      	{
          name = "buffer",
          option = {
            -- Fix buffer autocompletion treating äöüß as non-word characters
            keyword_pattern = [[\K\k*]],
          },
        },
      },
    },
    heirline = function(config)
      -- the first element of the default configuration table is the statusline
      config[1] = {
        hl = { fg = "fg", bg = "bg" },
        -- when adding the mode component, enable the mode text with padding to the left/right of it
        astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(),
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.fill(),
        astronvim.status.component.macro_recording(),
        astronvim.status.component.fill(),
        astronvim.status.component.lsp(),
        astronvim.status.component.treesitter(),
        astronvim.status.component.nav(),
      }
      return config
    end,
  }
}

return config
