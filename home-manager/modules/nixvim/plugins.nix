{ pkgs, ... }:
let
  tjdevries-php-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "php-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "tjdevries";
      repo = "php.nvim";
      rev = "a0aa937";
      sha256 = "0haidnf99yfnx6gnr2ba6542dmhjgb8n1swnwmw6f3a9v6jyylnh";
    };
  };
in
with pkgs.vimPlugins; [
  supermaven-nvim
  tjdevries-php-nvim
]

