[
  {
    mode = "n";
    key = "<leader>b";
    action = "<cmd>Telescope buffers<CR>";
    options = {
      desc = "Buffers";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>g";
    action = "<cmd>Telescope git_branches<CR>";
    options = {
      desc = "Git Branches";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>f";
    action = "<cmd>Telescope find_files<CR>";
    options = {
      desc = "Find Files";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>sF";
    action = "<cmd>Telescope frecency<CR>";
    options = {
      desc = "Find Frecency Files";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>p";
    action = "<cmd>Telescope diagnostics<CR>";
    options = {
      desc = "Diagnostics";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>st";
    action = "<cmd>Telescope live_grep<CR>";
    options = {
      desc = "Live Grep";
      silent = true;
    };
  }
]
