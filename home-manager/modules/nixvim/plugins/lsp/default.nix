{ pkgs, lib, config, ... }:
{
  imports = map (file: ./${file}) (lib.attrNames(
    (lib.filterAttrs(filename: type:
      filename != "default.nix" &&
        (type == "regular" && builtins.match ".*\\.nix" filename != null)
    ))
    (builtins.readDir ./.)
  ));

  options = {
    lsp.enable = lib.mkEnableOption "Enable lsp plugin";
  };

  config = lib.mkIf config.lsp.enable {

    lsp.none-ls.enable = lib.mkDefault false;
    lsp.trouble.enable = lib.mkDefault false;

    plugins.lsp = {
      enable = config.lsp.enable;
      inlayHints = true;

      servers = {
        ccls.enable = true;
        pyright.enable = true;
        clangd.enable = true;
        dockerls.enable = true;
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        ts_ls.enable = true;
        intelephense = {
          enable = true;
          package = pkgs.intelephense;
        };
        tailwindcss = {
          enable = true;
          filetypes = [ "html" "css" "javascript" "typescript" "jsx" "tsx" ];
        };

        lua_ls = {
          enable = true;
          settings = {
            Lua = {
              diagnostics.globals = [ "vim" ];
            };
          };
        };

        nixd = {
          enable = true;

          settings = {
            formatting.command = [ "nixpkgs-fmt" ];
            nixpkgs.expr = "import <nixpkgs> {}";
          };
        };

      };

      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
          gd = "definition";
          grr = "references";
          K = "hover";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
        };
      };
    };
  };
}
