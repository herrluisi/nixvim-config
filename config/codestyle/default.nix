{ pkgs, ... }:
{
  imports = [
    ./auto-pairs.nix
    ./blankline.nix
    ./treesitter.nix
  ];
}
