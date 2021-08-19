{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./home
    ./display/xmonad.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set timezone
  time.timeZone = "America/New_York";

  # Enables UEFI boot
  boot.loader.systemd-boot.enable = true;

  # Defining users
  users.users.henry = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Enable audio
  hardware.pulseaudio.enable = true;

  # Package management
  environment.systemPackages = with pkgs;
  [
    haskellPackages.xmobar
    spotify playerctl
    firefox discord
    alacritty
    git
    minecraft multimc
  ];

  # I don't really have much to do with my HDD so I mount it to its own directory
  fileSystems."/home/henry/hdd" = {
    device = "/dev/disk/by-label/hdd";
    fsType = "ext4";
  };

  # Sudoedit is very useful
  environment.variables.SUDO_EDITOR = "code --wait";
}
