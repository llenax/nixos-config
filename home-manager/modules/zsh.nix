{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      #rebuild = "sudo nixos-rebuild switch";
      #delete-old-generations = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old";
      #collect-garbage = "sudo nix-collect-garbage -d";
      #svim = "sudo -E vim";
    };
    #initExtra = ''
    #  bindkey -s ^f "tmux-sessionizer\n"
    #'';


    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell"; # blinks is also really nice
    };
  };
  home.sessionVariables = {
    PATH = "$HOME/.local/scripts:$PATH";
  };
}
