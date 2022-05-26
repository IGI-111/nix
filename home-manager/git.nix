{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "IGI-111";
    userEmail = "igi-111@protonmail.com";
    extraConfig = { init.defaultBranch = "master"; };
  };
}
