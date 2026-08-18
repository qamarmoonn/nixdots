{ config, pkgs, ... }:


{
  imports =
    [
      ./modules/suckless.nix
      ./modules/util.nix
    ];

  home.username = "haroon";
  home.homeDirectory = "/home/haroon";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      nrs = "sudo nixos-rebuild switch --flake ~/nixdots#nixos";
      two = "xrandr --output DP-3 --mode 1920x1080 -r 200";
      thewall = "xwallpaper --zoom ~/nixos-dotfiles/walls/Cat_at_Play.png";
    };
  };

  programs.git = {
    enable = true;
    settings.user.email = "qamarmoon@proton.me";
    settings.user.name = "qamar";
  };

  home.file.".config/dwm".source = ./config/dwm;
  home.file.".config/nvim".source = ./config/nvim;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc

    symbola
    flameshot

    prismlauncher
  ];

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
  ];
}
