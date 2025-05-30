{
	description = "A simple NixOS flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager.url = "github:nix-community/home-manager/release-25.05";
		nvf.url = "github:notashelf/nvf";
	};

	outputs = { self, nixpkgs, nvf, ... }@inputs: {
		
		packages."x86_64-linux".default =
			(nvf.lib.neovimConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				modules = [ ./nvf-config.nix ];
			}).neovim;
		
		nixosConfigurations = {
			kentd = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					# make wrapped neovim available in system packages
					# ({ pkgs, ... }: {
						# environment.systemPackages = [ self.packages.${pkgs.stdenv.system}.neovim ];
					# })
					nvf.nixosModules.default

					# import the system configuration
					./configuration.nix

					# setup home manager
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.kentd = import ./home.nix;
					}
				];
			};
		};
	};
}
