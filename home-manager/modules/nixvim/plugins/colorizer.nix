{
  colorizer = {
    enable = true;
    settings = {
      filetypes = {
        __unkeyed-1 = "*";
        __unkeyed-2 = "!vim";
        css = {
          rgb_fn = true;
          hsl_fn = true;
        };
        html = {
          names = false;
        };
      };
      user_commands = [
        "ColorizerToggle"
        "ColorizerReloadAllBuffers"
      ];
      user_default_options = {
        mode = "virtualtext";
        names = false;
        virtualtext = "■ ";
      };
    };
  };
}
