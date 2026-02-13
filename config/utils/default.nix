{ pkgs, ... }:
{
  imports = [
    ./autosave.nix
    ./telescope.nix
    ./toggleterm.nix
    ./trouble.nix
    ./which-key.nix
    ./wilder.nix
  ];
}
