{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;

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

    plugins = {} // (
      (import ./plugins/telescope.nix)  
      // (import ./plugins/treesitter.nix)  
      // (import ./plugins/lsp.nix)  
      // (import ./plugins/neo-tree.nix)
      // (import ./plugins/oil.nix)
    );

    keymaps = []
      ++ import ./keymaps/telescope.nix
      ++ import ./keymaps/oil.nix;

    viAlias = true;
    vimAlias = true;
  };
}
