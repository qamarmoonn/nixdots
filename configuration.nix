{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.displayManager = {
    ly.enable = true;
  };


  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;   


    windowManager.dwm = {
	enable = true;
	package = pkgs.dwm.overrideAttrs {
	  src = ./config/dwm;
	};
    };

  };

  services.picom.enable = true;
  services.emacs = {
	enable = true;
	package = pkgs.emacs;
  };
  services.syncthing = {
	enable = true;
	openDefaultPorts = true;
  };

  users.users."haroon" = {
    isNormalUser = true;
    description = "qamar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	discord
  ];
  };

  nixpkgs.config.allowUnfree = true;

  
  environment.systemPackages = with pkgs; [
        neovim
	emacs
 	wget
	git
	firefox
	st
  	dmenu
	gcc
	gnumake
	fastfetch
	keepassxc
	xclip
	libX11
        libXft
        libXinerama
	freetype
	xwallpaper
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; 

}
