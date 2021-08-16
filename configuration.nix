{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./vscode.nix
    ./home.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set timezone
  time.timeZone = "America/New_York";

  # Enables UEFI boot
  boot.loader.systemd-boot.enable = true;

  # Enabling GNOME
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # Disable default GNOME apps
  services.gnome.core-utilities.enable = false;

  # Defining users
  users.users.henry = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Package management
  environment.systemPackages = with pkgs; 
  [
    firefox spotify discord
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
  environment.variables.EDITOR = "code";
}
