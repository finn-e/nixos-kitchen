#TODO: add description

{ config, lib, pkgs, ... }:

{
	#test out editors. might want to switch. doubt it.
  environment.systemPackages = with pkgs; [
    atom
    sublime3 
    vscodium
  ];

	#idk why this is needed... that's why it's here.
	nix.allowedUsers = [ "@wheel" ];

}