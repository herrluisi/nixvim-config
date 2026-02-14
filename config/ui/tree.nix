{
  plugins.nvim-tree = {
    enable = true;
    autoLoad = true;
    openOnSetup = true;
    settings = {
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "✗";
              staged = "✓";
              renamed = "➜";
              untracked = "★";
              ignored = "◌";
            };
          };
        };
      };
    };
  };
}
