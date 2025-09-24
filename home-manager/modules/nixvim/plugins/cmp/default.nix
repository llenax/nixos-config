{ lib, config, ... }:
{
  imports = map (file: ./${file}) (lib.attrNames(
    (lib.filterAttrs(filename: type:
      filename != "default.nix" &&
        (type == "regular" && builtins.match ".*\\.nix" filename != null)
    ))
    (builtins.readDir ./.)
  ));

  options = {
    cmp.enable = lib.mkEnableOption "Enable cmp plugin";
  };

  config = lib.mkIf config.cmp.enable {

    cmp.nvim-lsp.enable = lib.mkDefault false;
    cmp.path.enable = lib.mkDefault false;
    cmp.buffer.enable = lib.mkDefault false;

    plugins.cmp = {
      enable = config.cmp.enable;
      settings = {
        experimental = { ghost_text = true; };
        sources = [
          { name = "supermaven"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
        formatting = {
          format = builtins.readFile ./lua/format.lua;
        };
        window = {
          completion = {
            scrollbar = false;
          };
        };
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" = builtins.readFile ./lua/tab.lua;
        };
      };
    };
  };
}
