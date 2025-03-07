{ inputs, lib, ... }:
{
   programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs = {
      source = inputs.nixpkgs-unstable;
    };

    extraConfigLua = ''
      -- remove linenumber bg+fg
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='None', bg='None' })
      vim.api.nvim_set_hl(0, 'LineNr', { fg='None', bg='None' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='None', bg='None' })
      -- current line highlight
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "None", fg = "White", bold = true })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "None" })
      -- git signs / diagnostics column highlight
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
      -- CursorLineSign: Controls the sign column on the cursor line.
      vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "None" })
    

      -- function _G.toggle_hidden()
      --   local oil = require("oil")
      --   oil.toggle_hidden()
      -- end

      function OpenTerm()
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 10)
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
