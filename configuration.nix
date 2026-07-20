{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
  "video=HDMI-A-1:1920x1080@200"
  ];

  networking.hostName = "nixos"; 

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

 
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
