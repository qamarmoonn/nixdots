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

    displayManager.sessionCommands = ''
	xrandr --output DP-3 --mode 1920x1080 --rate 200.00
	xwallpaper --zoom ~/nixdots/walls/Cat_at_Play.png
    '';

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
  services.blueman.enable = true;

  users.users."haroon" = {
    isNormalUser = true;
    description = "qamar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      discord
    ];
  };

  programs.steam.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    emacs
    gnupg
    pinentry-curses
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
    xorg.xinit
    freetype
    xwallpaper
    fd
    pandoc
    shellcheck
    bash-language-server
    obsidian
    where-is-my-sddm-theme
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}
