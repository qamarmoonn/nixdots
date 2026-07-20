{ config, pkgs, ... }:


{
  
  home.username = "haroon";
  home.homeDirectory = "/home/haroon";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      remake = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
    };
  };

  programs.git = {
  	enable = true;
	settings.user.email = "qamarmoon@proton.me";
	settings.user.name = "qamar";
  };

  home.file.".config/dwm".source = ./config/dwm;
  home.file.".config/st".source = ./config/st;

  home.packages = with pkgs; [
  	neovim
	ripgrep
	nil
	nixpkgs-fmt
	nodejs
	gcc

	symbola
  ];
}
