{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    prezto = {
      enable = true;
      prompt = { theme = "steeef"; };
      pmodules = [
        "git"
        "pacman"
        "ssh"
        "environment"
        "terminal"
        "editor"
        "history"
        "history-substring-search"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "prompt"
      ];
      historySubstring = {
        foundColor = "fg=blue";
        notFoundColor = "fg=red";
      };
    };
  };
}
