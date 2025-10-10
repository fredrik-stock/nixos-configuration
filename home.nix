{ config, pkgs, ... }:

{

  home.username = "fredrik";
  home.homeDirectory = "/home/fredrik";
  home.stateVersion = "25.05";

    # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.home-manager.backupFileExtension = "backup";
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" 
        "z"
      ];
      theme = "robbyrussell";
    };
  };
  programs.fzf.enable = true;
  programs.git = {
    enable = true;
    userEmail = "fredrik@eltele.no";
    userName = "Fredrik Stock";
  };

  home.packages = with pkgs; [
    fzf
    zed-editor
    nerd-fonts.fira-code

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/waybar/config.jsonc".source = dotfiles/waybar.jsonc;
    ".config/hypr/hyprland.conf".source = dotfiles/hyprland.conf;
    ".config/hypr/start.sh".source = dotfiles/start.sh;
    
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };


}
