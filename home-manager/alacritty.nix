{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 8;
        normal = {
          family = "Iosevka";
          style = "Medium";
        };
        bold = {
          family = "Iosevka";
          style = "Medium";
        };
        italic = {
          family = "Iosevka";
          style = "Medium";
        };
      };

      colors = {
        primary = {
          background = "0x292d3e";
          foreground = "0x959dcb";
        };
        cursor = {
          text = "0x292d3e";
          cursor = "0x959dcb";
        };
        normal = {
          black = "0x292d3e";
          red = "0xf07178";
          green = "0xc3e88d";
          yellow = "0xffcb6b";
          blue = "0x82aaff";
          magenta = "0xc792ea";
          cyan = "0x89ddff";
          white = "0x959dcb";
        };
        bright = {
          black = "0x676e95";
          red = "0xff8b92";
          green = "0xddffa7";
          yellow = "0xffe585";
          blue = "0x9cc4ff";
          magenta = "0xe1acff";
          cyan = "0xa3f7ff";
          white = "0xffffff";
        };

        indexed_colors = [
          {
            index = 16;
            color = "0xf78c6c";
          }
          {
            index = 17;
            color = "0xff5370";
          }
          {
            index = 18;
            color = "0x444267";
          }
          {
            index = 19;
            color = "0x32374d";
          }
          {
            index = 20;
            color = "0x8796b0";
          }
          {
            index = 21;
            color = "0x959dcb";
          }
        ];
      };
    };
  };
}
