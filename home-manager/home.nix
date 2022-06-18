{ config, lib, pkgs, overlays, ... }:

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

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  home.packages = with pkgs; [
    htop
    ripgrep
    fd
    fzf
    xclip
    pavucontrol
    gcc
    brave
    gopass
    gopass-jsonapi
    nitrogen
    neovim

    rustup
    rust-analyzer

    deno
    nodePackages.prettier

    ocaml

    stylua

    nixfmt

    iosevka
    fira
  ];

  fonts.fontconfig.enable = true;

  nixpkgs.overlays = overlays;
}
