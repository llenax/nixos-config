[
  {
    mode = [ "n" ];
    key = "<leader>e";
    action = "<cmd>Oil<cr>";
    options = {
      desc = "Open Oil.nvim";
    };
  }
  {
    mode = [ "n" ];
    key = "<leader>pf";
    action = ''<cmd>lua require("oil").open_float(vim.fn.expand("%:h"))<cr>'';
    options = {
      desc = "Open Oil.nvim as float";
    };
  }
  {
    mode = [ "n" ];
    key = "<leader>h";
    action = ''<cmd>lua require("oil").toggle_hidden()<CR>'';
    options = {
      desc = "Toggle Hidden Oil.nvim";
    };
  }
]
