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
              val = "  Open Working Directory";
              on_press.__raw = "function() require('oil').open(vim.fn.getcwd()) end";
              opts = {
                shortcut = "w";
                position = "center";
                cursor = 3;
                width = 50;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                keymap = [ "n" "w" ":lua require('oil').open(vim.fn.getcwd())<CR>" { noremap = true; silent = true; } ];
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
        # Use LSP for project detection
        use_lsp = true;
        # Patterns to detect project root
        patterns = [ ".git" "Makefile" "package.json" "flake.nix" "Cargo.toml" ];
        show_hidden = true;
      };
    };

    # ================================
    # Web Devicons - File Icons
    # ================================
    plugins.web-devicons.enable = true;

    # ================================
    # Keymaps
    # ================================
    keymaps = [
      # Oil keymaps
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<CR>";
        options = { desc = "Open parent directory"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua require('oil').open_float()<CR>";
        options = { desc = "Open Oil (floating)"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>.";
        action = "<cmd>lua require('oil').open(vim.fn.getcwd())<CR>";
        options = { desc = "Open working directory"; silent = true; };
      }
      # Telescope keymaps
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options = { desc = "Find files"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options = { desc = "Live grep"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options = { desc = "Buffers"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope oldfiles<CR>";
        options = { desc = "Recent files"; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = "<cmd>Telescope projects<CR>";
        options = { desc = "Projects"; silent = true; };
      }
      # Alpha/Dashboard
      {
        mode = "n";
        key = "<leader>;";
        action = "<cmd>Alpha<CR>";
        options = { desc = "Open Dashboard"; silent = true; };
      }
    ];
    
    # ================================
    # Auto-open nvim-tree on directory
    # ================================
    autoCmd = [
      {
        event = [ "VimEnter" ];
        callback.__raw = ''
          function(data)
            -- Check if the argument is a directory
            local is_directory = vim.fn.isdirectory(data.file) == 1

            if is_directory then
              -- Change to the directory
              vim.cmd.cd(data.file)
              -- Open nvim-tree
              require("nvim-tree.api").tree.open()
            end
          end
        '';
      }
    ];
}
