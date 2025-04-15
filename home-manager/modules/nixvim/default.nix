{ inputs, pkgs, lib, ... }:
{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs = {
      source = inputs.nixpkgs-unstable;
    };

    colorschemes.vscode.enable = true;

    nixpkgs.config.allowUnfree = true;

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
      enable = false;
      nvim-lsp.enable = false;
      path.enable = false;
      buffer.enable = false;
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
      lspkind.enable = true;
    };
    oil.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    quickfix.enable = true;
    lazydev.enable = true;
    mini.enable = true;

    extraPlugins = (import ./plugins.nix) pkgs;
    extraConfigLuaPre = builtins.readFile ./config-pre.lua;

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
