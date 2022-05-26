{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./i3.nix
    ./i3status-rust.nix
    ./rofi.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "igi-111";
  home.homeDirectory = "/home/igi-111";

  home.sessionVariables = { EDITOR = "nvim"; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    ripgrep
    brave
    xclip
    pavucontrol
    gcc
    neovim
    cargo
    rustc
    rustfmt
    nixfmt
    gopass
    gopass-jsonapi
    nitrogen
    iosevka
    fira
  ];

  fonts.fontconfig.enable = true;

  # Neovim nightly overlay
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

}
