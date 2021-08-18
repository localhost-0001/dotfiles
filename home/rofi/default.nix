{ pkgs, ... }:

{
  home-manager.users.henry.programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ./theme.rasi;
  };
}