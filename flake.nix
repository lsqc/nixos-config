{
  description = "personal nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    disko.url = "github:nix-community/disko";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    niri = {
      url = "github:sodiboo/niri-flake/very-refactor";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    helium = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      self,
      # nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-index-database,
      niri,
      disko,
      agenix,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs-unstable { inherit system; };

      commonModules = [
        disko.nixosModules.disko
        agenix.nixosModules.default
      ];

      commonHomeModules = [
        {
          _module.args.inputs = inputs;
          theme = import ./home/lsqc/theme-settings.nix;
        }

        niri.homeModules.niri
        nix-index-database.homeModules.default

        ./home/lsqc
      ];
    in
    {
      nixosConfigurations = {

        t420 = nixpkgs-unstable.lib.nixosSystem {
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
          modules = commonHomeModules ++ [
            {
              host = "t420";
            }
          ];
        };
        "antlia" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = commonHomeModules ++ [
            {
              host = "antlia";
            }
          ];
        };
      };
    };
}
