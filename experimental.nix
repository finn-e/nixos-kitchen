#TODO: add description

{ config, lib, pkgs, ... }:

{
	#idk why this is needed... that's why it's here.
	nix.allowedUsers = [ "@wheel" ];

}