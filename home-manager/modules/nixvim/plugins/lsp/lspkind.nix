{ lib, config, ... }:
{
  options = {
    lsp.lspkind.enable = lib.mkEnableOption "Enable lspkind plugin";
  };
  config = let
    cfg = config.lsp.lspkind;
  in lib.mkIf cfg.enable {
    plugins.lspkind = {
      enable = true;
      symbolMap = {
        Text = "󰉿";
        Method = "󰆧";
        Function = "󰊕";
        Constructor = "";
        Field = "󰜢";
        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "";
        Property = "󰜢";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈙";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TYPEPARAMETER = "";
      };
    };
  };
}
