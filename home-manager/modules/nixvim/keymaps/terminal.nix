[
  {
    mode = "n";
    key = ''<leader>t'';
    action = ''<cmd>lua OpenTerm()<CR>'';
    options = {
      desc = "open terminal";
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
