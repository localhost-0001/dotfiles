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

  # GRUB with a windows entry
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.extraEntries = ''
    menuentry "Windows 10" {
      chainloader (hd0,1)+1
    }
  '';

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
    gimp
    haskellPackages.xmobar
    spotify playerctl
    firefox
    discord slack
    alacritty
    git
    minecraft multimc
  ];

  # Sudoedit is very useful
  environment.variables.SUDO_EDITOR = "code --wait";
}
