{ lib, config, ... }:
{
  imports = map (file: ./${file}) (lib.attrNames(
    (lib.filterAttrs(filename: type:
      filename != "default.nix" &&
        (type == "regular" && builtins.match ".*\\.nix" filename != null)
    ))
    (builtins.readDir ./.)
  ));

  options = {
    mini = {
      enable = lib.mkEnableOption "Enable mini-nvim plugin";
   	};
  };

  config = lib.mkIf config.mini.enable {
    plugins.mini = {
      enable = config.mini.enable;
      modules = {
        # files = {
        #   mappings = {
        #     close       = "q";
        #     go_in       = "l";
        #     go_in_plus  = "L";
        #     go_out      = "h";
        #     go_out_plus = "H";
        #     mark_goto   = "'";
        #     mark_set    = "m";
        #     reset       = "<BS>";
        #     reveal_cwd  = "@";
        #     show_help   = "g?";
        #     synchronize = "=";
        #     trim_left   = "<";
        #     trim_right  = ">";
        #   };
        #   options = {
        #     permanent_delete = true;
        #     use_as_default_explorer = true;
        #   };
        # };
        ai = {
          n_lines = 50;
          search_method = "cover_or_next";
        };
        comment = {
          mappings = {
            comment = "<leader>/";
            comment_line = "<leader>/";
            comment_visual = "<leader>/";
            textobject = "<leader>/";
          };
        };
        diff = {
          view = {
            style = "sign";
          };
        };
        git = {
          job = {
            git_executable = "git";
            timeout = 30000;
          };

          command = {
            split = "auto";
          };
        };
        hipatterns = {
          highlighters = {
            fixme = { pattern = "%f[%w]()FIXME()%f[%W]"; group = "MiniHipatternsFixme"; };
            todo  = { pattern = "%f[%w]()TODO()%f[%W]";  group = "MiniHipatternsTodo";  };

            hex_color = {
              __raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
            };
          };
        };
        trailspace = {
          only_in_normal_buffers = true;
        };
        starter = {
          content_hooks = {
            "__unkeyed-1.adding_bullet" = {
              __raw = "require('mini.starter').gen_hook.adding_bullet()";
            };
            "__unkeyed-2.indexing" = {
              __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
            };
            "__unkeyed-3.padding" = {
              __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
            };
          };
          evaluate_single = true;
          header = ''
            ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
            ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
            ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
            '';
          items = {
            "__unkeyed-1.buildtin_actions" = {
              __raw = "require('mini.starter').sections.builtin_actions()";
            };
            "__unkeyed-2.recent_files_current_directory" = {
              __raw = "require('mini.starter').sections.recent_files(10, false)";
            };
            "__unkeyed-3.recent_files" = {
              __raw = "require('mini.starter').sections.recent_files(10, true)";
            };
            "__unkeyed-4.sessions" = {
              __raw = "require('mini.starter').sections.sessions(5, true)";
            };
          };
        };
        completion = {
          delay = { completion = 100; info = 100; signature = 50; };
          window = {
            info = { height = 25; width = 80; border = null; };
            signature = { height = 25; width = 80; border = null; };
          };
          lsp_completion = {
            source_func = "completefunc";
            auto_setup = true;
            process_items = null;
            snippet_insert = null;
          };
          fallback_action = "<C-n>";
          mappings = {
            force_twostep = "<C-Space>";
            force_fallback = "<A-Space>";
            scroll_down = "<C-f>";
            scroll_up = "<C-b>";
          };
          set_vim_settings = true;
        };
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };
      };
    };
  };
}
