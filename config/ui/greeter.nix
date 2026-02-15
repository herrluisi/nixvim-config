{
  # ================================
    # Oil.nvim - File Explorer
    # ================================
    plugins.oil = {
      enable = true;
      settings = {
        # Show hidden files
        view_options = {
          show_hidden = true;
        };
        # Use floating window for oil
        float = {
          padding = 2;
          max_width = 120;
          max_height = 30;
          border = "rounded";
          win_options = {
            winblend = 0;
          };
        };
        # Keymaps within oil buffer
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-v>" = "actions.select_vsplit";
          "<C-s>" = "actions.select_split";
          "<C-t>" = "actions.select_tab";
          "<C-p>" = "actions.preview";
          "<C-c>" = "actions.close";
          "<C-r>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "gs" = "actions.change_sort";
          "gx" = "actions.open_external";
          "g." = "actions.toggle_hidden";
          "g\\\\" = "actions.toggle_trash";
        };
        # Delete to trash instead of permanent delete
        delete_to_trash = true;
        # Skip confirmation for simple operations
        skip_confirm_for_simple_edits = true;
      };
    };

    # ================================
    # Alpha.nvim - Greeter/Dashboard
    # ================================
    plugins.alpha = {
      enable = true;
      settings.layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          type = "text";
          val = [
            "                                                     "
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ "
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ "
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ "
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ "
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ "
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ "
            "                                                     "
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "  Find File";
              on_press.__raw = "function() require('telescope.builtin').find_files() end";
              opts = {
                shortcut = "f";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "f" ":Telescope find_files<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Recent Files";
              on_press.__raw = "function() require('telescope.builtin').oldfiles() end";
              opts = {
                shortcut = "r";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "r" ":Telescope oldfiles<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Recent Projects";
              on_press.__raw = "function() require('telescope').extensions.projects.projects() end";
              opts = {
                shortcut = "p";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "p" ":Telescope projects<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Open Folder";
              on_press.__raw = ''
                function()
                  require('telescope.builtin').find_files({
                    find_command = { 'fd', '--type', 'd', '--hidden', '--exclude', '.git', '--base-directory', vim.fn.expand('~') },
                    cwd = vim.fn.expand('~'),
                    prompt_title = 'Open Folder as Project',
                    attach_mappings = function(prompt_bufnr, map)
                      local actions = require('telescope.actions')
                      local action_state = require('telescope.actions.state')
                      
                      actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        if selection then
                          local path = vim.fn.expand('~') .. '/' .. selection[1]
                          vim.cmd('cd ' .. path)
                          require('nvim-tree.api').tree.open()
                        end
                      end)
                      return true
                    end,
                  })
                end
              '';
              opts = {
                shortcut = "o";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "o" "" { noremap = true; silent = true; callback.__raw = ''
                  function()
                    require('telescope.builtin').find_files({
                      find_command = { 'fd', '--type', 'd', '--hidden', '--exclude', '.git', '--base-directory', vim.fn.expand('~') },
                      cwd = vim.fn.expand('~'),
                      prompt_title = 'Open Folder as Project',
                      attach_mappings = function(prompt_bufnr, map)
                        local actions = require('telescope.actions')
                        local action_state = require('telescope.actions.state')
                        
                        actions.select_default:replace(function()
                          actions.close(prompt_bufnr)
                          local selection = action_state.get_selected_entry()
                          if selection then
                            local path = vim.fn.expand('~') .. '/' .. selection[1]
                            vim.cmd('cd ' .. path)
                            require('nvim-tree.api').tree.open()
                          end
                        end)
                        return true
                      end,
                    })
                  end
                ''; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Open Working Directory";
              on_press.__raw = "function() require('oil').open(vim.fn.getcwd()) end";
              opts = {
                shortcut = "m";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "m" ":lua require('oil').open(vim.fn.getcwd())<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Open Working Directory as Project";
              on_press.__raw = ''
                function()
                  local cwd = vim.fn.getcwd()
                  vim.cmd('cd ' .. cwd)
                  require('nvim-tree.api').tree.open()
                end
              '';
              opts = {
                shortcut = "w";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "w" "" { noremap = true; silent = true; callback.__raw = ''
                  function()
                    local cwd = vim.fn.getcwd()
                    vim.cmd('cd ' .. cwd)
                    require('nvim-tree.api').tree.open()
                  end
                ''; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  File Browser (Oil)";
              on_press.__raw = "function() require('oil').open_float() end";
              opts = {
                shortcut = "e";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "e" ":lua require('oil').open_float()<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  New File";
              on_press.__raw = "function() vim.cmd('enew') end";
              opts = {
                shortcut = "n";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "n" ":enew<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Grep Text";
              on_press.__raw = "function() require('telescope.builtin').live_grep() end";
              opts = {
                shortcut = "g";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "g" ":Telescope live_grep<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Configuration";
              on_press.__raw = "function() vim.cmd('edit $MYVIMRC') end";
              opts = {
                shortcut = "c";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "c" ":edit $MYVIMRC<CR>" { noremap = true; silent = true; } ];
              };
            }
            {
              type = "padding";
              val = 1;
            }
            {
              type = "button";
              val = "  Quit";
              on_press.__raw = "function() vim.cmd('qa') end";
              opts = {
                shortcut = "q";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; } ];
              };
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = "Press a key to get started";
          opts = {
            position = "center";
            hl = "Comment";
          };
        }
      ];
    };

    # ================================
    # Telescope - Fuzzy Finder
    # ================================
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
      };
      settings = {
        defaults = {
          file_ignore_patterns = [ "node_modules" ".git/" ];
          layout_strategy = "horizontal";
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
            };
            width = 0.87;
            height = 0.80;
          };
          sorting_strategy = "ascending";
          winblend = 0;
        };
      };
    };

    # ================================
    # Project.nvim - Project Management
    # ================================
    plugins.project-nvim = {
      enable = true;
      enableTelescope = true;
      settings = {
        use_lsp = true;
        patterns = [ ".git" "Makefile" "package.json" "flake.nix" "Cargo.toml" ];
        show_hidden = true;
      };
    };

    # ================================
    # Auto-open nvim-tree on directory
    # ================================
    autoCmd = [
      {
        event = [ "VimEnter" ];
        callback.__raw = ''
          function(data)
            local is_directory = vim.fn.isdirectory(data.file) == 1
            if is_directory then
              vim.cmd.cd(data.file)
              require("nvim-tree.api").tree.open()
            end
          end
        '';
      }
    ];
}
