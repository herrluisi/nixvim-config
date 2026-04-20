{
  autoCmd = [
    {
      event = [ "BufWritePre" ];
      pattern = [ "*.tf" "*.tfvars" ];
      callback.__raw = ''
        function()
          vim.lsp.buf.format({ async = false })
        end
      '';
      desc = "Run terraform fmt on save via LSP";
    }
    {
      event = [ "BufWritePre" ];
      pattern = [ "*.py" ];
      callback.__raw = ''
        function()
          vim.lsp.buf.format({ async = false })
        end
      '';
      desc = "Run python fmt on save via LSP";
    }
  ];
}
