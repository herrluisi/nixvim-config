{ pkgs, ... }:
{
  imports = [
    ./autosave.nix
    ./muren.nix
    ./telescope.nix
    ./toggleterm.nix
    ./trouble.nix
    ./which-key.nix
    ./wilder.nix
  ];
}
