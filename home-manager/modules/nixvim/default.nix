{ lib, ... }:
{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.onedark.enable = true;
    nixpkgs.useGlobalPackages = true;

    extraConfigLua = ''
      -- function _G.toggle_hidden()
      --   local oil = require("oil")
      --   oil.toggle_hidden()
      -- end
      function OpenTerm()
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 15)
      end

      vim.api.nvim_create_autocmd('TermOpen', {
        group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
        callback = function()
          vim.opt.number = false
          vim.opt.relativenumber = false
        end
      })
      '';

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
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
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
