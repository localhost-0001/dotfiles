{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.teletypeOne.communication;
in {
  options.teletypeOne.communication = {
    free = mkEnableOption "Install free communication tools.";
    nonFree = mkEnableOption "Install nonfree communication tools.";
    bullshit = mkEnableOption "Install dumb communication tools.";
    mailGui = mkEnableOption "Install and add gui mail tools.";
    mailTui = mkEnableOption "Install and add tui mail tools";
  };

  config = (mkMerge [
    (mkIf (cfg.free) {
      environment.systemPackages = with pkgs; [signal-desktop element-desktop];
    })

    (mkIf (cfg.nonFree) {
      environment.systemPackages = with pkgs; [discord];
    })

    (mkIf (cfg.bullshit) {
      environment.systemPackages = with pkgs; [teams];
    })

    (mkIf cfg.mailGui {
      environment.systemPackages = with pkgs; [thunderbird-78];
    })

    (mkIf cfg.mailTui {
      environment.systemPackages = with pkgs; [neomutt curl isync msmtp pass lynx notmuch abook urlview];
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryFlavor = "curses";
      };
    })
  ]);
}
