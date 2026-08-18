{ pkgs, ... }:

{
    home.packages = with pkgs; [
	# cli
	fastfetch
	mpv

	# gui
	gimp
    ];


}
