{
  pkgs,
  ...
}:
{
  home.username = "myuser";
  home.homeDirectory = "/home/myuser";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
  ];

  programs.git.enable = true;
  programs.bash.enable = true;

  home.stateVersion = "24.11";
}
