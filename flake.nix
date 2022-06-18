{
  description = "NixOS + home-manager config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim nightly overlay
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      overlays = [ inputs.neovim-nightly-overlay.overlay ];
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;
    in rec {
      # System configurations
      # Accessible via 'nixos-rebuild'
      nixosConfigurations = {
        # FIXME: Replace with your hostname
        Whistler = nixosSystem {
          system = "x86_64-linux";
          # >> Main NixOS configuration file <<
          modules = [ ./nixos/configuration.nix ];
          # Make our inputs available to the config (for importing modules)
          specialArgs = { inherit inputs; };
        };
      };

      # Home configurations
      # Accessible via 'home-manager'
      homeConfigurations = {
        "igi-111@Whistler" = homeManagerConfiguration rec {
          username = "igi-111";
          stateVersion = "21.11";
          homeDirectory = "/home/${username}";
          system = "x86_64-linux";
          # >> Main home-manager configuration file <<
          configuration = ./home-manager/home.nix;
          # Make our inputs available to the config (for importing modules)
          extraSpecialArgs = {
            inherit inputs;
            inherit overlays;
          };
        };
      };
    };
}
