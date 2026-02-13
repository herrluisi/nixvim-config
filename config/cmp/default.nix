{ pkgs, ... }:
{
  imports = [
    ./cmp-copilot.nix
    ./cmp.nix
    ./copilot-chat.nix
  ];
}
