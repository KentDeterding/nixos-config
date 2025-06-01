{ pkgs, nvf, ... }:
{
	imports = [ nvf.nixosModules.default ];

	programs.nvf.enable = true;
	programs.nvf.settings.vim = {

		options = {
		    tabstop = 4;
		    shiftwidth = 4;
		    softtabstop = 4;
            scrolloff = 4;
            smartindent = true;
		};

		theme = {
		    enable = true;
		    name = "gruvbox";
		    style = "dark";
		};

        # Didn't do what I wanted, but keymaps do work this way
        # keymaps = [
        #     {
        #         mode = "n";
        #         key = "<leader><leader>";
        #         action = ":Telescope find_files";
        #         silent = true;
        #     }
        # ];

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
