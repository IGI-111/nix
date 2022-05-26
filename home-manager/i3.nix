{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;

    windowManager.i3 = let mod = "Mod4";
    in {
      package = pkgs.i3-gaps;
      enable = true;
      config = {
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
        keybindings = let cfg = config.xsession.windowManager.i3;
        in lib.mkOptionDefault {
          "${mod}+Return" = "exec ${cfg.config.terminal}";
          "${mod}+Shift+a" = "kill";
          "${mod}+c" = "split h";
          "${mod}+v" = "split v";
          "${mod}+q" = "focus parent";
        };
        bars = [{
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${
              ~/.config/i3status-rust/config-top.toml
            }";
        }];
        startup = [{ command = "nitrogen --restore"; }];
      };
    };
  };
}
