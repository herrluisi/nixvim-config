{ pkgs, ... }:
{
  imports = [
    ./bufferline.nix
    ./lightline.nix
    ./nvim-tree.nix
  ];
}
