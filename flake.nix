{
  description = "Flake for legion";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:Jasdeep-Dhillon/helium-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    run0-sudo-shim = {
      url = "github:lordgrimmauld/run0-sudo-shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # vibepanel = {
    #   url = "github:prankstr/vibepanel";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # cachyos-kernel = {
    #   url = "github:xddxdd/nix-cachyos-kernel/release";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./system
            ./hardware-configuration.nix
          ];
        };
        legion = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./system
            ./system/legion
            ./hardware-configuration.nix
          ];

        };
      };

      homeConfigurations = {
        "arc" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
