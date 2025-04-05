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
    key = "<leader>gb";
    action = "<cmd>Telescope git_branches<CR>";
    options = {
      desc = "Git Branches";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>gf";
    action = "<cmd>Telescope git_files<CR>";
    options = {
      desc = "Git Files";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>ff";
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
    key = "<leader>d";
    action = "<cmd>Telescope diagnostics<CR>";
    options = {
      desc = "Diagnostics";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>ft";
    action = "<cmd>lua LiveMultigrep()<CR>";
    options = {
      desc = "Live Multi Grep";
      silent = true;
    };
  }
]
