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
	];

	programs.alacritty = {
		enable = true;
	};
}
