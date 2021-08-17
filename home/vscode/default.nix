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
}