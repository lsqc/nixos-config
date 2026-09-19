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

    kirikae.url = "git+https://git.sr.ht/~xqtc/kirikae";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-index-database,
      niri,
      disko,
      agenix,
      kirikae,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs-unstable { inherit system; };
      hosts = [
        "antlia"
        "t420"
      ];

      user = {
        name = "lsqc";
        email = "lsqc@nya.vodka";
      };

      commonModules = [

        disko.nixosModules.disko
        agenix.nixosModules.default

        ./common
      ];

      commonHomeModules = [
        {
          theme = import ./home/${user.name}/theme-settings.nix;
          _module.args.inputs = inputs;
        }

        niri.homeModules.niri
        nix-index-database.homeModules.default

        ./home/${user.name}
      ];
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hosts (
        host:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit user;
            inherit inputs;
          };
          modules = commonModules ++ [
            ./hosts/x86_64-linux/${host}
            ./hosts/x86_64-linux/${host}/disko.nix
          ];
        }
      );

      homeConfigurations = builtins.listToAttrs (
        map (
          host:
          nixpkgs.lib.nameValuePair "${user.name}@${host}" (
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit user;
                inherit host;
              };
              modules = commonHomeModules ++ [
                {
                  # inherit user;
                  # inherit host;
                }
              ];
            }
          )
        ) hosts
      );
    };
}
