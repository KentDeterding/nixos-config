{ config, pkgs, ... }:

{
	# Setting up Home Manager
	home.stateVersion = "25.05";
	programs.home-manager.enable = true;

	home.username = "kentd";
	home.homeDirectory = "/home/kentd";

	home.packages = with pkgs; [
		# nnn
		tree
		fish
	];

    # programs.fish = {
    #     enable = true;
    #     # shellAliases = {
    #     #     "..." = "cd ../..";
    #     #     "zj" = "zellij";
    #     # };
    # };

    programs.zellij = {
        enable = true;
        enableFishIntegration = true;
    };

    # programs.btop = {
    #     enable = true;
    #     settings = {
    #         color_theme = "gruvbox";
    #     };
    # };

	programs.git = {
		enable = true;
		userName = "Kent Deterding";
		userEmail = "kentdeterding@gmail.com";

        extraConfig = {
            init.defaultBranch = "main";
        };
	};

	# programs.alacritty = {
	# 	enable = true;
	# 	window.opacity = 0.7;
	# };
	
	# programs.starship = {
	# 	enable = true;
	# 	enableFishIntegration = true;
	# };
}
