{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;

    windowManager.i3 = let
      mod = "Mod4";
      fonts = {
        size = 10.0;
        names = [ "Fira Sans" ];
      };
      colors = [
        "#292D3E"
        "#444267"
        "#32374D"
        "#676E95"
        "#8796B0"
        "#959DCB"
        "#959DCB"
        "#FFFFFF"
        "#F07178"
        "#F78C6C"
        "#FFCB6B"
        "#C3E88D"
        "#89DDFF"
        "#82AAFF"
        "#C792EA"
        "#FF5370"
      ];
    in {
      package = pkgs.i3-gaps;
      enable = true;
      config = {
        fonts = fonts;
        modifier = mod;
        defaultWorkspace = "workspace number 1";
        terminal = "alacritty";
        menu = "rofi -show run";
        gaps = {
          inner = 10;
          smartGaps = true;
        };
        window = {
          border = 1;
          titlebar = false;
        };
        floating = {
          border = 1;
          titlebar = false;
        };
        colors = {
          focused = {
            border = builtins.elemAt colors 5;
            background = builtins.elemAt colors 13;
            text = builtins.elemAt colors 0;
            indicator = builtins.elemAt colors 13;
            childBorder = builtins.elemAt colors 1;
          };
          focusedInactive = {
            border = builtins.elemAt colors 1;
            background = builtins.elemAt colors 1;
            text = builtins.elemAt colors 5;
            indicator = builtins.elemAt colors 3;
            childBorder = builtins.elemAt colors 0;
          };
          unfocused = {
            border = builtins.elemAt colors 1;
            background = builtins.elemAt colors 0;
            text = builtins.elemAt colors 5;
            indicator = builtins.elemAt colors 1;
            childBorder = builtins.elemAt colors 0;
          };
          placeholder = {
            border = builtins.elemAt colors 0;
            background = builtins.elemAt colors 0;
            text = builtins.elemAt colors 5;
            indicator = builtins.elemAt colors 0;
            childBorder = builtins.elemAt colors 0;
          };
          background = builtins.elemAt colors 7;
        };
        keybindings = let cfg = config.xsession.windowManager.i3;
        in lib.mkOptionDefault {
          "${mod}+Return" = "exec ${cfg.config.terminal}";
          "${mod}+Shift+a" = "kill";
          "${mod}+c" = "split h";
          "${mod}+v" = "split v";
          "${mod}+q" = "focus parent";
        };
        bars = [{
          fonts = fonts;
          position = "top";
          statusCommand = ''
            ${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml
          '';
          colors = {
            background = builtins.elemAt colors 0;
            separator = builtins.elemAt colors 1;
            statusline = builtins.elemAt colors 4;
            focusedWorkspace = {
              border = builtins.elemAt colors 0;
              background = builtins.elemAt colors 13;
              text = builtins.elemAt colors 0;
            };
            activeWorkspace = {
              border = builtins.elemAt colors 0;
              background = builtins.elemAt colors 3;
              text = builtins.elemAt colors 0;
            };
            inactiveWorkspace = {
              border = builtins.elemAt colors 0;
              background = builtins.elemAt colors 1;
              text = builtins.elemAt colors 5;
            };
            urgentWorkspace = {
              border = builtins.elemAt colors 0;
              background = builtins.elemAt colors 8;
              text = builtins.elemAt colors 0;
            };
            bindingMode = {
              border = builtins.elemAt colors 0;
              background = builtins.elemAt colors 10;
              text = builtins.elemAt colors 0;
            };
          };
        }];
        startup = [{ command = "nitrogen --restore"; }];
      };
    };
  };
}
