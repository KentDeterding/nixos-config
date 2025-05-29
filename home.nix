{ config, pkgs, ... }:

{
	# Setting up Home Manager
	home.stateVersion = "25.05";
	programs.home-manager.enable = true;

	home.username = "kentd";
	home.homeDirectory = "/home/kentd";

	home.packages = with pkgs; [
		nnn
		btop
		tree
		fish
	];

	programs.git = {
		enable = true;
		userName = "Kent Deterding";
		userEmail = "kentdeterding@gmail.com";
	};

	programs.alacritty = {
		enable = true;
		# window.opacity = 0.7;
	};
	
	programs.starship = {
		enable = true;
		enableFishIntegration = true;
	};
}
