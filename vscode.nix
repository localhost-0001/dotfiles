{ pkgs, ... }:

let
  extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "rust";
      publisher = "rust-lang";
      version = "0.7.8";
      sha256 = "039ns854v1k4jb9xqknrjkj8lf62nfcpfn0716ancmjc4f0xlzb3";
    }
  ];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
      vscodeExtensions = extensions;
    };
in {
  config = {
    environment.systemPackages = [
      vscode-with-extensions
    ];
  };
}
