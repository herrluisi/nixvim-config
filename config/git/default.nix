{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./lazygit.nix
  ];
}
