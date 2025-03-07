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
      enable = true;
      settings = {
        experimental = { ghost_text = true; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
        formatting = {
          format =
            # lua
            ''
            function(entry, vim_item)
              local icons = {
                Namespace = "󰌗",
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰆧",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈚",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰊄",
                Table = "",
                Object = "󰅩",
                Tag = "",
                Array = "[]",
                Boolean = "",
                Number = "",
                Null = "󰟢",
                String = "󰉿",
                Calendar = "",
                Watch = "󰥔",
                Package = "",
                Copilot = "",
                Codeium = "",
                TabNine = "",
              }
              
              if entry.source.name == "nvim_lsp" then
                  -- Check if it's a function signature (you can check based on entry's kind)
                  if vim_item.kind == "Function" then
                    -- Limit the number of parameters to display (e.g., showing only 3)
                    local MAX_PARAMS = 3
                    -- Capture function signature and parameters
                    local params = vim_item.abbr:match("%((.-)%)")  -- Capture parameters inside parentheses
                    if params then
                      local param_list = {}
                      for param in params:gmatch("%S+") do  -- Split by spaces
                        table.insert(param_list, param)
                      end
                      -- Truncate parameters if there are more than MAX_PARAMS
                      if #param_list > MAX_PARAMS then
                        params = table.concat({unpack(param_list, 1, MAX_PARAMS)}, " ") .. "..."
                      end
                      -- Replace the parameters in the function signature
                      vim_item.abbr = vim_item.abbr:gsub("%(.-%)", "(" .. params .. ")")
                    end
                  end

                  local file_name = ""

                  -- Check if documentation contains a filename reference
                  if entry.completion_item.documentation then
                      local doc = entry.completion_item.documentation
                      if type(doc) == "table" and doc.value then
                          doc = doc.value
                      end

                      -- Extract filename from 'From "..."'
                      -- local match = doc:match('From%s+"([^"]+)"')
                      -- local match = doc:match('From%s+`%"([^"]+)"`')
                      local match = doc:match('From%s+`[%"<](.-)[%">]`')
                      if match then
                          file_name = vim.fn.fnamemodify(match, ":t") -- Extract only the file name
                      end
                  end

                  -- Show file name only if available, otherwise leave blank
                  vim_item.menu = file_name ~= "" and file_name or "LSP"
              else
                  -- Show source name for non-LSP entries
                  vim_item.menu = string.upper(entry.source.name)
              end

              local icon = icons[vim_item.kind] or ""
              vim_item.kind = string.format("%s %s", icon, vim_item.kind or "")
              return vim_item
            end
            '';
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
          "<Tab>" =
            # lua 
            ''
            function(fallback)
              local line = vim.api.nvim_get_current_line()
              if line:match("^%s*$") then
                fallback()
              elseif cmp.visible() then
                --behavior = cmp.ConfirmBehavior.Insert,
                cmp.confirm({ select = true })
              else
                fallback()
              end
            end
            '';
        };
      };
    };

    # plugins.blink-cmp = {
    #   enable = true;
    #   settings = {
    #     appearance = {
    #       nerd_font_variant = "normal";
    #     };
    #     completion = {
    #       ghost_text.enabled = true;
    #       documentation = {
    #         auto_show = true;
    #       };
    #     };
    #     keymap = {
    #       preset = "super-tab";
    #     };
    #     sources = {
    #       providers = {
    #         buffer = {
    #           score_offset = -7;
    #         };
    #       };
    #     };
    #   };
    # };
  };
}
