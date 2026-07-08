{
  extraConfigLua = ''
    local theme_state_file = vim.fs.joinpath(vim.fn.stdpath("state"), "nixvim-theme.json")
    local default_theme_key = "default"
    local presentation_theme_key = "presentation"

    local function apply_theme(theme_key)
      if theme_key == presentation_theme_key then
        vim.o.background = "light"
        vim.cmd.colorscheme("morning")
        vim.api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#ffffff" })
        vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#000000", bg = "#ffffff" })
      else
        vim.o.background = "dark"
        vim.cmd.colorscheme("dracula")
      end
    end

    local function read_theme_preference()
      local file = io.open(theme_state_file, "r")
      if not file then
        return default_theme_key
      end

      local ok, data = pcall(function()
        local content = file:read("*a")
        file:close()
        return vim.json.decode(content)
      end)

      if not ok or type(data) ~= "table" then
        return default_theme_key
      end

      if data.theme == presentation_theme_key then
        return presentation_theme_key
      end

      return default_theme_key
    end

    local function write_theme_preference(theme_key)
      local ok, encoded = pcall(vim.json.encode, { theme = theme_key })
      if not ok then
        return
      end

      local file = io.open(theme_state_file, "w")
      if not file then
        return
      end

      file:write(encoded)
      file:close()
    end

    local function set_theme(theme_key, persist)
      local selected_theme = theme_key == presentation_theme_key and presentation_theme_key or default_theme_key
      apply_theme(selected_theme)

      if persist then
        write_theme_preference(selected_theme)
      end
    end

    local function select_theme()
      local current_theme = read_theme_preference()
      vim.ui.select(
        {
          { key = default_theme_key, label = "Default (Dracula)" },
          { key = presentation_theme_key, label = "Presentation (Light High Contrast)" },
        },
        {
          prompt = "Select Theme",
          format_item = function(item)
            local marker = item.key == current_theme and " ●" or ""
            return item.label .. marker
          end,
        },
        function(choice)
          if not choice then
            return
          end
          set_theme(choice.key, true)
        end
      )
    end

    local function toggle_theme()
      local current_theme = read_theme_preference()
      if current_theme == presentation_theme_key then
        set_theme(default_theme_key, true)
      else
        set_theme(presentation_theme_key, true)
      end
    end

    _G.NixvimTheme = {
      select_theme = select_theme,
      toggle_theme = toggle_theme,
      set_theme = set_theme,
    }

    vim.api.nvim_create_user_command("ThemeSelect", select_theme, { desc = "Select Neovim theme profile" })
    vim.api.nvim_create_user_command("ThemeToggle", toggle_theme, { desc = "Toggle between default and presentation theme" })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        set_theme(read_theme_preference(), false)
      end,
    })
  '';
}
