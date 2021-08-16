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
    ];

    home-manager.users.henry = {
      programs.firefox = {
        enable = true;
      };

      programs.git = {
        enable = true;
        extraConfig = {
          credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
        };
      };

      home.file = {
        ".mozzila/firefox/main/user.js".source = ./firefox/user.js;
        ".minecraft/options.txt".source = ./minecraft/options.txt;
        ".config/Code/User/settings.json".source = ./vscode/settings.json;
      };
    };
}
