{ inputs, lib, ... }:
{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs = {
      source = inputs.nixpkgs-unstable;
    };
    
    extraConfigLua = builtins.readFile ./config.lua;

    opts = import ./opts.nix;

    globals = import ./globals.nix;

    imports = map (file: import ./plugins/${file}) (lib.attrNames(
        (lib.filterAttrs(filename: type:
          (type == "directory")
        ))
        (builtins.readDir ./plugins) 
    ));

    cmp = {
      enable = true;
      nvim-lsp.enable = true;
      path.enable = true;
      buffer.enable = true;
    };
    colorizer = {
      enable = true;
      css = {
        rgb = true;
        hsl = true;
      };
    };
    icons.enable = true;
    lsp ={
      enable = true;
      none-ls.enable = true;
      trouble.enable = true;
    };
    oil.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    quickfix.enable = true;
    lazydev.enable = true;
		

    # extraPlugins = with pkgs.vimPlugins; [
    #   mason-nvim
    # ];

    # extraConfigLuaPre = ''
    #   require('mason').setup()
    # '';

    keymaps = lib.concatLists (map (file: import ./keymaps/${file}) (lib.attrNames(
      (lib.filterAttrs(filename: type:
        type == "regular" &&
          builtins.match ".*\\.nix" filename != null
      ))
      (builtins.readDir ./keymaps)
    )));

    viAlias = true;
    vimAlias = true;
  };
}
