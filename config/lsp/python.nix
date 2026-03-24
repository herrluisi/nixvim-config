{
  plugins.lsp.servers.pyright = {
    enable = true;
    settings = {
      pyright = {
        disableOrganizeImports = false;
      };
      python.analysis = {
        autoSearchPaths = true;
        diagnosticMode = "workspace";
        useLibraryCodeForTypes = true;
        typeCheckingMode = "basic";
      };
    };
  };
}
