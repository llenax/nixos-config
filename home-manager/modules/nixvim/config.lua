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


-- Toggle hlsearch if it's on, otherwise just do "enter"
function EnterRemap()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return vim.keycode "<CR>"
  end
end

local terminal_state = {
  buf = -1,
  win = -1,
}

function CreateTerm(path)
  local terminal_height = 0.2
  if vim.api.nvim_buf_is_valid(terminal_state.buf) then
    -- If buffer is valid but not in a window, open it in a split
    if not vim.api.nvim_win_is_valid(terminal_state.win) then
      vim.cmd("belowright split")
      vim.cmd("resize " .. math.floor(vim.o.lines * terminal_height))
      vim.api.nvim_win_set_buf(0, terminal_state.buf)
      terminal_state.win = vim.api.nvim_get_current_win()
    else
      -- If already in a window, just switch to it
      vim.api.nvim_set_current_win(terminal_state.win)
    end
  else
    -- Create a new buffer and open in a split
    vim.cmd("belowright split")
    vim.cmd("resize " .. math.floor(vim.o.lines * terminal_height))
    vim.cmd("terminal cd " .. path .. " && zsh")

    -- Get the buffer and window
    terminal_state.buf = vim.api.nvim_get_current_buf()
    terminal_state.win = vim.api.nvim_get_current_win()
  end
end

vim.api.nvim_create_user_command("Terminal", function(opts)
  local path = vim.loop.cwd()

  if opts.args and string.len(opts.args) > 0 then
    local args = vim.split(opts.args, " ")
    path = args[1]:gsub("\"", "")
    if path:sub(1, #"!") == "!" then
      path = path:sub(2)
      path = loadstring("return " .. path)()
    end
  end

  if vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, true)
    terminal_state.win = -1
  else
    CreateTerm(path)
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

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

function LiveMultigrep(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.loop.cwd()

  local finder = finders.new_async_job {
      command_generator = function (prompt)
        if not prompt or prompt == "" then
          return nil
        end
        local pieces = vim.split(prompt, "  ")
        local args = { "rg" }
        if pieces[1] then
          table.insert(args, "-e")
          table.insert(args, pieces[1])
        end

        if pieces[2] then
          table.insert(args, "-g")
          table.insert(args, pieces[2])
        end

        return vim.iter {
          args,
          { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
        }:flatten():totable()
      end,
      entry_maker = make_entry.gen_from_vimgrep(opts),
      cwd = opts.cwd,
  }


  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()

end
