{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.onedark.enable = true;

    nixpkgs.useGlobalPackages = true;

    # extraConfigLua = ''
    #   function _G.toggle_hidden()
    #     local oil = require("oil")
    #     oil.toggle_hidden()
    #   end
    #   '';

    opts = {} // 
      (import ./opts.nix);

    globals = {} //
      (import ./globals.nix);

    plugins = {
      web-devicons.enable = true;
    } // (
      (import ./plugins/telescope.nix)  
      // (import ./plugins/treesitter.nix)  
      // (import ./plugins/lsp.nix)  
      // (import ./plugins/neo-tree.nix)
      // (import ./plugins/cmp.nix)
      // (import ./plugins/oil.nix)
      // (import ./plugins/colorizer.nix)
    );

    # extraPlugins = with pkgs.vimPlugins; [
    #   mason-nvim
    # ];

    # extraConfigLuaPre = ''
    #   require('mason').setup()
    # '';

    keymaps = []
      ++ import ./keymaps/telescope.nix
      ++ import ./keymaps/oil.nix;

    viAlias = true;
    vimAlias = true;
  };
}
