{ config, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "b39647e52ed3c0b989e9d5c965e598ae4c38d7ef"; # the commit to fetch
    ref = "release-21.05"; # the branch to follow: release-xx.yy for stable nixos or master for nixos-unstable.
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./firefox
    ./vscode
    ./minecraft
    ./git
    ./xmonad
    ./rofi
  ];
}