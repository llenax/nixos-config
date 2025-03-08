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
