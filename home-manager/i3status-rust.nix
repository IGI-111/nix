{ config, lib, pkgs, ... }: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        theme = "native";
        blocks = [
          {
            block = "sound";
            on_click = "pavucontrol";
          }
          { block = "backlight"; }
          { block = "battery"; }
          {
            block = "time";
            format = "%a %d/%m %R";
          }
        ];
      };
    };
  };
}
