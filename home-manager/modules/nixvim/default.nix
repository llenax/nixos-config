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

      local terminal_state = {
        buf = -1,
        win = -1,
      }

      function CreateTerm()
        if vim.api.nvim_buf_is_valid(terminal_state.buf) then
          -- If buffer is valid but not in a window, open it in a split
          if not vim.api.nvim_win_is_valid(terminal_state.win) then
            vim.cmd("belowright split")
            vim.cmd("resize " .. math.floor(vim.o.lines * 0.3))
            vim.api.nvim_win_set_buf(0, terminal_state.buf)
            terminal_state.win = vim.api.nvim_get_current_win()
          else
            -- If already in a window, just switch to it
            vim.api.nvim_set_current_win(terminal_state.win)
          end
        else
          -- Create a new buffer and open in a split
          vim.cmd("belowright split")
          vim.cmd("resize " .. math.floor(vim.o.lines * 0.3))
          vim.cmd("terminal")
      
          -- Get the buffer and window
          terminal_state.buf = vim.api.nvim_get_current_buf()
          terminal_state.win = vim.api.nvim_get_current_win()
        end
      end
      
      vim.api.nvim_create_user_command("Terminal", function()
        if vim.api.nvim_win_is_valid(terminal_state.win) then
          vim.api.nvim_win_close(terminal_state.win, true)
          terminal_state.win = -1
        else
          CreateTerm()
        end
      end, {})
      
      vim.api.nvim_create_autocmd("TermOpen", {
        group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.scrolloff = 0
          vim.bo.filetype = "terminal"
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
