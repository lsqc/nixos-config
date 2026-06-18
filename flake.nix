{
  description = "personal nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko.url = "github:nix-community/disko";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    niri = {
      url = "github:sodiboo/niri-flake/very-refactor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri,
      disko,
      agenix,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      commonModules = [
        disko.nixosModules.disko
        agenix.nixosModules.default
      ];
    in
    {
      nixosConfigurations = {

        t420 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = commonModules ++ [
            ./hosts/x86_64-linux/t420
            ./hosts/x86_64-linux/t420/disko-config.nix
          ];
        };
      };

      homeConfigurations = {

        "t420" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              _module.args.inputs = inputs;
              host = "t420";
              theme = import ./home/lsqc/theme-settings.nix;
            }
            niri.homeModules.niri
            ./home/lsqc
          ];
        };
      };
    };
}
