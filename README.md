<p align="center">
  <img src="/images/logo.png" width="200" />
</p>

<h1 align="center">NixVim Configuration</h1>
Because who doesn't like a declarative configuration of Neovim?

![Screenshot of configuration](/images/demo.png)
<details>
<summary>More Screenshots</summary>

![Screenshot of configuration](/images/copilot.png)
![Screenshot of configuration](/images/trouble.png)
</details>

## How to run

To run the configuration, you can type the following:

```bash
nix run github:herrluisi/nixvim-config
```

If you want to try the configuration you can just add it temporary to your profile:
```bash
nix profile add github:herrluisi/nixvim-config
```

To remove it from your profile:
```bash
nix profile delete nixvim-config
```


## How to include as package

To include the configuration as a replacement for Neovim, you first need to add it as an input on your system
```
inputs.nixvim.url = "github:herrluisi/nixvim-config"
```

Then you can input this in your configuration.nix (be sure that you inherit inputs from your flake)
```
  environment = {
    systemPackages = with pkgs; [
      inputs.nixvim.packages.${system}.default
    ];
  };
```

## Config and Plugins

Descriptions of all the config files/plugins used in this configuration.

### root configuration
| Name | Configuration |
| --- | --- |
| default.nix | Keymap configuration and import management |
| options.nix | Indentations, tabstops, ui configuration |

### CMP configuration 
| Name | Configuration |
| --- | --- |
| cmp-copilot.nix | Configuration of copilot suggestion in code |
| cmp.nix | Selection of the suggestions |
| copilot-chat.nix | GitHub Copilot chat inside neovim |

### codestyle configuration
| Name | Configuration |
| --- | --- |
| auto-pairs.nix | Pairs brackets and quotes automatically |
| blankline.nix | Adds automatically Indentation in neovim |
| treesitter.nix | Syntax highlighting |

### git configuration
| Name | Configuration |
| --- | --- |
| git.nix | Adds git features |
| lazygit.nix | Adds a floating window with information about the current working directory |

### lsp configuration
| Name | Configuration |
| --- | --- |
| default.nix | configures default language servers |
| fidget.nix | Show LSP notifications in the bottom corner |
| none-ls.nix | Additional language server configurations |
| vimtex.nix | adds latex support (including compiling) |

### tracking
| Name | Configuration |
| --- | --- |
| wakatime.nix | adds time tracking to my projects |

### ui
| Name | Configuration |
| --- | --- |
| bufferline.nix | Tab-like interface for easy buffer navigation. |
| greeter.nix | A nice greeter which gives you a few features for starting your session |
| lightline.nix | Lightweight Statusline |
| mini-icons.nix | Icon provider |
| nvim-tree.nix | Adds a file explorer tree |

### utils
| Name | Configuration |
| --- | --- |
| autosave.nix | autosaves files |
| muren.nix | advanced search and replace |
| telescope.nix | Extendable fuzzy finder over lists. |
| toggleterm.nix | toggles the terminal |
| trouble.nix | Provides a pretty list for showing diagnostics, references, telescope results, quickfix and location lists | 
| which-key.nix | displays a popup help for keybindings |
| wilder.nix | Command auto completion and search function (with /) |



## Contributing

If there is something that you feel that is not quite right, or you have ideas for improvement, please submit an issue or a PR.

## Acknowledgements
 * [NixVim](https://github.com/nix-community/nixvim)


## Huge inspiring by: 
 * https://github.com/mikaelfangel/nixvim-config
