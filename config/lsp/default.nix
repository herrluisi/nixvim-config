{
  imports = [
    ./fidget.nix
    ./none-ls.nix
    ./vimtex.nix
  ];


  plugins = {
    lsp = {
      enable = true;
      servers = {
        # Common language servers
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        ruff.enable = true;
        terraformls.enable = true;
        tflint.enable = true;

        # Packages is set to null to rely on the system wide installed packages
        # this is done to avoid conflicts with the nixpkgs versions.
        angularls = {
          enable = true;
          package = null;
        };
        texlab = {
          enable = true;
          package = null;
        };
        marksman = {        # for markdown
          enable = true;
          package = null;
        };
        vtsls = {
          enable = true;
        };
        dockerls = {
          enable = true;
          package = null;
        };
        html = {
          enable = true;
          package = null;
        };
        cssls = {
          enable = true;
          package = null;
        };
      };
    };
    rustaceanvim.enable = true; 
  };
}
