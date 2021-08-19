{ config, lib, pkgs, ... }:

{
  services = {
    gnome.gnome-keyring.enable = true;
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };

    xserver = {
      enable = true;
      layout = "us";

      displayManager = {
        defaultSession = "none+xmonad";

        # I used arandr to generate this command for organizing the displays
        sessionCommands = ''
          ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-0 --off
        '';
      };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      # I have never purposely used caps lock
      xkbOptions = "caps:none";
    };
  };

  systemd.services.upower.enable = true;
}
