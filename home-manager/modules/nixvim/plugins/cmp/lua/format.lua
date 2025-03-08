function (entry, vim_item)
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
