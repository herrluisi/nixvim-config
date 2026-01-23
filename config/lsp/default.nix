{ pkgs, ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # Common language servers
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        ruff.enable = true;

        # Packages is set to null to rely on the system wide installed packages
        # this is done to avoid conflicts with the nixpkgs versions.
        elixirls = {
          enable = true;
          package = null; # default pkgs.elixir-ls
          cmd = [ "elixir-ls" ];
        };
        gleam = {
          enable = true;
          package = null; # default pkgs.gleam
        };
        gopls = {
          enable = true;
          package = null; # default pkgs.gopls
        };
        kotlin_language_server = {
          enable = true;
          package = null; # default pkgs.kotlin-language-server
        };
        prolog_ls = {
          enable = true;
          package = null; # default pkgs.swi-prolog;
        };
        angularls = {
          enable = true;
          package = null;
        };
      };  
    };
    rustaceanvim.enable = true; 
  };
}
