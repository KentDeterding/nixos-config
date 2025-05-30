{
	description = "A simple NixOS flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		nvf.url = "github:notashelf/nvf";
		nil.follows = "nvf/nil";
	};

	outputs = { self, nixpkgs, nvf, ... } @ inputs: {
		nixosConfigurations = {
			kentd = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = inputs;
				modules = [
					# import the system configuration
					./configuration.nix

					# setup home manager
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.kentd = import ./home.nix;
					}

                    # add nvf (configured neovim)
					./nvf-config.nix
				];
			};
		};
	};
}
