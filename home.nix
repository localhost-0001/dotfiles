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

    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "rust";
            publisher = "rust-lang";
            version = "0.7.8";
            sha256 = "039ns854v1k4jb9xqknrjkj8lf62nfcpfn0716ancmjc4f0xlzb3";
          }
          {
            name = "even-better-toml";
            publisher = "tamasfe";
            version = "0.14.2";
            sha256 = "17djwa2bnjfga21nvyz8wwmgnjllr4a7nvrsqvzm02hzlpwaskcl";
          }
        ];
        userSettings = {
          "editor.minimap.enabled" = false;
          "editor.renderWhitespace" = "none";
          "editor.fontSize" = 17;
          "terminal.integrated.defaultProfile.windows" = "Command Prompt";
          "workbench.editor.enablePreview" = false;
          "editor.wordWrap" = "on";
          "explorer.confirmDragAndDrop" = false;
          "workbench.startupEditor" = "none";
          "debug.console.closeOnEnd" = true;
          "javascript.updateImportsOnFileMove.enabled" = "always";
          "files.trimTrailingWhitespace" = true;
          "workbench.editor.untitled.hint" = "hidden";
        };
    };
  };
}