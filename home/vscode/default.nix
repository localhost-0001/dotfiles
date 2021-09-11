{ pkgs, ... }:
{
  home-manager.users.henry.programs.vscode = {
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
        name = "org-mode";
        publisher = "vscode-org-mode";
        version = "1.0.0";
        sha256 = "1dp6mz1rb8awrrpig1j8y6nyln0186gkmrflfr8hahaqr668il53";
      }
      {
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.14.2";
        sha256 = "17djwa2bnjfga21nvyz8wwmgnjllr4a7nvrsqvzm02hzlpwaskcl";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.21.7";
        sha256 = "160h8svp78snwq7bl6acbkmsb2664fiznnjqim9lh2bnyrlh69ww";
      }
    ];
    userSettings = {
      "editor.minimap.enabled" = false;
      "editor.renderWhitespace" = "none";
      "editor.fontSize" = 20;
      "workbench.editor.enablePreview" = false;
      "editor.wordWrap" = "on";
      "explorer.confirmDragAndDrop" = false;
      "workbench.startupEditor" = "none";
      "debug.console.closeOnEnd" = true;
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "files.trimTrailingWhitespace" = true;
      "workbench.editor.untitled.hint" = "hidden";
      "workbench.colorTheme" = "Default High Contrast";
      "window.restoreFullscreen" = true;
      "window.newWindowDimensions" = "maximized";
      "editor.fontFamily" = "Ac437 IBM VGA 8x16";
      "update.mode" = "none";
    };
  };
}