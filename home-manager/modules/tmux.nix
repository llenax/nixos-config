{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    keyMode = "vi";
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [];

    extraConfig = ''
      set -g default-terminal "alacritty"
      set -g terminal-overrides ",alacritty:Tc"

      # Mouse works as expected
      set-option -g mouse on

      unbind l

      unbind %
      bind | split-window -h
      bind - split-window -v
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind-key -r q kill-pane

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      set -g status-style 'bg=#333333 fg=#5eacd3'

      # panes
      set -g pane-border-style 'fg=colour19 bg=colour0'
      set -g pane-active-border-style 'bg=colour0 fg=colour9'

      #source config file
      bind-key R run-shell ' \
      tmux source-file ~/.config/tmux/tmux.conf > /dev/null; \
      tmux display-message "sourced tmux.conf"'

      # run tmux-sessionizer
      bind-key -r f run-shell "tmux neww ~/.local/scripts/tmux-sessionizer"

      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      set-option -g detach-on-destroy off
      '';
  };
}
