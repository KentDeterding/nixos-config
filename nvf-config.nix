{ pkgs, lib, ... }:

{
    vim = {
        options = {
            tabstop = 4;
            shiftwidth = 4;
            softtabstop = 4;
        };

		theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
		};

		statusline.lualine.enable = true;
		telescope.enable = true;
		autocomplete.nvim-cmp.enable = true;
		
		lsp.enable = true;

		languages = {
			enableTreesitter = true;

			nix.enable = true;
			rust.enable = true;
		};
	};
}
