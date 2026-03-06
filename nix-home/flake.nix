{
  description = "NixOS + Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... }@inputs:
    let
      macSystem = "aarch64-darwin";
      nixosSystem = "x86_64-linux";

      pkgsMac = import nixpkgs { system = macSystem; };
    in
    {
      # Home Manager config for your Mac
      homeConfigurations."rengers" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsMac;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
      };

      # NixOS config (kept as-is)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = nixosSystem;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.default
        ];
      };
    };
}

