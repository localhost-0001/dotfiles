{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-21.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs?ref=master";
  };

  # PACKAGES

  outputs = {
      self
      , nixpkgs
      , nixpkgs-unstable
      , ...
    }@inputs:
      let
        inherit (nixpkgs-unstable.lib) nixosSystem;
        supportedSystems = [ "x86_64-linux"];
        forAllSystems' = systems: f: nixpkgs.lib.genAttrs systems (system: f system);
        forAllSystems = forAllSystems' supportedSystems;

      in {

        nixosConfigurations.desktop = nixosSystem (import ./systems/desktop.nix inputs);
        desktop = self.nixosConfigurations.desktop.config.system.build.toplevel;

        allSystems =
          let
            pkgs = system: import nixpkgs { system = "x86_64-linux"; };
            linkFarm = system: attrs:
              let
                pkgs' = pkgs system;
              in
                pkgs'.linkFarm "allSystems-${system}"
                (pkgs'.lib.mapAttrsToList (n: v: { name = n; path = v; }) attrs);
                nixos = name: self.nixosConfigurations.${name}.config.system.build.toplevel;
          in
            {
              x86_64-linux = linkFarm "x86_64-linux"
                {
                   desktop = nixos "desktop";
                };
            };
        overlays = {

        };
        packages =
          forAllSystems (system:
            let
              mkPkg'' =
                pkgs: name: package:
                (import pkgs { inherit system;
                               overlays = nixpkgs.lib.mapAttrsToList
                                 (_: v: v) self.overlays;
                             }).teletypeOne."${package}";
              mkPkg' = mkPkg'' nixpkgs-unstable;
              mkPkg = name: mkPkg'' nixpkgs-unstable name name;
            in { }
          );
      };
}
