[
  {
    mode = "n";
    key = ''<leader>t'';
    action = ''<cmd>Terminal<CR>'';
    options = {
      desc = "open-close terminal";
    };
  }
  {
    mode = "t";
    key = ''<esc><esc>'';
    action = "<c-\\><c-n>";
    options = {
      desc = "exit terminal mode";
    };
  }
]
